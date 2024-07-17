// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class DashboardAppBar extends StatefulWidget {
  final String providerName;
  const DashboardAppBar({
    super.key,
    required this.providerName,
  });

  @override
  State<DashboardAppBar> createState() => _DashboardAppBarState();
}

class _DashboardAppBarState extends State<DashboardAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 0, top: 10, bottom: 0),
      child: Center(
        child: Row(
          children: [
            Column(
              children: [
                Text(
                  'Hello',
                  style: TextStyle(fontSize: 12, color: Colors.black54),
                ),
                Text(
                  widget.providerName,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
