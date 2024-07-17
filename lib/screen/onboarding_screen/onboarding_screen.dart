// ignore_for_file: prefer_const_constructors

import 'package:service/export.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final controller = OnboardingItems();
  final pageController = PageController();
  bool isLastPage = false;

  /*storeOnBoardInfo() async {
    int isViewed = 0;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt("onBoard", isViewed);
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        onPageChanged: (index) => setState(() {
          isLastPage = controller.items.length - 1 == index;
        }),
        itemCount: controller.items.length,
        controller: pageController,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    index == 0 ? const SizedBox(height: 20) : const SizedBox(),
                    Expanded(
                      child: Image.asset(
                        controller.items[index].image,
                        fit: BoxFit.contain,
                      ),
                    ),
                    index != 0 ? const SizedBox(height: 200) : const SizedBox(),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: greyWithOpacity0_5,
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height * 0.37,
                  width: double.infinity,
                  child: Padding(
                    padding: MediaQuery.of(context).size.width < 400
                        ? EdgeInsets.symmetric(vertical: 2.5, horizontal: 40)
                        : EdgeInsets.symmetric(vertical: 2.5, horizontal: 45),
                    child: Column(
                      children: [
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.width < 400 ? 25 : 30,
                        ),
                        Text(
                          controller.items[index].title,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.bold,
                            textStyle: TextStyle(
                              color: black,
                              fontSize: MediaQuery.of(context).size.width < 400
                                  ? 25
                                  : 25,
                            ),
                          ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.width < 400 ? 8 : 6,
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Text(
                                  controller.items[index].descriptions,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w400,
                                    textStyle: TextStyle(
                                      color: black,
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? 16
                                              : 17,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // indicator
                                    SmoothPageIndicator(
                                      controller: pageController,
                                      count: controller.items.length,
                                      onDotClicked: (index) =>
                                          pageController.animateToPage(
                                        index,
                                        duration: Duration(milliseconds: 1),
                                        curve: Curves.easeIn,
                                      ),
                                      effect: WormEffect(
                                        dotHeight:
                                            MediaQuery.of(context).size.width <
                                                    400
                                                ? 8
                                                : 12,
                                        dotWidth:
                                            MediaQuery.of(context).size.width <
                                                    400
                                                ? 8
                                                : 12,
                                        activeDotColor: black,
                                        dotColor: greyDotColor,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    // button
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: TextButton(
                                        onPressed: () async {
                                          if (isLastPage) {
                                            /*final pres = await SharedPreferences
                                                .getInstance();
                                            pres.setBool('onboarding', true);

                                            if (mounted!) return;*/
                                            Navigator.pushNamed(
                                                context, 'regemail');
                                          } else {
                                            pageController.nextPage(
                                              duration:
                                                  Duration(milliseconds: 1),
                                              curve: Curves.ease,
                                            );
                                          }
                                        },
                                        style: ButtonStyle(
                                          minimumSize:
                                              MaterialStateProperty.all<Size>(
                                            Size(
                                              MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      400
                                                  ? 260
                                                  : 300,
                                              MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      400
                                                  ? 50
                                                  : 65,
                                            ),
                                          ),
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                MediaQuery.of(context)
                                                            .size
                                                            .width <
                                                        400
                                                    ? 8
                                                    : 10,
                                              ),
                                            ),
                                          ),
                                          backgroundColor:
                                              MaterialStateProperty.all<Color>(
                                            Color(0x00000000).withOpacity(1),
                                          ),
                                        ),
                                        child: Text(
                                          isLastPage
                                              ? gettingStarted
                                              : nextText,
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.normal,
                                            textStyle: TextStyle(
                                              color: white,
                                              fontSize: MediaQuery.of(context)
                                                          .size
                                                          .width <
                                                      400
                                                  ? 25
                                                  : 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
