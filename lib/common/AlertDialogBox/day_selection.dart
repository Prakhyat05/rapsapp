// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:service/common/components/my_text_widget.dart';

class DaySelection extends StatefulWidget {
  final List<String> selectedDays;
  final Function(List<String>) onSelectedDaysChanged;

  const DaySelection({
    required this.onSelectedDaysChanged,
    required this.selectedDays,
    super.key,
  });

  @override
  State<DaySelection> createState() => _DaySelectionState();
}

class _DaySelectionState extends State<DaySelection> {
  List<String> days = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
  ];
  List<bool> isSelected = [];

  @override
  void initState() {
    super.initState();
    isSelected = days.map((day) => widget.selectedDays.contains(day)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(3.0),
        side: BorderSide(width: 1, color: Color(0xFFF3F3F3)),
      ),
      backgroundColor: Color(0xFFF3F3F3),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                MyTextWidget(
                  text: 'Select days you are available',
                  fontSize: 15,
                ),
                SizedBox(
                  width: 8,
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close_rounded)),
              ],
            ),
            SizedBox(height: 16),
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: days.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: MyTextWidget(text: days[index]),
                    value: isSelected[index],
                    onChanged: (value) {
                      setState(() {
                        isSelected[index] = value!;
                      });
                    },
                    checkboxShape: CircleBorder(side: BorderSide.none),
                    activeColor: Colors.green,
                  );
                },
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /*ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  ),
                ),*/
                //SizedBox(width: 8),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                  ),
                  onPressed: () {
                    List<String> selectedDays = [];
                    for (int i = 0; i < days.length; i++) {
                      if (isSelected[i]) {
                        selectedDays.add(days[i]);
                      }
                    }
                    widget.onSelectedDaysChanged(selectedDays);
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
