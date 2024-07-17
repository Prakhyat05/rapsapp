// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:firebase_storage/firebase_storage.dart';
import 'package:service/export.dart';
import 'package:service/service/get_data.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  TextEditingController searchController = TextEditingController();
  bool newNotification = true;

  bool serviceRequest = true;
  bool reviews = true;
  bool earning = true;

  final storage = FirebaseStorage.instance;
  late String imageUrl;

  @override
  Widget build(BuildContext context) {
    Future<void> getImageUrl() async {
      final ref = storage.ref();
      final url = await ref.getDownloadURL();
      imageUrl = url;
    }

    print(MediaQuery.of(context).size.width);
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: Colors.transparent,
      ),
      child: Scaffold(
        backgroundColor: allBackgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: Container(
            color: Color(0xFFD6F2F2),
            height: 200,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 217, 217, 217),
                            radius: MediaQuery.of(context).size.width < 400
                                ? 20
                                : 25,
                            child: Builder(
                              builder: (context) => InkWell(
                                onTap: () => Scaffold.of(context).openDrawer(),
                                //child: Image.network(imageUrl),
                                child: Image.asset(
                                    'assets/images/Dashboard/Profile.png'),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width < 400
                                  ? 10
                                  : 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyTextWidget(
                                text: 'Hello',
                                fontSize:
                                    MediaQuery.of(context).size.width < 400
                                        ? 12
                                        : 15,
                              ),
                              MySecondHeading(
                                text: 'Provider',
                                fontWeight: FontWeight.w400,
                                fontsize:
                                    MediaQuery.of(context).size.width < 400
                                        ? 18
                                        : 22,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'notificationPage');
                            },
                            icon: Icon(
                              Icons.notifications,
                              size: MediaQuery.of(context).size.width < 400
                                  ? 30
                                  : 37,
                              color: Colors.black,
                            ),
                          ),
                          newNotification
                              ? Positioned(
                                  bottom: 10,
                                  right: 10,
                                  child: Icon(
                                    Icons.circle,
                                    size: 15,
                                    color: Colors.amber,
                                  ),
                                )
                              : SizedBox.shrink(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        drawer: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.zero,
              bottomRight: Radius.zero,
            ),
          ),
          child: SingleChildScrollView(
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      MyDrawerHeader(),
                      MyDrawerList(),
                    ],
                  ),
                  MyDrawerBottom(),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
              color: Color(0xFFD6F2F2),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(80))),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  MySearchTextField(),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 100),
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset: Offset(0, 3),
                            ),
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 30, horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(height: 30),
                              // Recent Reviews
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 125,
                                    ),
                                    // review heading
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MySecondHeading(
                                          text: 'Recent Reviews',
                                          fontsize: 20,
                                        ),
                                        MyInkWellButton(
                                            text: 'View all',
                                            fontsize: 15,
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, 'allReviews');
                                            }),
                                      ],
                                    ),
                                    SizedBox(height: 25),
                                    // Review Cards
                                    reviews
                                        ? _buildReviewCard()
                                        : _buildReviewEmptyCard(),
                                    SizedBox(height: 25),
                                    // Your Earnings
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        MySecondHeading(
                                          text: 'Your Earnings',
                                          fontsize: 20,
                                        ),
                                        MyInkWellButton(
                                            fontsize: 15,
                                            text: 'View all',
                                            onPressed: () {
                                              Navigator.pushNamed(
                                                  context, 'earning');
                                            }),
                                      ],
                                    ),
                                    SizedBox(height: 20),
                                    _buildEarningsCard(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 25,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width < 400
                              ? 300
                              : 350,
                          height: serviceRequest
                              ? MediaQuery.of(context).size.width < 400
                                  ? 231
                                  : 235
                              : MediaQuery.of(context).size.width < 400
                                  ? 200
                                  : 210,
                          child: serviceRequest
                              ? MyServiceRequest(
                                  date: 'Date',
                                  time: 'Time',
                                  customerName: 'Name',
                                  serviceType: "Service",
                                  place: 'place',
                                  duration: '2 Hours',
                                  distance: '0.2 Km',
                                  price: '700',
                                  rightButtonOnTap: () {
                                    Navigator.pushNamed(
                                        context, 'serviceOTPVerification');
                                  },
                                  leftButtonOnTap: () {},
                                )
                              : Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                      width: 1,
                                      color: Colors.white,
                                    ),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      ),
                                    ],
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Image.asset(
                                              'assets/images/Dashboard/Rectangle.png', // Update with the actual image path
                                              height: 125,
                                              width: 125,
                                            ),
                                            MyDescTextWidget(
                                              text:
                                                  'No instant\nservice request',
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                            255,
                                            53,
                                            194,
                                            193,
                                          ),
                                          border: Border.all(
                                            width: 1,
                                            color: Color.fromARGB(
                                              255,
                                              53,
                                              194,
                                              193,
                                            ),
                                          ),
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(5),
                                            bottomRight: Radius.circular(5),
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: 25,
                                            ),
                                            Icon(
                                              Icons.remove_red_eye,
                                              size: 35,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Expanded(
                                                child: RotatingTextWidget()),
                                            SizedBox(
                                              width: 50,
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
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
        ),
      ),
    );
  }

  Widget _buildReviewCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black54,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: MediaQuery.of(context).size.width < 400 ? 15 : 20,
                  backgroundColor: Color.fromARGB(255, 217, 217, 217),
                ),
                SizedBox(
                    width: MediaQuery.of(context).size.width < 400 ? 10 : 15),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MySecondHeading(
                      text: 'Reviewer Name',
                      fontsize:
                          MediaQuery.of(context).size.width < 400 ? 15 : 18,
                      fontWeight: FontWeight.w600,
                    ),
                    ReviewStar(),
                  ],
                )
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 10),
                Expanded(
                  child: MyDescTextWidget(
                    text:
                        'Is simply dummy text of the printing and typesetting ',
                    fontSize: MediaQuery.of(context).size.width < 400 ? 13 : 15,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // widget emmpty card
  Widget _buildReviewEmptyCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black54,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: MediaQuery.of(context).size.width < 400 ? 10 : 15),
            Image.asset(
              'assets/images/Dashboard/Docs.png',
              width: MediaQuery.of(context).size.width < 400 ? 50 : 75,
              height: MediaQuery.of(context).size.width < 400 ? 50 : 75,
            ),
            SizedBox(width: MediaQuery.of(context).size.width < 400 ? 10 : 15),
            MyDescTextWidget(
              text: 'No Review Yet',
              fontSize: MediaQuery.of(context).size.width < 400 ? 18 : 20,
            ),
            SizedBox(width: MediaQuery.of(context).size.width < 400 ? 10 : 15),
          ],
        ),
      ),
    );
  }

  Widget _buildEarningsCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black54,
          width: 0.5,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyDescTextWidget(
                    text: 'Earnings this month',
                    fontSize: MediaQuery.of(context).size.width < 400 ? 15 : 18,
                  ),
                  MySecondHeading(
                    text: earning ? '\u20B92000.00' : '-',
                    fontsize: MediaQuery.of(context).size.width < 400 ? 13 : 15,
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.black54,
              width: 1,
              height: 75,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  MyDescTextWidget(
                    text: 'Earnings last month',
                    fontSize: MediaQuery.of(context).size.width < 400 ? 15 : 18,
                    align: TextAlign.end,
                  ),
                  MySecondHeading(
                    text: earning ? '\u20B99000.00' : '-',
                    fontsize: MediaQuery.of(context).size.width < 400 ? 13 : 15,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewStar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star, color: Colors.amber),
        Icon(Icons.star, color: Colors.amber),
      ],
    );
  }
}
