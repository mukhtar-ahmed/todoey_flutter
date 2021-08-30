import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widget/task_tile.dart';
import 'package:provider/provider.dart';


class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context , taskData , child)
      {
        return ListView.builder(itemBuilder:(context,index)
        {
          final task = taskData.tasks[index];
          return TaskTile(
              text :task.name ,
              isChecked : task.isDone,
              checkboxCallback : (checkboxState)
              {
              taskData.updateTask(task);
              },
            longPressCallBack: (){
                Provider.of<TaskData>(context,listen: false).deleteTask(task);
            },
          );
        },
          itemCount: taskData.taskCount,
        );
      },

    );
  }
}
