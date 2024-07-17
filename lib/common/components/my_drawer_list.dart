// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:service/common/components/drawer_divider.dart';
import 'package:service/common/components/my_drawer_list_tile.dart';

class MyDrawerList extends StatefulWidget {
  const MyDrawerList({super.key});

  @override
  State<MyDrawerList> createState() => _MyDrawerListState();
}

class _MyDrawerListState extends State<MyDrawerList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: 5,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MyDrawerDivider(),
            MyDrawerListTile(
              onPressed: () {
                Navigator.pushNamed(context, 'view_appointments');
              },
              myicons: Icons.date_range,
              title: 'View Appointments',
            ),
            MyDrawerDivider(),
            MyDrawerListTile(
              onPressed: () {
                Navigator.pushNamed(context, 'manage_services');
              },
              myicons: Icons.cleaning_services_outlined,
              title: 'Manage Services',
            ),
            MyDrawerDivider(),
            MyDrawerListTile(
              onPressed: () {
                
                Navigator.pushNamed(context, 'earning');
              },
              title: 'View Earnings',
              myicons: Icons.currency_rupee,
            ),
            MyDrawerDivider(),
            MyDrawerListTile(
              onPressed: () {},
              myicons: Icons.military_tech_outlined,
              title: 'Rewards',
            ),
            MyDrawerDivider(),
            MyDrawerListTile(
              onPressed: () {},
              myicons: Icons.help_outline,
              title: 'FAQ’S',
            ),
            MyDrawerDivider(),
          ],
        ),
      ),
    );
  }
}
