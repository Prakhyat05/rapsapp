// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:service/export.dart';

final Razorpay razorpay = Razorpay();

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyTextButton(
                  text: 'Pay Rs 70',
                  onPressed: () {
                    var options = {
                      'key': 'rzp_test_GcZZFDPP0jHtC4',
                      'amount': 100 * 70,
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
                    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                        handlePaymentErrorResponse);
                    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                        handlePaymentSuccessResponse);
                  })
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
