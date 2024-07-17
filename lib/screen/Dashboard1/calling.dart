// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:service/export.dart';

class Calling extends StatefulWidget {
  const Calling({super.key});

  @override
  State<Calling> createState() => _CallingState();
}

class _CallingState extends State<Calling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 217, 253, 253),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width < 400 ? 100 : 125,
              ),
              // Profile Picture
              CircleAvatar(
                backgroundColor: Color.fromARGB(255, 217, 217, 217),
                radius: MediaQuery.of(context).size.width < 400 ? 50 : 60,
                child: Image.asset(
                  profileImage,
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              MyHeadingTextWidget(
                text: providersName,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width < 400 ? 10 : 15,
              ),
              MyDescTextWidget(
                text: calling,
                fontSize: 14,
              ),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: Offset(5, 5),
                          blurRadius: 10,
                          spreadRadius: 2.5,
                        ),
                      ],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 20,
                              right: 20,
                              top: 15,
                              bottom: 10,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.volume_down_alt,
                                  size: 45,
                                ),
                                Icon(Icons.pause_rounded, size: 45),
                                Icon(
                                  Icons.mic,
                                  size: 40,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width < 400
                                ? 25
                                : 35,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.red,
                              child: Icon(
                                Icons.call_end_rounded,
                                size: 40,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width < 400
                                ? 12
                                : 34,
                          )
                        ]),
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
