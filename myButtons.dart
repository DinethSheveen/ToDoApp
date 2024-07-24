import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  final String buttonName;
  VoidCallback onPressed;

  //Constructor
  MyButtons({
    super.key,
    required this.buttonName,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    //Accessing the button text, button color and the action to be done once the button is pressed
    return MaterialButton(
      onPressed: onPressed,
      child : Text(buttonName),
      color: Colors.yellow[200],
    );
  }
}
