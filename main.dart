import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project01_todo_app/pages/homePage.dart';


void main() async{

  //initializing the hive
  await Hive.initFlutter();

  //Opening the  hive box
  var box = await Hive.openBox("myBox");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
