// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:service/common/components/gesturedetector.dart';
import 'package:service/common/components/my_text_button.dart';
import 'package:service/common/components/my_text_widget.dart';

class TimeSelection extends StatefulWidget {
  final Function(TimeOfDay, TimeOfDay) onTimesChanged;
  final TimeOfDay? initialStartTime;
  final TimeOfDay? initialEndTime;

  const TimeSelection({
    required this.onTimesChanged,
    this.initialStartTime,
    this.initialEndTime,
    super.key,
  });

  @override
  State<TimeSelection> createState() => _TimeSelectionState();
}

class _TimeSelectionState extends State<TimeSelection> {
  late TimeOfDay? _startTime;
  late TimeOfDay? _endTime;

  @override
  void initState() {
    super.initState();
    _startTime = widget.initialStartTime;
    _endTime = widget.initialEndTime;
  }

  Future<void> _selectStartTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _startTime ?? TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (picked != null && picked != _startTime) {
      setState(() {
        _startTime = picked;
      });
    }
  }

  Future<void> _selectEndTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _endTime ?? TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.input,
    );
    if (picked != null && picked != _endTime) {
      setState(() {
        _endTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(width: 2, color: Colors.grey),
      ),
      backgroundColor: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MyTextWidget(text: 'Select Working Hours'),
            SizedBox(height: 16),
            MyGestureButton(
              onPressed: () => _selectStartTime(context),
              hintText: (_startTime != null)
                  ? _startTime!.format(context)
                  : 'Start Time',
            ),
            SizedBox(height: 20),
            MyGestureButton(
              onPressed: () => _selectEndTime(context),
              hintText:
                  (_endTime != null) ? _endTime!.format(context) : 'End Time',
            ),
            SizedBox(height: 30),
            MyTextButton(
              text: 'Submit',
              onPressed: () {
                if (_startTime != null && _endTime != null) {
                  widget.onTimesChanged(_startTime!, _endTime!);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
