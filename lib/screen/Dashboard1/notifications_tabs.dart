// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import "package:service/export.dart";

class NotificationTab extends StatefulWidget {
  @override
  State<NotificationTab> createState() => _NotificationTabState();
}

class _NotificationTabState extends State<NotificationTab> {
  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabs: [
        Tab(
          text: 'All',
        ),
        Tab(
          text: 'Activities',
        ),
        Tab(
          text: 'Messages',
        ),
      ],
      labelStyle: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        textStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width < 400 ? 16 : 17,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      unselectedLabelStyle: GoogleFonts.montserrat(
        fontWeight: FontWeight.w500,
        textStyle: TextStyle(
          fontSize: MediaQuery.of(context).size.width < 400 ? 14 : 15,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      labelColor: Color.fromARGB(
        255,
        53,
        194,
        193,
      ),
      unselectedLabelColor: Color.fromARGB(
        255,
        144,
        143,
        157,
      ),
      indicator: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: Color.fromARGB(
              255,
              53,
              194,
              193,
            ),
          ),
        ),
        color: Colors.transparent,
      ),
    );
  }
}
