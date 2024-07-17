import 'package:service/export.dart';

class MyPasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obsecureText;
  final validator;
  const MyPasswordTextField({
    super.key,
    required this.controller,
    required this.obsecureText,
    required this.hintText,
    this.validator,
  });

  @override
  State<MyPasswordTextField> createState() => _MyPasswordTextFieldState();
}

class _MyPasswordTextFieldState extends State<MyPasswordTextField> {
  bool _obsecureText = false;

  @override
  void initState() {
    super.initState();
    _obsecureText = widget.obsecureText;
  }

  @override
  Widget build(BuildContext context) {
    final parentWidth = MediaQuery.of(context).size.width;
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
    return SizedBox(
      height: 60, // Set a responsive height
      child: TextFormField(
        validator: widget.validator,
        controller: widget.controller,
        obscureText: _obsecureText,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(2),
            borderSide: BorderSide(
              color: Colors.grey,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              2,
            ),
            borderSide: BorderSide(color: Colors.black54),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Colors.black, // focused border color
              width: 2.0, // focused border width
            ),
          ),
          hintText: widget.hintText,
          hintStyle: GoogleFonts.montserrat(
            textStyle: TextStyle(
              color: Colors.black54,
              fontWeight: FontWeight.w500,
              fontSize: size, //parentWidth / 19, // Responsive font size
            ),
          ),
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                _obsecureText = !_obsecureText;
              });
            },
            child: Icon(
              _obsecureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
              size: parentWidth / 20, // Responsive icon size
            ),
          ),
          contentPadding: EdgeInsets.symmetric(
            horizontal: parentWidth / 25, // Responsive horizontal padding
            vertical: parentWidth / 30, // Responsive vertical padding
          ),
        ),
      ),
    );
  }
}
