import 'package:flutter/material.dart';
import 'package:flutterapp/ui/ListContactScreen.dart';
import 'package:flutterapp/ui/MyAccountScreen.dart';
import 'package:flutterapp/ui/SettingsScreen.dart';
import 'package:flutterapp/ui/test.dart';
import 'package:flutterapp/ui/theme.dart';
import 'ui/ChatScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: ListContact(),
      routes: {
        "homeScreen":(context)=>ListContact(),
        "chatScreen":(context)=>ChatScreen(),
        "accountScreen":(context)=>AccountScreen(),
        "settingsScreen":(context)=>SettingsScreen(),
        "myAccountScreen":(context)=>MyAccountScreen(),
      },
    );
  }
}
