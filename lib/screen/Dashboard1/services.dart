// ignore_for_file: public_member_api_docs, sort_constructors_first, use_super_parameters, must_be_immutable
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:service/export.dart';

class Services extends StatefulWidget {
  final String price;
  final String service;
  final String serviceType;
  final String serviceDesc;
  final String place;
  final String duration;
  final String distance;
  bool active;
  Services({
    Key? key,
    required this.price,
    required this.service,
    required this.serviceType,
    required this.serviceDesc,
    required this.place,
    required this.duration,
    required this.distance,
    required this.active,
  }) : super(key: key);

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 400,
          maxHeight: 224, // Set a maximum width for the card
        ),
        child: Card(
          color: Colors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            mainAxisSize:
                MainAxisSize.min, // Adjust card size based on its content
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
                          width: 25,
                        ),
                        MySecondHeading(
                          text: widget.service,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Transform.scale(
                          scale:
                              0.8, // Adjust this value to control switch size
                          child: Switch(
                            value: widget.active,
                            onChanged: (val) {
                              setState(() {
                                widget.active = !widget.active;
                              });
                            },
                            activeColor: Colors.green,
                            inactiveThumbColor: Colors.red,
                            inactiveTrackColor:
                                Color.fromARGB(255, 237, 138, 138),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        )
                      ],
                    )
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
                        height: 15,
                      ),
                      MySecondHeading(
                        text: widget.serviceType,
                      ),
                      MyDescTextWidget(text: widget.serviceDesc),
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
                                text: 'Price/hr',
                                fontSize: 12,
                              ),
                              MySecondHeading(
                                text: widget.price,
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
                                text: 'Avgerage Duration',
                                fontSize: 12,
                              ),
                              MySecondHeading(
                                text: widget.duration,
                                fontWeight: FontWeight.w500,
                                fontsize: 15,
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
                height: 10,
                color: Colors.white,
              ),
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    bottom: BorderSide(
                      width: 1,
                      color: Colors.white,
                    ),
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
                ),
                width: MediaQuery.of(context).size.width,
                height: 26,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(100, 243, 243, 243),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(0),
                              topRight: Radius.circular(0),
                              bottomLeft: Radius.circular(5),
                              bottomRight: Radius.circular(0),
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: MySecondHeading(
                          text: 'Edit Service',
                          fontsize: 17,
                          color: Color.fromARGB(255, 131, 145, 161),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
