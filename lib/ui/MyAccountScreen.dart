import 'package:flutter/material.dart';

//TODO:My account screen
class MyAccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Column(
          children: [
            Text("My Account"),
            FlatButton(onPressed: (){Navigator.pop(context);}, child: Text("Back"),),
          ],
        ),
      ),
    ));
  }
}
