import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {

  final String taskName;
  final bool taskCompleted;
  Function (bool?)? onChanged;
  Function (BuildContext)? onPressed;

  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: onPressed,
              icon : Icons.delete,
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(12.0),
            ),
          ],
        ),
        child: Container(
          padding:EdgeInsets.all(24.0),
          child : Row(
            children: [

              Checkbox(value: taskCompleted, onChanged: onChanged),

              Text(
                taskName,
                style: TextStyle(
                    decoration: taskCompleted? TextDecoration.lineThrough:TextDecoration.none
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.yellow,
              borderRadius: BorderRadius.circular(12.0)
          ),
        ),
      ),
    );
  }
}
