import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/list_provider.dart';
import '../firebase_utils/firebase_utils.dart';
import '../model/task.dart';
import '../my_theme.dart';


class TaskItem extends StatelessWidget {
  Task task;
  late ListProvider listProvider;

  TaskItem({required this.task});

  @override
  Widget build(BuildContext context) {
    listProvider=Provider.of<ListProvider>(context);
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Slidable(
          startActionPane: ActionPane(
            extentRatio: .3,
            motion: DrawerMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  deleteTaskFromFireStore(task).timeout(
                      Duration(milliseconds: 500), onTimeout: () {
                        listProvider.getTaskFromFireStore();
                     print('Task was deleted');
                    showMessage(
                        context, 'Task was deleted successfully', 'OK', (
                        context) {
                      Navigator.pop(context);
                    });
                  });
                },
                backgroundColor: MyThemeData.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12)),
              ),
            ],
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Row(
              children: [
                Container(
                  height: 80,
                  width: 4,
                  decoration: BoxDecoration(
                    color: Theme
                        .of(context)
                        .primaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ), //leftside line
                SizedBox(
                  width: 12,
                ),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(task.title,
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleMedium,
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            Icon(Icons.access_time),
                            Text(task.description,
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .bodySmall,
                            )
                          ],
                        )
                      ],
                    )),
                SizedBox(
                  width: 12,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Theme
                          .of(context)
                          .primaryColor,
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  void showMessage(BuildContext context,
      String message,
      String posActionText,
      Function posAction,
      {String? negActionText = null,
        Function? negAction = null}) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(message),
            actions: [
              TextButton(onPressed: (){
                posAction(context);
              },
                  child: Text(posActionText))
            ],
          );
        });
  }
}
