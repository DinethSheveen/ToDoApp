import 'package:flutter/material.dart';
import 'package:project01_todo_app/pages/database.dart';
import 'package:project01_todo_app/pages/todoList.dart';
import 'package:project01_todo_app/pages/dialogbox.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project01_todo_app/pages/database.dart';


class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //Referencing the hive box
  final myBox = Hive.box("myBox");

  //Creating an instance of the database
  ToDoDatabase db = ToDoDatabase();

  void initState(){

    //If this is the very first time opening the app
    if(myBox.get("TODOLIST")==null){
      db.createInitialData();
    }
    else{
      db.loadData();
    }

    super.initState();
  }

  final _controller = TextEditingController();

  //Checkbox tapped
  void changeState(bool? value,int index){
    setState(() {
      db.todoList[index][1]=!db.todoList[index][1];
    });
    db.updateData();
  }

  void Saving(){
    setState(() {
      db.todoList.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //A function create a new task
  void createNewTask(){
    showDialog(
        context: context,
        builder: (context){
          return DialogBox(
              controller: _controller,
              onSave : Saving,
              onCancel : ()=> Navigator.of(context).pop()
          );
        }
    );
  }

  //deleteTask
  void deleteTask(int index){
    setState(() {
      db.todoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.yellow,
          title : Text("TO-DO APP")
      ),

      body: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context,index){
            return ToDoTile(
              taskName: db.todoList[index][0],
              taskCompleted: db.todoList[index][1],
              onChanged: (value)=>changeState(value,index),
              onPressed: (value)=>deleteTask(index),
            );
          }
      ),

      //Floating Action Button to add tasks
      floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          child : Icon(Icons.add),
          backgroundColor: Colors.yellow
      ),
    );
  }
}
