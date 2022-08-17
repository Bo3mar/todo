import 'package:flutter/material.dart';
import 'package:todo/firebase_utils/firebase_utils.dart';
import '../model/task.dart';

class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  String title = '';
  String description = '';
  DateTime selectedDate = DateTime.now();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(12),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add new Task',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            TextFormField(
              onChanged: (text) {
                title = text;
                setState(() {});
              },
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'please enter title';
                }
                return null;
              },
              decoration: InputDecoration(labelText: 'Enter your Task title'),
            ),
            SizedBox(
              height: 12,
            ),
            TextFormField(
              onChanged: (text) {
                description = text;
                setState(() {});
              },
              validator: (text) {
                if (text == null || text.isEmpty) {
                  return 'please enter description';
                }
                return null;
              },
              maxLines: 4,
              minLines: 4,
              decoration: InputDecoration(
                labelText: 'Enter your task description',
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Select Date',
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.start,
            ),
            SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {
                chooseDate();
              },
              child: Text(
                '${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            ElevatedButton(
                onPressed: () {
                  addTask();
                },
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.all(12))),
                child: Text(
                  'Add',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }

  void chooseDate() async {
    var chooseDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (chooseDate != null) {
      selectedDate = chooseDate;
      setState(() {});
    }
  }

  void addTask() {
    if (formKey.currentState!.validate()) {
      Task task = Task(
          title: title,
          description: description,
          date: selectedDate.millisecondsSinceEpoch);
     ShowLoading(context, ' Loading...');
      addTaskToFirebase(task).timeout(Duration(milliseconds: 5000),onTimeout:()
      { print('todo was added successfully');
        showMessage(context, 'Todo was added successfully', 'OK', (context){
       Navigator.pop(context);
       Navigator.pop(context);
        });
      //   hideLoading(context);
      // Navigator.pop(context);
      });



    }
  }

  void ShowLoading(BuildContext context, String message, {bool isCanceled=false}) {
    showDialog(
        barrierDismissible: isCanceled,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [CircularProgressIndicator(), Text(message)],
            ),
          );
        });
  }

  void hideLoading(
    BuildContext context,
  ) {
    Navigator.pop(context);
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
