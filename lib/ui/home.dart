import 'package:flutter/material.dart';
import 'package:flutterapp/model/contact.dart';

class ListContact extends StatefulWidget {
  @override
  _ListContactState createState() => _ListContactState();
}

class _ListContactState extends State<ListContact> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  List<Contact> _data = [
    Contact(5, "Lorem", "R", "huhu", 10),
    Contact(6, "Ipsum", "P", "kuku", 10),
    Contact(5, "dolor", "Q", "aaaa", 10)
  ];

  int counter=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),//TODO:
      persistentFooterButtons: <Widget>[
        RaisedButton(
          child: Text(
            'Add an item',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          onPressed: () {
            _addAnItem();
          },
        ),
        RaisedButton(
          child: Text(
            'Remove last',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
          onPressed: () {
            _removeLastItem();
          },
        ),
        RaisedButton(
          child: Text(
            'Remove all',
            style: TextStyle(fontSize: 20, color: Colors.white),
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
            child: CircleAvatar(
              child: Icon(Icons.account_circle),
            ),
          ),
          title: Text(item.fname, style: textStyle),
          subtitle: Text(item.status),
          onTap: () {
            Navigator.pushNamed(context,"chatScreen",arguments:
              {'name':item.fname,
                'status':item.status,
              }
            );
          },
        ),
      ),
    );
  }

  void _addAnItem() {
    counter++;
    _data.insert(0, Contact(3, counter.toString(), counter.toString(), counter.toString(), 26));
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
}
