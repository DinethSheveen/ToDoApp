import 'package:flutter/material.dart';
import 'package:project01_todo_app/pages/myButtons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  //Constructor
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel
  });

  @override
  Widget build(BuildContext context) {
    //Prompting a dialog box to type a task 
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
          height: 120,
          child : Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter the new task here..."
                ),
              ),

              //Buttons to save and clear the dialog box prompted
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[

                  //save button
                  MyButtons(
                    buttonName : "Save",
                    onPressed:onSave,
                  ),

                  SizedBox(width: 8.0),

                  //cancel button
                  MyButtons(
                      buttonName: "Cancel",
                      onPressed: onCancel
                  )
                ],
              )
            ],
          )
      ),
    );
  }
}
