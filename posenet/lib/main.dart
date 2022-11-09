import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'teachable.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Permission.camera.request();
  await Permission.microphone.request();
  await Permission.locationAlways.request();
  runApp(MaterialApp(
    home: Home()
  ));
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.redAccent, title: Text('Keep Internet ON!'),),
      body: Teachable(
        path: "assets/model.html",
        results: (res) {

          // Convert json to usable format
          var resp = jsonDecode(res);
          print("The values are $resp");
        },
      ),
    );

  }
}
