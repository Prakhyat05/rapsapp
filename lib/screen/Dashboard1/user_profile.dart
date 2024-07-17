// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:service/export.dart';

class DashboardUserProfile extends StatefulWidget {
  const DashboardUserProfile({super.key});

  @override
  State<DashboardUserProfile> createState() => _DashboardUserProfileState();
}

class _DashboardUserProfileState extends State<DashboardUserProfile> {
  bool availablityStatu = true;
  String youAreAva = 'You are now available';
  String youAreNotAva = 'You are not available';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6F2F2),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height < 750 ? 30 : 40,
            ),
            Row(
              children: [
                MyAppBarBackButton(),
                SizedBox(
                  width: MediaQuery.of(context).size.width < 400
                      ? 50
                      : MediaQuery.of(context).size.width < 420
                          ? 90
                          : 110,
                ),
                MySecondHeading(
                  text: 'Profile',
                  fontWeight: FontWeight.w600,
                  fontsize: 20,
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final content = Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Profile Picture
                CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 217, 217, 217),
                  radius: MediaQuery.of(context).size.width < 400 ? 50 : 60,
                  child: Image.asset(
                    'assets/images/Dashboard/Profile.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MySecondHeading(
                      text: 'Provider\'s Name',
                      fontWeight: FontWeight.w500,
                      fontsize: 18,
                    ),
                    SizedBox(width: 5),
                    Image.asset(
                      'assets/images/Dashboard/Successmark.png',
                      width: 15,
                      height: 15,
                    ),
                  ],
                ),
                MyDescTextWidget(
                  text: 'UID:123456',
                  fontSize: 14,
                ),
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width > 400 &&
                              MediaQuery.of(context).size.height > 750
                          ? MediaQuery.of(context).size.height - 360
                          : null,
                      margin: EdgeInsets.only(top: 100),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                              height:
                                  70), // Adjusted to create space for the status container
                          // Availability Status
                          Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            decoration: BoxDecoration(
                              color: availablityStatu
                                  ? Color.fromARGB(255, 224, 255, 224)
                                  : Color.fromARGB(255, 254, 219, 219),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MySecondHeading(
                                      text: 'Availability Status',
                                      fontsize:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? 18
                                              : 20,
                                      fontWeight:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? FontWeight.w500
                                              : FontWeight.w600,
                                    ),
                                    MyDescTextWidget(
                                      text: availablityStatu
                                          ? youAreAva
                                          : youAreNotAva,
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? 14
                                              : 16,
                                      color: availablityStatu
                                          ? Colors.green
                                          : Colors.red,
                                    ),
                                  ],
                                ),
                                Switch(
                                  value: availablityStatu,
                                  onChanged: (val) {
                                    setState(() {
                                      availablityStatu = !availablityStatu;
                                    });
                                  },
                                  activeColor: Colors.green,
                                  inactiveThumbColor: Colors.red,
                                  inactiveTrackColor:
                                      Color.fromARGB(255, 237, 138, 138),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 20),
                          // Options
                          ListTile(
                            leading: Image.asset(
                                'assets/images/Dashboard/Language.png',
                                width: 30,
                                height: 30),
                            title: MySecondHeading(
                              text: 'App Language',
                              fontWeight:
                                  MediaQuery.of(context).size.width < 400
                                      ? FontWeight.w600
                                      : FontWeight.w600,
                              fontsize: MediaQuery.of(context).size.width < 400
                                  ? 18
                                  : 20,
                            ),
                            onTap: () {},
                          ),
                          Divider(),
                          ListTile(
                            leading: Image.asset(
                                'assets/images/Dashboard/Password.png',
                                width: 30,
                                height: 30),
                            title: MySecondHeading(
                              text: 'Change Password',
                              fontWeight:
                                  MediaQuery.of(context).size.width < 400
                                      ? FontWeight.w600
                                      : FontWeight.w600,
                              fontsize: MediaQuery.of(context).size.width < 400
                                  ? 18
                                  : 20,
                            ),
                            onTap: () {},
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height < 750
                                ? 20
                                : MediaQuery.of(context).size.height < 850
                                    ? 30
                                    : MediaQuery.of(context).size.height < 900
                                        ? 50
                                        : 220,
                          ),
                          MyTextWidget(
                            text: 'Version 0.1 (Alpha Testing)',
                            color: Colors.grey,
                            align: TextAlign.center,
                            fontSize: 12,
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 55,
                      child: SizedBox(
                        width:
                            MediaQuery.of(context).size.width < 400 ? 300 : 350,
                        height: 100,
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      MySecondHeading(
                                        text: '150',
                                        fontsize:
                                            MediaQuery.of(context).size.width <
                                                    400
                                                ? 16
                                                : 18,
                                      ),
                                      MyDescTextWidget(
                                        text: 'Services \ndelivered',
                                        fontSize:
                                            MediaQuery.of(context).size.width <
                                                    400
                                                ? 13
                                                : 15,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.black54,
                                  width: 1,
                                  height: 50,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      MySecondHeading(
                                        text: '64',
                                        fontsize:
                                            MediaQuery.of(context).size.width <
                                                    400
                                                ? 16
                                                : 18,
                                      ),
                                      MyDescTextWidget(
                                        text: 'Day(s) of experience',
                                        fontSize:
                                            MediaQuery.of(context).size.width <
                                                    400
                                                ? 13
                                                : 15,
                                        align: TextAlign.center,
                                      ),
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
            );

            return constraints.maxHeight > MediaQuery.of(context).size.height
                ? content
                : SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: content,
                    ),
                  );
          },
        ),
      ),
    );
  }
}
