// ignore_for_file: prefer_const_constructors

import 'package:service/export.dart';

class Step6 extends StatefulWidget {
  final String imagelocation;
  final String text;
  final String whereToGo;
  const Step6({
    super.key,
    required this.imagelocation,
    required this.text,
    required this.whereToGo,
  });

  @override
  State<Step6> createState() => _Step6State();
}

class _Step6State extends State<Step6> {
  @override
  void initState() {
    super.initState();
    // Navigate to the onboarding screen after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, widget.whereToGo);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  widget.imagelocation,
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  widget.text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w700,
                    textStyle: TextStyle(
                      color: Colors.black,
                    ),
                    fontSize: 30,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
