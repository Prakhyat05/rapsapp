// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:service/common/components/my_appbar_back_button.dart';
import 'package:service/common/components/my_headingtwo.dart';
import 'package:service/common/constants/colors.dart';
import 'package:service/screen/Dashboard1/jobs_tab_bar.dart';
import 'package:service/screen/Dashboard1/new_jobs.dart';
import 'package:service/screen/Dashboard1/ongoing_jobs.dart';
import 'package:service/screen/Dashboard1/scheduled_jobs.dart';

class ViewAppointments extends StatefulWidget {
  const ViewAppointments({super.key});

  @override
  State<ViewAppointments> createState() => _ViewAppointmentsState();
}

class _ViewAppointmentsState extends State<ViewAppointments> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Ensure this matches the number of tabs
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(150),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            color: Color(0xFFD6F2F2),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height < 750 ? 30 : 30,
                ),
                MyAppBarBackButton(),
                MySecondHeading(
                  text: 'Jobs',
                  fontWeight: FontWeight.bold,
                  fontsize: MediaQuery.of(context).size.width < 400 ? 24 : 26,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width < 400 ? 10 : 9,
                ),
                JobsTabBar(), // TabBar will be here
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 25), // Add padding around the card
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    NewJobs(),
                    SizedBox(
                      height: 15,
                    ),
                    NewJobs(),
                    SizedBox(
                      height: 15,
                    ),
                    NewJobs(),
                  ],
                ),
              ),
            ), // Ensure you have these pages available
            Center(child: JobsPage()),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 25), // Add padding around the card
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    OnGoingJobs(),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Use this for counting at the top of the tabs!
CircleAvatar(
            radius: 10,
            backgroundColor: Colors.orange,
            child: Text(
              count.toString(),
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
          ),

*/
