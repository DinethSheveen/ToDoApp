import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase{

  List todoList = [];

  //Referencing the hive box
  final myBox = Hive.box("myBox");

  //If this is the first time ever opening the app
  void createInitialData(){
    todoList = [
      ["Task01",false],
      ["Task02",false]
    ];
  }

  //Loading the data
 void loadData(){
    todoList = myBox.get("TODOLIST");
 }

 void updateData(){
    myBox.put("TODOLIST",todoList);
 }

}