import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  final String text;
  final bool isChecked;
  final Function checkboxCallback;
  final Function longPressCallBack;

  const TaskTile({this.text, this.isChecked,this.checkboxCallback,this.longPressCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(
        text,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Colors.lightBlueAccent,
        onChanged: checkboxCallback,
      ),
    );
  }
}
