// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:service/screen/Dashboard1/my_service_request.dart';

class OnGoingJobs extends StatefulWidget {
  const OnGoingJobs({super.key});

  @override
  State<OnGoingJobs> createState() => _OnGoingJobsState();
}

class _OnGoingJobsState extends State<OnGoingJobs> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: 400, maxHeight: 234 // Set a maximum width for the card
            ),
        child: MyServiceRequest(
          date: '12/06/2024',
          time: '09:00 AM',
          customerName: 'Ratn Govindam',
          serviceType: 'Electrician',
          place: 'Patiala',
          duration: '2 hrs',
          distance: '0.2 Km',
          price: '75',
          leftButtonText: 'Cancel',
          rightButtonText: 'Direction',
          leftbuttonColor: Color.fromARGB(255, 243, 243, 243),
          leftbuttontextColor: Color.fromARGB(255, 131, 145, 161),
          rightbuttonColor: Color.fromARGB(255, 243, 243, 243),
          rightbuttontextColor: Color.fromARGB(255, 131, 145, 161),
          buttondivider: true,
          leftButtonOnTap: () {},
          rightButtonOnTap: (){},
        ),
      ),
    );
  }
}
