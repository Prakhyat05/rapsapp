// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:service/export.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Ensure this matches the number of tabs
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(118),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 0.0),
            color: Color(0xFFD6F2F2), //Color.fromARGB(255, 217, 253, 253),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height < 750 ? 30 : 30,
                ),
                Row(
                  children: [
                    SizedBox(),
                    MyAppBarBackButton(),
                    SizedBox(
                      width: 25,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 25,
                        ),
                        MySecondHeading(
                          text: 'Notifications',
                          fontWeight: FontWeight.bold,
                          fontsize:
                              MediaQuery.of(context).size.width < 400 ? 24 : 26,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width < 400 ? 2 : 0,
                ),
                NotificationTab(), // TabBar will be here
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [AllNotifications(), Activites(), Messages()],
        ),
      ),
    );
  }
}
