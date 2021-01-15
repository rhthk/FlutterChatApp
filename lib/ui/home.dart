import 'dart:ui';

import 'package:flutter/material.dart';

class HomeUI extends StatefulWidget {
  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  String title = "Home";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar("Lorem Ipsum","Last seen 16:51"),
      body: Container(
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.black12,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25.0), topRight: Radius.circular(25.0)),
        ),
        width: (MediaQuery.of(context).size.width),
        height: (MediaQuery.of(context).size.height),
      ),
      bottomNavigationBar: _bottomNavigationBar(context),
    );
  }

  AppBar _appBar(String title,String status) {
    return AppBar(
      brightness: Brightness.dark,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0.0,
      title: Column(
        children: [
          Text(title),
          Text(
            status,
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
      actions: [
        CircleAvatar(
          onBackgroundImageError: (obj, trace) {
            print(trace);
          },
          backgroundImage: NetworkImage(
            "https://www.google.com/imgres?imgurl=https%3A%2F%2Fimage.shutterstock.com%2Fimage-photo%2Fbright-spring-view-cameo-island-260nw-1048185397.jpg&imgrefurl=https%3A%2F%2Fwww.shutterstock.com%2Fcategory%2Fnature&tbnid=PDxUM2uh-Nz6cM&vet=12ahUKEwihvK_w5Z3uAhXcEbcAHaIoDrkQMygCegUIARC3AQ..i&docid=LlgDpz1LoiuznM&w=475&h=280&q=images&ved=2ahUKEwihvK_w5Z3uAhXcEbcAHaIoDrkQMygCegUIARC3AQ",
          ),
          child: Icon(Icons.face),
        ),
        Padding(padding: EdgeInsets.fromLTRB(10, 0, 0, 0)),
      ],
      centerTitle: true,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {},
      ),
    );
  }

  Container _bottomNavigationBar(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: (MediaQuery.of(context).size.height * 0.1),
      color: Colors.black12,
      child: FractionallySizedBox(
        heightFactor: 0.9,
        widthFactor: 0.9,
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
                  child: FloatingActionButton(
                    mini: true,
                    child: Icon(Icons.add),
                    onPressed: _modalBottomSheetMenu,
                  ),
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
                FloatingActionButton(
                  mini: true,
                    backgroundColor: Colors.white10,
                    child: Icon(Icons.send), onPressed: () {}),
                Padding(padding: EdgeInsets.only(right: 10.0))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _modalBottomSheetMenu() {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
        context: context,
        builder: (builder) {
          return new Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(25.0),
                      topRight: const Radius.circular(25.0))),
              child: new Center(
                child: Row(
                  children: [
                    InkWell(
                      child: Icon(
                        Icons.upload_file,
                        size: 50,
                      ),
                      onTap: () {},
                    ),
                    // Expanded(child: FlatButton(onPressed: (){}, child: Icon(Icons.upload_file,size: 50,))),
                    Expanded(
                        child: FlatButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.camera_alt,
                              size: 50,
                            ))),
                    Expanded(
                        child: FlatButton(
                            onPressed: () {},
                            child: Icon(
                              Icons.photo,
                              size: 50,
                            ),
                        ),
                    ),
                  ],
                ),
              )
          );
        });
  }
}
