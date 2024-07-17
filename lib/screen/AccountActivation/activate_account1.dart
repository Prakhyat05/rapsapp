// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields

import 'package:service/export.dart';

class ActivateAccount1 extends StatefulWidget {
  const ActivateAccount1({super.key});

  @override
  State<ActivateAccount1> createState() => _ActivateAccount1State();
}

class _ActivateAccount1State extends State<ActivateAccount1> {
  bool showOptions = false;

  final Razorpay razorpay = Razorpay();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 50,
            bottom: 25,
            left: 25,
            right: 25,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyHeadingTextWidget(text: 'Activate Your Account'),
              MyDescTextWidget(text: 'Pay a Nominal Fee of ₹39 to Get Started'),
              SizedBox(height: 20),
              MySecondHeading(text: 'Select payment option'),
              SizedBox(height: 20),
              MyGestureButton(
                onPressed: () {
                  var options = {
                    'key': 'rzp_test_GcZZFDPP0jHtC4',
                    'amount': 100 * 39, // as 39 need to be paid
                    'name': 'RASP APP',
                    'method': {
                      'netbanking': 'false',
                      'card': 'false',
                      'upi': 'true',
                      'wallet': 'false',
                      'paylater': 'false'
                    },
                    'description': 'Subscription Fee',
                    'prefill': {
                      'contact': '9779791959',
                      'email': 'rg.ratn@gmail.com'
                    }
                  };
                  razorpay.open(options);
                  razorpay.on(
                      Razorpay.EVENT_PAYMENT_ERROR, handlePaymentErrorResponse);
                  razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                      handlePaymentSuccessResponse);
                },
                hintText: 'Pay using UPI',
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
