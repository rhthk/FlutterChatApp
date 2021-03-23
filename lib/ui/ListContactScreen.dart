import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/contact.dart';
import 'package:http/http.dart' as http;

class ListContact extends StatefulWidget {
  @override
  _ListContactState createState() => _ListContactState();
}

class _ListContactState extends State<ListContact> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  List<Contact> _data = [
    Contact(
      5,
      "Lorem",
      "R",
      "huhu",
      1,
      "https://picsum.photos/id/123/200",
      "10:30",
      true,
    ),
    Contact(
      6,
      "Ipsum",
      "P",
      "kuku",
      2,
      "https://picsum.photos/id/135/200",
      "11:48",
      false,
    ),
    Contact(
      5,
      "Dolor",
      "Q",
      "aaaa",
      3,
      "https://picsum.photos/id/234/200",
      "08:53",
      false,
    )
  ];

  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar("App"),
      persistentFooterButtons: _footerButtons(),
      body: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Theme.of(context).canvasColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0),
              topRight: Radius.circular(25.0),
              bottomLeft: Radius.circular(25.0),
              bottomRight: Radius.circular(25.0)),
        ),
        width: (MediaQuery.of(context).size.width),
        height: (MediaQuery.of(context).size.height),
        child: AnimatedList(
          key: _listKey,
          initialItemCount: _data.length,
          itemBuilder: (context, index, animation) =>
              _buildItem(context, _data[index], animation, index),
        ),
      ),
    );
  }

  Widget _buildItem(BuildContext context, Contact item,
      Animation<double> animation, int index) {
    TextStyle textStyle = new TextStyle(fontSize: 20);

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizeTransition(
        sizeFactor: animation,
        axis: Axis.vertical,
        child: ListTile(
          leading: Hero(
            tag: item.number,
            child: CircleAvatar(
              onBackgroundImageError: (obj, trace) {
                print(obj);
              },
              backgroundImage: NetworkImage(item.url),
              // child: Icon(Icons.account_circle),
            ),
          ),
          title: Text(item.firstName, style: textStyle),
          subtitle: Text(item.lastActive),
          onTap: () {
            Navigator.pushNamed(context, "chatScreen", arguments: {
              'name': {
                'firstName': item.firstName,
                'lastName': item.lastName,
              },
              'status': item.status,
              'number': item.number,
              'image': item.url,
              'isOnline': item.isOnline,
              'lastActive': item.lastActive,
            });
          },
        ),
      ),
    );
  }

  Future<List<Contact>> fetchContacts(http.Client client) async {
    final response = //await client.get("http://localhost:4000/contacts");
        await client.get("https://chat-2007.herokuapp.com/contacts");
    // Use the compute function to run parseContacts in a separate isolate.
    return compute(parsePhotos, response.body);
  }

  // A function that converts a response body into a List<Contact>.
  // ignore: missing_return
  List<Contact> parsePhotos(String responseBody) {
    // print(responseBody);
    try {
      final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
      return parsed.map<Contact>((json) => Contact.fromJson(json)).toList();
    } catch (e) {
      print(e.toString());
    }
  }

  void _addAnItem() async {
    counter++;
    final List<Contact> contacts = await fetchContacts(http.Client());
    // _data.insert(0, contacts.first);
    _data.insertAll(0, contacts);
    _listKey.currentState.insertItem(0);
  }

  void _removeLastItem() {
    Contact itemToRemove = _data[0];

    _listKey.currentState.removeItem(
      0,
      (BuildContext context, Animation<double> animation) =>
          _buildItem(context, itemToRemove, animation, 0),
      duration: const Duration(milliseconds: 250),
    );

    _data.removeAt(0);
  }

  void _removeAllItems() {
    final int itemCount = _data.length;

    for (var i = 0; i < itemCount; i++) {
      Contact itemToRemove = _data[0];
      _listKey.currentState.removeItem(
        0,
        (BuildContext context, Animation<double> animation) =>
            _buildItem(context, itemToRemove, animation, i),
        duration: const Duration(milliseconds: 250),
      );
      _data.removeAt(0);
    }
  }

  AppBar _appBar(String title) {
    return AppBar(
      title: Text(title),
      leading: Icon(Icons.message),
      elevation: 0.0,
      actions: [
        PopupMenuButton<String>(
          onSelected: (arg) {
            if (arg == "Profile")
              Navigator.pushNamed(context, "myAccountScreen");
            else if (arg == "Settings")
              Navigator.pushNamed(context, "settingsScreen");
          },
          itemBuilder: (BuildContext context) {
            return {'Profile', 'Settings'}.map((String choice) {
              return PopupMenuItem<String>(
                value: choice,
                child: Text(choice),
              );
            }).toList();
          },
        ),
      ],
    );
  }

  _footerButtons() {
    return <Widget>[
      RaisedButton(
        child: Text(
          'Add',
        ),
        onPressed: () {
          _addAnItem();
        },
      ),
      RaisedButton(
        child: Text(
          'Remove last',
        ),
        onPressed: () {
          _removeLastItem();
        },
      ),
      RaisedButton(
        child: Text(
          'Remove all',
        ),
        onPressed: () {
          _removeAllItems();
        },
      ),
    ];
  }
}
