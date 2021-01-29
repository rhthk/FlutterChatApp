
import 'package:flutter/material.dart';
import 'package:flutterapp/model/contact.dart';

class ListContact extends StatefulWidget {
  @override
  _ListContactState createState() => _ListContactState();
}

class _ListContactState extends State<ListContact> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();

  List<Contact> _data = [
    Contact(5, "Lorem", "R", "huhu", 10,"https://picsum.photos/id/123/200"),
    Contact(6, "Ipsum", "P", "kuku", 10,"https://picsum.photos/id/135/200"),
    Contact(5, "Dolor", "Q", "aaaa", 10,"https://picsum.photos/id/234/200")
  ];

  int counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar("App"),
      persistentFooterButtons: <Widget>[
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
      ],
      body: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.black12,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
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

  Widget _buildItem(
      BuildContext context, Contact item, Animation<double> animation,int index) {
    TextStyle textStyle = new TextStyle(fontSize: 20);

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizeTransition(
        sizeFactor: animation,
        axis: Axis.vertical,
        child: ListTile(
          leading: Hero(
            tag: item.fname,
            child: CircleAvatar(onBackgroundImageError: (obj,trace){print(obj);},
              backgroundImage: NetworkImage(item.url),
              // child: Icon(Icons.account_circle),
            ),
          ),
          title: Text(item.fname, style: textStyle),
          subtitle: Text(item.status),
          onTap: () {
            Navigator.pushNamed(context,"chatScreen",arguments:
              {'fname':item.fname,
                'lname':item.lname,
                'status':item.status,
                'number':item.number,
                'image':item.url,
              }
            );
          },
        ),
      ),
    );
  }

  void _addAnItem() {
    counter++;
    _data.insert(0, Contact(3, counter.toString(), counter.toString(), counter.toString(), 26,"https://picsum.photos/id/$counter/200/300"));
    _listKey.currentState.insertItem(0);
  }

  void _removeLastItem() {
    Contact itemToRemove = _data[0];

    _listKey.currentState.removeItem(
      0,
          (BuildContext context, Animation<double> animation) =>
          _buildItem(context, itemToRemove, animation,0),
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
            _buildItem(context, itemToRemove, animation,i),
        duration: const Duration(milliseconds: 250),
      );
      _data.removeAt(0);
    }
  }

 AppBar _appBar(String title) {
    return AppBar(
      title: Text(title),
      leading: Icon(Icons.message),
      backgroundColor: Colors.white,
      elevation: 0.0,
      actions: [
        PopupMenuButton<String>(
          onSelected: (arg){
            if(arg=="Profile")
              Navigator.pushNamed(context, "myAccountScreen");
            else if(arg=="Settings")
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
}
