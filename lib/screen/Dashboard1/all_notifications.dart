// ignore_for_file: prefer_const_constructors

import 'package:service/export.dart';

class AllNotifications extends StatefulWidget {
  const AllNotifications({super.key});

  @override
  State<AllNotifications> createState() => _AllNotificationsState();
}

class _AllNotificationsState extends State<AllNotifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 25,
        ), // Add padding around the card
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 25,
                            backgroundColor: greyWithOpacity0_5,
                            child: Image.asset(
                              profileImage,
                              height: 50,
                              width: 50,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MySecondHeading(
                              text: 'Clinet Name',
                              fontWeight: MediaQuery.of(context).size.width < 400
                                  ? fontWeight400
                                  : fontWeight500,
                              fontsize: MediaQuery.of(context).size.width < 400
                                  ? 16
                                  : 18,
                            ),
                            MyTextWidget(
                              text: 'Sent you chat , this is chat',
                              fontWeight: MediaQuery.of(context).size.width < 400
                                  ? fontWeight400
                                  : fontWeight500,
                              fontSize: MediaQuery.of(context).size.width < 400
                                  ? 10
                                  : 12,
                            ),
                            MyTextWidget(
                              text: '1 hour ago',
                              fontWeight: MediaQuery.of(context).size.width < 400
                                  ? fontWeight400
                                  : fontWeight500,
                              fontSize: MediaQuery.of(context).size.width < 400
                                  ? 10
                                  : 12,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: MyTextWidget(
                        fontWeight: MediaQuery.of(context).size.width < 400
                            ? fontWeight400
                            : fontWeight500,
                        text: '9:45pm',
                        fontSize:
                            MediaQuery.of(context).size.width < 400 ? 10 : 12,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                            radius: 25,
                            backgroundColor: greyWithOpacity0_5,
                            child: Image.asset(
                              profileImage,
                              height: 50,
                              width: 50,
                            )),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MySecondHeading(
                              text: 'Congratulations',
                              fontWeight: MediaQuery.of(context).size.width < 400
                                  ? fontWeight400
                                  : fontWeight500,
                              fontsize: MediaQuery.of(context).size.width < 400
                                  ? 16
                                  : 18,
                            ),
                            MyTextWidget(
                              text: 'you have Completed milestones',
                              fontWeight: MediaQuery.of(context).size.width < 400
                                  ? fontWeight400
                                  : fontWeight500,
                              fontSize: MediaQuery.of(context).size.width < 400
                                  ? 10
                                  : 12,
                            ),
                            MyTextWidget(
                              text: '1 hour ago',
                              fontWeight: MediaQuery.of(context).size.width < 400
                                  ? fontWeight400
                                  : fontWeight500,
                              fontSize: MediaQuery.of(context).size.width < 400
                                  ? 10
                                  : 12,
                            ),
                          ],
                        ),
                      ],
                    ),
                    Center(
                      child: MyTextWidget(
                        fontWeight: MediaQuery.of(context).size.width < 400
                            ? fontWeight400
                            : fontWeight500,
                        text: '9:45pm',
                        fontSize:
                            MediaQuery.of(context).size.width < 400 ? 10 : 12,
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
