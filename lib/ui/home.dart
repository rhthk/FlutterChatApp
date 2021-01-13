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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 120.0,
            floating: true,
            pinned: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Center(
                  child: Card(
                    color: Colors.deepPurpleAccent.shade100,
                    child: Container(
                      height: 1000,
                      width: MediaQuery.of(context).size.width - 10,
                      child: Center(child: Text("container 1")),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
