// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:service/common/components/my_appbar_back_button.dart';
import 'package:service/common/components/my_headingtwo.dart';
import 'package:service/common/constants/colors.dart';
import 'package:service/screen/Dashboard1/services.dart';

class ServicePage extends StatefulWidget {
  const ServicePage({super.key});

  @override
  State<ServicePage> createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6F2F2),
      appBar: AppBar(
        leading: MyAppBarBackButton(),
        leadingWidth: 120,
        backgroundColor: Colors.transparent,
        title: MySecondHeading(
          text: 'Services',
          fontsize: MediaQuery.of(context).size.width < 400 ? 25 : 30,
        ),
      ),
      /*PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            MyAppBarBackButton(),
            MySecondHeading(
              text: 'Services',
              fontsize: MediaQuery.of(context).size.width < 400 ? 25 : 30,
            ),
          ],
        ),
      ),*/
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 800,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 10,
                            offset: Offset(0, 1.5),
                          ),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 30, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          // Recent Reviews
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                Services(
                                  price: '₹400',
                                  service: 'Primary',
                                  serviceType: 'Electrician',
                                  serviceDesc: 'Electrical',
                                  place: 'y',
                                  duration: '2 hrs',
                                  distance: '0.2Km',
                                  active: true,
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Services(
                                  price: '₹400',
                                  service: 'Secondary',
                                  serviceType: 'Electrician',
                                  serviceDesc: 'Electrical',
                                  place: 'y',
                                  duration: '2 hrs',
                                  distance: '0.2Km',
                                  active: false,
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
