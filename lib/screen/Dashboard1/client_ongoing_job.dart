// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import "package:service/export.dart";
import "package:service/service/otp.dart";

class ClientOnGoingJob extends StatefulWidget {
  const ClientOnGoingJob({super.key});

  @override
  State<ClientOnGoingJob> createState() => _ClientOnGoingJobState();
}

class _ClientOnGoingJobState extends State<ClientOnGoingJob>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;
  late Animation<double> _animation4;
  late Animation<double> _animation5;
  late Animation<double> _animation6;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    )..repeat();

    // Initialize animations with default values
    _animation1 = Tween<double>(begin: 80.0, end: 80.0).animate(_controller);
    _animation2 = Tween<double>(begin: 92.0, end: 92.0).animate(_controller);
    _animation3 = Tween<double>(begin: 103.0, end: 103.0).animate(_controller);
    _animation4 = Tween<double>(begin: 115.0, end: 115.0).animate(_controller);
    _animation5 = Tween<double>(begin: 126.0, end: 126.0).animate(_controller);
    _animation6 = Tween<double>(begin: 138.0, end: 138.0).animate(_controller);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final width = MediaQuery.of(context).size.width;
      setState(() {
        _animation1 = Tween<double>(begin: 80.0, end: width < 400 ? 92 : 100.0)
            .animate(
                CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
        _animation2 = Tween<double>(
                begin: width < 400 ? 92 : 100.0, end: width < 400 ? 103 : 120.0)
            .animate(
                CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
        _animation3 = Tween<double>(
                begin: width < 400 ? 103 : 120.0,
                end: width < 400 ? 115 : 140.0)
            .animate(
                CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
        _animation4 = Tween<double>(
                begin: width < 400 ? 115 : 140.0,
                end: width < 400 ? 126 : 160.0)
            .animate(
                CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
        _animation5 = Tween<double>(
                begin: width < 400 ? 126 : 160.0,
                end: width < 400 ? 138 : 180.0)
            .animate(
                CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
        _animation6 = Tween<double>(
                begin: width < 400 ? 138 : 180.0,
                end: width < 400 ? 150 : 200.0)
            .animate(
                CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFD6F2F2),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 25,
              ),
              // Client's Text
              MyHeadingTextWidget(text: 'Client\'s'),
              MyDescTextWidget(text: 'Ongoing Job'),
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 800,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black38,
                          blurRadius: 10,
                          offset: Offset(0, 1.5),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MySecondHeading(
                                      text: 'Client\'s name',
                                      fontWeight:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? FontWeight.w600
                                              : FontWeight.w700,
                                      fontsize:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? 16
                                              : 18,
                                    ),
                                    MyDescTextWidget(
                                      text: 'Service Requested',
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? 16
                                              : 18,
                                    ),
                                  ],
                                ),
                                MyInkWellButton(
                                    text: 'Cancel', onPressed: () {})
                              ],
                            ),
                            SizedBox(
                              height: 2.5,
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  locationImage,
                                  width: 25,
                                  height: 25,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                MySecondHeading(
                                  text: 'Client Location',
                                  fontWeight: FontWeight.w600,
                                  fontsize:
                                      MediaQuery.of(context).size.width < 400
                                          ? 14
                                          : 16,
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    MyDescTextWidget(
                                      text: 'Duration',
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? 14
                                              : 16,
                                    ),
                                    MySecondHeading(
                                      text: '2 hrs',
                                      fontsize:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? 14
                                              : 16,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    MyDescTextWidget(
                                      text: 'Price',
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? 14
                                              : 16,
                                    ),
                                    MySecondHeading(
                                      text: '₹70/-',
                                      fontsize:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? 14
                                              : 16,
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    MyDescTextWidget(
                                      text: 'Start Time',
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? 14
                                              : 16,
                                    ),
                                    MySecondHeading(
                                      text: '9:12 AM',
                                      fontsize:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? 14
                                              : 16,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.width < 400 ? 15 : 30,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width < 400
                              ? 150
                              : 300,
                          width: MediaQuery.of(context).size.width < 400
                              ? 150
                              : 300,
                          child: Center(
                            child: AnimatedBuilder(
                              animation: _controller,
                              builder: (context, child) {
                                return Stack(
                                  alignment: Alignment.center,
                                  children: <Widget>[
                                    Container(
                                      height: _animation6.value,
                                      width: _animation6.value,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade400
                                            .withOpacity(0.75),
                                      ),
                                    ),
                                    Container(
                                      width: _animation5.value,
                                      height: _animation5.value,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade500
                                            .withOpacity(0.6),
                                      ),
                                    ),
                                    Container(
                                      width: _animation4.value,
                                      height: _animation4.value,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade600
                                            .withOpacity(0.5),
                                      ),
                                    ),
                                    Container(
                                      width: _animation3.value,
                                      height: _animation3.value,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade700
                                            .withOpacity(0.4),
                                      ),
                                    ),
                                    Container(
                                      width: _animation2.value,
                                      height: _animation2.value,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade800
                                            .withOpacity(0.3),
                                      ),
                                    ),
                                    Container(
                                      width: _animation1.value,
                                      height: _animation1.value,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey.shade900
                                            .withOpacity(0.2),
                                      ),
                                    ),
                                    Container(
                                      width:
                                          85.0, // Fixed size for the middle circle
                                      height: 85.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    MyHeadingTextWidget(
                                      text: '15:49',
                                      color: Colors.white70,
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.width < 400 ? 18 : 25,
                        ),
                        MyTextButton(
                          text: 'Add 10 mins',
                          onPressed: () {},
                          textColor: Color.fromARGB(255, 131, 145, 161),
                          buttonColor: Color.fromARGB(40, 120, 119, 119),
                        ),
                        SizedBox(
                          height:
                              MediaQuery.of(context).size.width < 400 ? 10 : 15,
                        ),
                        MyTextButton(
                          text: 'Mark as complete',
                          onPressed: () async {
                            await requestOTP();
                            if (mounted) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ServiceOtpVerification(
                                            descText:
                                                'Enter the verification code to complete service request.',
                                            whereToGo: 'pay',
                                          )));
                            }
                          },
                        ),
                      ],
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

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");

    Navigator.pushReplacementNamed(context, 'dashboard');
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        ElevatedButton(
          child: const Text("Continue"),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );

    @override
    void dispose() {
      super.dispose();
      razorpay.clear();
    }
  }
}
