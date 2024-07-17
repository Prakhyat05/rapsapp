// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:service/screen/Dashboard1/my_service_request.dart';

class NewJobs extends StatefulWidget {
  const NewJobs({super.key});

  @override
  State<NewJobs> createState() => _NewJobsState();
}

class _NewJobsState extends State<NewJobs> {
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
          leftButtonOnTap: (){},
          rightButtonOnTap: (){},
        ),
      ),
    );
  }
}
