import 'dart:core';
import 'dart:ui';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class ChatScreen extends StatelessWidget {
  String name,lastSeen;
  @override
  Widget build(BuildContext context) {

    final Map args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: _appBar(context,args),
      body: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.black12,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
              ),
              width: (MediaQuery.of(context).size.width),
              // height: (MediaQuery.of(context).size.height*0.8),
            ),
          ),
          bottomNavigationBar(context),
          // SizedBox(height: MediaQuery.of(context).viewInsets.bottom,),
        ],
      ),
      // bottomNavigationBar: bottomNavigationBar(context),
    );
  }

  AppBar _appBar(BuildContext context,Map arg) {
    return AppBar(
      brightness: Brightness.dark,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0.0,
      title: Column(
        children: [
          Text(arg['fname']),
          Text(
            arg['status'],
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
      actions: [
        Hero(
          tag: arg['fname'],
          child: CircleAvatar(
            onBackgroundImageError: (obj, trace) {
              print(trace);
            },
            backgroundImage: NetworkImage(arg['image']),
            child: GestureDetector(
              onTap: (){
                Navigator.pushNamed(context, "accountScreen",arguments: {
                  'fname':arg['fname'],
                  'image':arg['image'],
                  'lname':arg['lname'],
                  'status':arg['status'],
                  'number':arg['number']
                });
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
      height:65.0,//(MediaQuery.of(context).size.height * 0.1),
      color: Colors.black12,
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
                  // child: FloatingActionButton(
                  //   mini: true,
                  //   child: Icon(Icons.add),
                  //   onPressed: (){},
                  //   // onPressed: modalBottomSheetMenu(),
                  // ),
                ),
                Expanded(
                    child: TextField(
                      decoration: new InputDecoration(
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          contentPadding: EdgeInsets.only(left: 5, right: 5),
                          hintText: "Type a message."),
                    )),
                RawMaterialButton(
                  onPressed: () {},
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
}