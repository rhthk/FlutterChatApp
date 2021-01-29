import 'package:flutter/material.dart';
import 'package:flutterapp/ui/ListContactScreen.dart';
import 'package:flutterapp/ui/MyAccountScreen.dart';
import 'package:flutterapp/ui/SettingsScreen.dart';
import 'package:flutterapp/ui/test.dart';
import 'ui/ChatScreen.dart';

// void backgroundFetchHeadlessTask(String taskId) async {
//   print("[BackgroundFetch] Headless event received: $taskId");
//   BackgroundFetch.finish(taskId);
// }

void main() {
  runApp(MyApp());
  // BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
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
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
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
