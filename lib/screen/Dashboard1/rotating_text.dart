// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:service/common/components/my_text_widget.dart';

class RotatingTextWidget extends StatefulWidget {
  @override
  _RotatingTextWidgetState createState() => _RotatingTextWidgetState();
}

class _RotatingTextWidgetState extends State<RotatingTextWidget>
    with SingleTickerProviderStateMixin {
  late Timer _timer;
  int _index = 0;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  final List<String> texts = [
    "Provide Exceptional Customer Service to Earn Stellar Reviews",
    "Deliver Outstanding Customer Service to Garner Glowing Reviews",
    "Offer Exceptional Customer Experience for Rave Reviews",
    "Ensure Stellar Customer Support for Positive Feedback",
    "Provide Exceptional Service to Earn Five-Star Reviews",
    "Deliver Top-notch Customer Care for Excellent Ratings",
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100),
    );
    _offsetAnimation = Tween<Offset>(
      begin: Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(_controller);
    _timer = Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _index = (_index + 1) % texts.length;
        _controller.forward(from: 0);
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _offsetAnimation,
      builder: (context, child) {
        return Transform.translate(
          offset: _offsetAnimation.value,
          child: child,
        );
      },
      child: MyTextWidget(
        key: ValueKey<int>(_index),
        text: texts[_index],
        fontSize: MediaQuery.of(context).size.width < 400 ? 10 : 12,
        color: Colors.black,
        maxLines: 2,
      ),
    );
  }
}
