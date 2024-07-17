// ignore_for_file: prefer_const_constructors

import "package:service/export.dart";

class MyTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;
  final Color? buttonColor;

  const MyTextButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.buttonColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final parentwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: 55,
      child: TextButton(
        style: ButtonStyle(
          minimumSize:
              MaterialStateProperty.all<Size>(Size(double.infinity, 65)),
          backgroundColor: MaterialStateProperty.all<Color>(
            buttonColor ?? Color(0x12121212).withOpacity(1),
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: GoogleFonts.montserrat(
            fontWeight: FontWeight.w400,
            textStyle: TextStyle(
              color: textColor ?? Colors.white,
              fontSize: parentwidth / 22,
            ),
          ),
        ),
      ),
    );
  }
}
