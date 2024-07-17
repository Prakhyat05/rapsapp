// ignore_for_file: prefer_const_constructors
import "package:service/export.dart";

class MyHeadingTextWidget extends StatelessWidget {
  final String text;
  final Color? color;
  const MyHeadingTextWidget({
    super.key,
    required this.text,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final parentWidth = MediaQuery.of(context).size.width;
    return Text(
      text,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        textStyle: TextStyle(
          color: color ?? Colors.black,
          fontSize: parentWidth / 15,
        ),
      ),
    );
  }
}
