// import 'package:background_fetch/background_fetch.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/ui/home.dart';
// import 'package:flutterapp/ui/test.dart';
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
  // void initState() {
  //   super.initState();
  //   initPlatformState();
  // }
  //
  // Future<void> initPlatformState() async {
  //   // Configure BackgroundFetch.
  //   BackgroundFetch.configure(BackgroundFetchConfig(
  //       minimumFetchInterval: 15,
  //       stopOnTerminate: false,
  //       enableHeadless: false,
  //       requiresBatteryNotLow: false,
  //       requiresCharging: false,
  //       requiresStorageNotLow: false,
  //       requiresDeviceIdle: false,
  //       requiredNetworkType: NetworkType.NONE
  //   ),(){print("Background");});}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat',
      // theme: myTheme,
      theme: ThemeData(
        primarySwatch: Colors.grey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: ListContact(),
      routes: {
        "homeScreen":(context)=>ListContact(),
        "chatScreen":(context)=>ChatScreen(),
      },
    );
  }
}
