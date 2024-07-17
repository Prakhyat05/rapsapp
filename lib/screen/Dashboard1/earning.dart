// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:service/export.dart';

class Earning extends StatefulWidget {
  const Earning({super.key});

  @override
  State<Earning> createState() => _EarningState();
}

class _EarningState extends State<Earning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6F2F2),
      appBar: AppBar(
        leading: MyAppBarBackButton(),
        leadingWidth: 100,
        backgroundColor: Colors.transparent,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Earning Text
              MyHeadingTextWidget(text: 'Earnings'),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 120),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black38,
                            blurRadius: 10,
                            offset: Offset(0, 1.5),
                          ),
                        ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.width < 400
                              ? 70
                              : 100,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width < 400
                              ? 300
                              : 350,
                          height: MediaQuery.of(context).size.width < 400
                              ? 150
                              : 175,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(
                                color: Colors.white,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black38,
                                  blurRadius: 10,
                                  offset: Offset(0, 1.5),
                                ),
                              ],
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          height: 5,
                                        ),
                                        MyDescTextWidget(
                                          text: 'This Month',
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  400
                                              ? 13
                                              : 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset(
                                              leftImage,
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      400
                                                  ? 15
                                                  : 20,
                                              height: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      400
                                                  ? 15
                                                  : 20,
                                            ),
                                            MySecondHeading(
                                              text: '₹7000.00',
                                              fontsize: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      400
                                                  ? 22
                                                  : 25,
                                            ),
                                            Image.asset(
                                              rightImage,
                                              width: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      400
                                                  ? 15
                                                  : 20,
                                              height: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      400
                                                  ? 15
                                                  : 20,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Divider(),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Expanded(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            MyDescTextWidget(
                                              text: 'Services',
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      400
                                                  ? 15
                                                  : 18,
                                            ),
                                            MySecondHeading(
                                              fontWeight: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      400
                                                  ? FontWeight.w600
                                                  : FontWeight.w500,
                                              text: '204 Completed',
                                              fontsize: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      400
                                                  ? 12
                                                  : 16,
                                            ),
                                          ],
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            MyDescTextWidget(
                                              text: 'Duration',
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      400
                                                  ? 15
                                                  : 18,
                                              align: TextAlign.center,
                                            ),
                                            MySecondHeading(
                                              text: '88 hrs',
                                              fontWeight: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      400
                                                  ? FontWeight.w600
                                                  : FontWeight.w500,
                                              fontsize: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      400
                                                  ? 12
                                                  : 16,
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        SizedBox(height: 40),
                        // Options
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              MyTextWidget(
                                text: 'Transcation History',
                                align: TextAlign.start,
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width < 400
                                        ? 18
                                        : 22,
                              ),
                              Divider(),
                              MyTextWidget(
                                text: 'Clinet\'s Name',
                                align: TextAlign.start,
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width < 400
                                        ? 14
                                        : 16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyDescTextWidget(
                                    text: 'Paid on 12 june, 6:30pm',
                                    fontSize:
                                        MediaQuery.of(context).size.width < 400
                                            ? 12
                                            : 15,
                                  ),
                                  MySecondHeading(text: '₹90.00')
                                ],
                              ),
                              Divider(),
                              MyTextWidget(
                                text: 'Clinet\'s Name',
                                align: TextAlign.start,
                                color: Colors.black,
                                fontSize:
                                    MediaQuery.of(context).size.width < 400
                                        ? 14
                                        : 16,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  MyDescTextWidget(
                                    text: 'Paid on 12 june, 6:30pm',
                                    fontSize:
                                        MediaQuery.of(context).size.width < 400
                                            ? 12
                                            : 15,
                                  ),
                                  MySecondHeading(text: '₹90.00')
                                ],
                              ),
                              Divider(),
                              SizedBox(
                                height: 5,
                              ),
                              Center(
                                  child: MyInkWellButton(
                                      text: 'View Older', onPressed: () {}))
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 25,
                    child: SizedBox(
                      width:
                          MediaQuery.of(context).size.width < 400 ? 300 : 350,
                      height:
                          MediaQuery.of(context).size.width < 400 ? 150 : 175,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                            width: 0.5,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black38,
                              blurRadius: 10,
                              offset: Offset(0, 1.5),
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    MyDescTextWidget(
                                      text: 'Today',
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? 13
                                              : 15,
                                    ),
                                    MySecondHeading(
                                      text: '₹900.00',
                                      fontsize:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? 22
                                              : 25,
                                    ),
                                  ],
                                ),
                              ),
                              Divider(),
                              SizedBox(
                                height: 5,
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        MyDescTextWidget(
                                          text: 'Services',
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  400
                                              ? 15
                                              : 18,
                                        ),
                                        MySecondHeading(
                                          text: '4 Completed',
                                          fontWeight: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  400
                                              ? FontWeight.w600
                                              : FontWeight.w500,
                                          fontsize: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  400
                                              ? 12
                                              : 16,
                                        ),
                                      ],
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        MyDescTextWidget(
                                          text: 'Duration',
                                          fontSize: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  400
                                              ? 15
                                              : 18,
                                          align: TextAlign.center,
                                        ),
                                        MySecondHeading(
                                          text: '6 hrs',
                                          fontWeight: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  400
                                              ? FontWeight.w600
                                              : FontWeight.w500,
                                          fontsize: MediaQuery.of(context)
                                                      .size
                                                      .width <
                                                  400
                                              ? 12
                                              : 16,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
