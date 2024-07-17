// ignore_for_file: prefer_const_constructors

import 'package:service/export.dart';

class MyServiceRequest extends StatefulWidget {
  final String price;
  final String date;
  final String time;
  final String serviceType;
  final String customerName;
  final String place;
  final String duration;
  final String distance;
  final String? leftButtonText;
  final String? rightButtonText;
  final Color? leftbuttonColor;
  final Color? leftbuttontextColor;
  final Color? rightbuttonColor;
  final Color? rightbuttontextColor;
  final bool? buttondivider;
  final VoidCallback leftButtonOnTap;
  final VoidCallback rightButtonOnTap;
  const MyServiceRequest({
    super.key,
    required this.price,
    required this.date,
    required this.time,
    required this.serviceType,
    required this.customerName,
    required this.place,
    required this.duration,
    required this.distance,
    required this.leftButtonOnTap,
    required this.rightButtonOnTap,
    this.leftButtonText,
    this.rightButtonText,
    this.leftbuttonColor,
    this.leftbuttontextColor,
    this.rightbuttonColor,
    this.rightbuttontextColor,
    this.buttondivider,
  });

  @override
  State<MyServiceRequest> createState() => _MyServiceRequestState();
}

class _MyServiceRequestState extends State<MyServiceRequest> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border(
                top: BorderSide(width: 1, color: Colors.black),
                bottom: BorderSide(width: 1, color: Colors.black),
              ),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    MySecondHeading(
                      text: '\u20B9${widget.price}/-',
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        MyDescTextWidget(
                          text: widget.date,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        MyDescTextWidget(
                          text: widget.time,
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 13,
                  ),
                  MySecondHeading(
                    text: widget.customerName,
                  ),
                  MyDescTextWidget(text: widget.serviceType),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyDescTextWidget(
                            text: 'Place',
                            fontSize: 12,
                          ),
                          MySecondHeading(
                            text: widget.place,
                            fontWeight: FontWeight.w500,
                            fontsize: 15,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyDescTextWidget(
                            text: 'Duration',
                            fontSize: 12,
                          ),
                          MySecondHeading(
                            text: widget.duration,
                            fontWeight: FontWeight.w500,
                            fontsize: 15,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyDescTextWidget(
                            text: 'Distance',
                            fontSize: 12,
                          ),
                          MySecondHeading(
                            text: widget.distance,
                            fontWeight: FontWeight.w500,
                            fontsize: 15,
                            align: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: 10,
          ),
          SizedBox(
            height: 45,
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.leftbuttonColor ??
                            Color.fromARGB(255, 255, 181, 175),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(5),
                            bottomRight: Radius.circular(0),
                          ),
                        ),
                        minimumSize: Size(double.infinity, 50),
                        maximumSize: Size(double.infinity, 50),
                      ),
                      onPressed: widget.leftButtonOnTap,
                      child: MySecondHeading(
                        text: widget.leftButtonText ?? 'Reject',
                        fontsize: 17,
                        color: widget.leftbuttontextColor ?? Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                if (widget.buttondivider ?? false)
                  Container(
                    width: 1,
                    height: 35,
                    color: Colors.grey,
                  ),
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: widget.rightbuttonColor ??
                            Color.fromARGB(255, 183, 235, 188),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(0),
                            topRight: Radius.circular(0),
                            bottomLeft: Radius.circular(0),
                            bottomRight: Radius.circular(5),
                          ),
                        ),
                        minimumSize: Size(double.infinity, 50),
                        maximumSize: Size(double.infinity, 50),
                      ),
                      onPressed: widget.rightButtonOnTap,
                      child: MySecondHeading(
                        text: widget.rightButtonText ?? 'Accept',
                        fontsize: 16,
                        color: widget.rightbuttontextColor ?? Colors.green,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
