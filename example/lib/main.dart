import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:pusher_beams/pusher_beams.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize PusherBeams as soon as possible (here is RECOMMENDED)
  await PusherBeams.start('8e145f3a-021a-43ab-9836-6304404d382d');

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPluginTest();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPluginTest() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      // As in Pusher Beams Get Started
     /* await PusherBeams.addDeviceInterest('hello');*/

      // For debug purposes on Debug Console
      await PusherBeams.addDeviceInterest('debug-test');

      final interests = await PusherBeams.getDeviceInterests();

      // Result example [hello, debug-hello, ...]
      print(interests);
    } on PlatformException {
      print("PlatformException D:");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pusher Beams Plugin Example'),
        ),
        body: Center(
          child: Text("You can test your notifications now"),
        ),
      ),
    );
  }
}
