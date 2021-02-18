import 'dart:core';
import 'dart:ui';
import 'package:bubble/bubble.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/model/messageModel.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  TextEditingController _textEditingController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  String name, lastSeen;
  bool isLoading = false;
  final List<Message> messages = [
    Message(1, "hello", "time", 1),
    Message(2, "hi", "time", 2),
    Message(3, "123", "time", 1),
    Message(4, "5436", "time", 2),
    Message(5, "sgzd", "time", 1),
    Message(6, "ygtdj", "time", 1),
    Message(7, "rhdhr", "time", 1),
    Message(8, "niiol", "time", 2),
    Message(9, "lioshfo", "time", 1),
    Message(10, "apwodk", "time", 1),
    Message(11, "poszc", "time", 1),
    Message(1, "hello", "time", 1),
    Message(2, "hi", "time", 2),
    Message(3, "123", "time", 1),
    Message(4, "5436", "time", 2),
    Message(5, "sgzd", "time", 1),
    Message(6, "ygtdj", "time", 1),
    Message(7, "rhdhr", "time", 1),
    Message(8, "niiol", "time", 2),
    Message(9, "lioshfo", "time", 1),
    Message(10, "apwodk", "time", 1),
    Message(11, "poszc", "time", 1),
  ];

  @override
  Widget build(BuildContext context) {
    final Map args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: _scaffoldKey,
      appBar: _appBar(context, args),
      endDrawer: buildDrawer(args, context),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
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
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: ListView.builder(
                  reverse: true,
                  controller: _scrollController,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return messages[index].messageType==2?
                      Bubble(
                      margin: BubbleEdges.only(top: 10, right: 40),
                      alignment: Alignment.topLeft,
                      nip: BubbleNip.leftTop,
                      child: Text(messages[index].message,style: TextStyle(fontSize: 18),),
                    ):Bubble(
                      margin: BubbleEdges.only(top: 10, left: 40),
                      alignment: Alignment.topRight,
                      nip: BubbleNip.rightTop,
                      color: Theme.of(context).backgroundColor,
                      // color: Colors.blueGrey,
                      child: Text(messages[index].message,style: TextStyle(fontSize: 18),),
                    );
                  },
                ),
              ),
              // height: (MediaQuery.of(context).size.height*0.8),
            ),
            bottomNavigationBar(context),
          ],
        ),
      ),
    );
  }

  Drawer buildDrawer(Map args, BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Container(
              child: Container(
                child: Image.network(
                  args['image'],
                  fit: BoxFit.cover,
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes
                            : null,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          ListTile(
            title: Text('Close Drawer'),
            onTap: () {
              // Update the state of the app.
              // ...
              // Then close the drawer.
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }

  AppBar _appBar(BuildContext context, Map arg) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0.0,
      title: Column(
        children: [
          Text(arg['name']['firstName']),
          Text(
            arg['isOnline'] ? "online" : arg['lastActive'],
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
      actions: [
        Hero(
          tag: arg['number'],
          child: CircleAvatar(
            onBackgroundImageError: (obj, trace) {
              print(trace);
            },
            backgroundImage: NetworkImage(arg['image']),
            child: GestureDetector(
              onTap: () {
                _scaffoldKey.currentState.openEndDrawer();
                // Navigator.pushNamed(context, "accountScreen", arguments: {
                //   'name': {
                //     'firstName': arg['name']['firstName'],
                //     'lastName': arg['name']['lastName'],
                //   },
                //   'image': arg['image'],
                //   'status': arg['status'],
                //   'number': arg['number'],
                //   'lastActive': arg['lastActive'],
                //   'isOnline': arg['isOnline'],
                // });
              },
              // child: Icon(Icons.face),
            ),
          ),
        ),
        Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
      ],
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Container bottomNavigationBar(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 65.0, //(MediaQuery.of(context).size.height * 0.1),
      // color: Colors.white,
      child: FractionallySizedBox(
        heightFactor: 0.9,
        widthFactor: 0.95,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(25),
          child: Container(
            // color: Colors.grey.shade300,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [
                    const Color(0x506c757d),
                    const Color(0xffABB4C4),
                  ],
                  begin: const FractionalOffset(0.0, 0.0),
                  end: const FractionalOffset(1.0, 0.0),
                  stops: [0.0, 1.0],
                  tileMode: TileMode.clamp),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: RawMaterialButton(
                    onPressed: () {},
                    // elevation: 2.0,
                    fillColor: Theme.of(context).primaryColor,
                    child: Icon(
                      Icons.add,
                    ),
                    shape: CircleBorder(),
                    constraints: BoxConstraints.tight(Size.fromRadius(20)),
                  ),
                ),
                Expanded(
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.only(left: 5, right: 5),
                        hintText: "Type a message."),
                  ),
                ),
                RawMaterialButton(
                  onPressed: _send,
                  // elevation: 2.0,
                  fillColor: Theme.of(context).primaryColor,
                  child: Icon(
                    Icons.send,
                  ),
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  shape: CircleBorder(),
                  constraints: BoxConstraints.tight(Size.fromRadius(20)),
                ),
                // FloatingActionButton(
                //     mini: true,
                //     backgroundColor: Colors.white10,
                //     child: Icon(Icons.send), onPressed: () {}),
                Padding(padding: EdgeInsets.only(right: 10.0))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _send() {
    setState(() {
      messages.insert(
          0,
          Message(messages.length + 1, _textEditingController.value.text,
              "time", 1));
      _textEditingController.clear();
    });
    print(messages.last.message);
  }
}
