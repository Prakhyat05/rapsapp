// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:service/common/AlertDialogBox/action.dart';
import 'package:service/common/AlertDialogBox/day_selection.dart';
import 'package:service/common/AlertDialogBox/start_end_time.dart';
import 'package:service/common/components/gesturedetector.dart';
import 'package:service/common/components/my_appbar_back_button.dart';
import 'package:service/common/components/my_desc_text_widget.dart';
import 'package:service/common/components/my_heading_text_widget.dart';
import 'package:service/common/components/my_text_button.dart';

class Step3 extends StatefulWidget {
  const Step3({super.key});
  static String days = "";
  static String workingHours = "";

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  List<String> selectedDays = [];
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  void updateSelectedDays(List<String> days) {
    setState(() {
      selectedDays = days;
    });
  }

  void updateSelectedTimes(TimeOfDay start, TimeOfDay end) {
    setState(() {
      startTime = start;
      endTime = end;
    });
  }

  @override
  Widget build(BuildContext context) {
    Step3.days = selectedDays.toString();
    Step3.workingHours = startTime.toString() + " to " + endTime.toString();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    bool showButtonInNavBar = false;

    bool isSmallScreen = screenWidth < 350 || screenHeight < 800;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyAppBarBackButton(),
              Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  MyAction(pageNumber: '3'),
                ],
              )
            ],
          )),
      body: LayoutBuilder(builder: (context, constraints) {
        showButtonInNavBar = constraints.maxHeight > screenHeight;
        return SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyHeadingTextWidget(text: 'Set Your Schedule'),
                    MyDescTextWidget(text: 'When Are You Available to Work?'),
                    SizedBox(height: 30),
                    MyGestureButton(
                      hintText: selectedDays.isNotEmpty
                          ? selectedDays
                              .map((day) => day.toString().substring(0, 3))
                              .join(', ')
                          : 'Select days you are available',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => DaySelection(
                            onSelectedDaysChanged: updateSelectedDays,
                            selectedDays: selectedDays,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 15),
                    MyGestureButton(
                      hintText: (startTime != null && endTime != null)
                          ? '${startTime!.format(context)} - ${endTime!.format(context)}'
                          : 'Select working hours',
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => TimeSelection(
                            onTimesChanged: updateSelectedTimes,
                            initialStartTime: startTime,
                            initialEndTime: endTime,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 25),
                    if (!showButtonInNavBar &&
                        !isSmallScreen &&
                        constraints.maxHeight <= screenHeight)
                      MyTextButton(
                          text: 'Next',
                          onPressed: () {
                            Navigator.pushNamed(context, 'profile_step4');
                          })
                    else if (!showButtonInNavBar &&
                        isSmallScreen &&
                        constraints.maxHeight <= screenHeight)
                      MyTextButton(
                          text: 'Next',
                          onPressed: () {
                            Navigator.pushNamed(context, 'profile_step4');
                          })
                    else if (showButtonInNavBar &&
                        isSmallScreen &&
                        constraints.maxHeight > screenHeight)
                      SizedBox()
                    else
                      MyTextButton(
                          text: 'Next',
                          onPressed: () {
                            Navigator.pushNamed(context, 'profile_step4');
                          }),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
      bottomNavigationBar: showButtonInNavBar && isSmallScreen
          ? BottomAppBar(
              child: MyTextButton(
                  text: 'Next',
                  onPressed: () {
                    Navigator.pushNamed(context, 'profile_step4');
                  }),
            )
          : null,
    );
  }
}
