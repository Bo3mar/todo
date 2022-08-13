import 'package:flutter/material.dart';

class AddTaskBottomSheet extends StatefulWidget {

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(12),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('Add new Task',
            style: Theme.of(context).textTheme.bodyMedium,),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Enter your Task'
              ),
            ),
            SizedBox(height: 12,),
            TextFormField(
              maxLines: 4,
              minLines: 4,
              decoration: InputDecoration(
                labelText: 'Enter your task details',
              ),
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: (){
                selectDate();
              },
              child: Text('select Date',style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.start,),
            ),
            SizedBox(height: 12,),
            ElevatedButton(
                onPressed: (){

            },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    EdgeInsets.all(12)
                  )
                ),
                child:Text('Add',style: Theme.of(context).textTheme.titleMedium
              ?.copyWith(color: Colors.white), ) )
          ],
        ),
      ),
    );
  }

  void selectDate(){
    showDatePicker(context: context, initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
  }
}
