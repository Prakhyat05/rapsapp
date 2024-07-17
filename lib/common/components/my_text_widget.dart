
import 'package:service/export.dart';

class MyTextWidget extends StatelessWidget {
  final String text;
  final TextAlign? align;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final int? maxLines;

  const MyTextWidget({
    super.key,
    required this.text,
    this.align,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double size;
    if (screenWidth < 360) {
      size = screenWidth * 0.04;
    } else if (screenWidth < 480) {
      size = screenWidth * 0.045;
    } else if (screenWidth < 720) {
      size = screenWidth * 0.05;
    } else {
      size = screenWidth * 0.06;
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        double parentWidth = constraints.maxWidth;
        if (parentWidth == double.infinity) {
          return Text(
            text,
            textAlign: align ?? TextAlign.center,
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.montserrat(
              fontWeight: fontWeight ?? FontWeight.w500,
              textStyle: TextStyle(
                color: color ?? Colors.black54,
                fontSize: fontSize ?? size,
              ),
            ),
          );
        } else {
          return SizedBox(
            width: parentWidth - 10,
            child: Text(
              text,
              maxLines: maxLines,
              overflow: TextOverflow.ellipsis,
              textAlign: align??TextAlign.center,
              style: GoogleFonts.montserrat(
                fontWeight: fontWeight ?? FontWeight.w500,
                textStyle: TextStyle(
                  color: color ?? Colors.black54,
                  fontSize: fontSize ?? size,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
