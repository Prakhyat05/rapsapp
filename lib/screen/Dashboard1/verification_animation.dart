// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:service/common/components/my_headingtwo.dart';

class StartingAnimation extends StatefulWidget {

  @override
  _StartingAnimationState createState() => _StartingAnimationState();
}

class _StartingAnimationState extends State<StartingAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat();

    _animation1 = Tween<double>(begin: 200.0, end: 300.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _animation2 = Tween<double>(begin: 250.0, end: 350.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    // Navigate to the onboarding screen after 3 seconds
    Future.delayed(Duration(seconds: 7), () {
      Navigator.pushReplacementNamed(context,'clientOnGoingJob');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  width: _animation2.value,
                  height: _animation2.value,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.teal.withOpacity(0.2),
                  ),
                ),
                Container(
                  width: _animation1.value,
                  height: _animation1.value,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.teal.withOpacity(0.4),
                  ),
                ),
                Container(
                  width: 200.0, // Fixed size for the middle circle
                  height: 200.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.teal,
                  ),
                ),
                MySecondHeading(
                  text: 'Starting\n Service',
                  color: Colors.white,
                  fontsize: MediaQuery.of(context).size.width < 400 ? 25 : 30,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
