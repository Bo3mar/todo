import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
class AddTaskBottomSheet extends StatefulWidget {
  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  String title = '';
  String description = '';
  DateTime date = DateTime.now();
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
            InkWell(
              onTap: () {
                selectDate();
              },
              child: Text(
                '${date.month}/${date.day}/${date.year}',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.start,
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

  void selectDate() async {
    var selectDate = await
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if (selectDate != null) {
      date=selectDate;
      setState(() {});
    }
  }
  void addTask() {
    if (formKey.currentState!.validate()) {}
  }
}
