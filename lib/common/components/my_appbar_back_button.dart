// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyAppBarBackButton extends StatelessWidget {
  const MyAppBarBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 25,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 2,
            ),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      width: 1, color: Color.fromARGB(255, 232, 236, 244)),
                  borderRadius: BorderRadius.circular(5)),
              child: Center(
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.black,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*

Padding(
              padding: const EdgeInsets.only(right: 28),
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Color.fromARGB(255, 232, 236, 244)
                  ),
                  borderRadius: BorderRadius.circular(5)
                ),
                child: Center(
                  child: Text(
                    '1/5',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ),
            ),




Container(
      padding: EdgeInsets.only(left: 15),
      child: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.arrow_back_ios_new,
          color: Colors.black,
        ),
      ),
    )

*/
