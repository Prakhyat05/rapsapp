// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:service/export.dart';
import 'package:service/screen/Dashboard1/empty_state.dart';
import 'package:service/service/authentication.dart';

class Step5 extends StatefulWidget {
  Step5({super.key});
  static String urlSend = "";

  @override
  State<Step5> createState() => _Step5State();
}

class _Step5State extends State<Step5> {
  final TextEditingController accountNumber = TextEditingController();

  final TextEditingController branchName = TextEditingController();

  final TextEditingController ifscCode = TextEditingController();
  String urlImage = "";

  databaseData() async {
    await AuthServices().setProfilePhoto(Step1.pickedImageSend!);
    await AuthServices().createProfile(
        Step4.addhar,
        Step1.citySend,
        Step1.districtSend,
        int.parse(Step1.pincodeSend),
        Step1.townSend,
        accountNumber.text,
        branchName.text,
        ifscCode.text);
    await AuthServices().addService(Step2.sproviderPrimary, Step2.ratePrimary,
        Step3.days, Step3.workingTimeStart, Step3.workingTimeEnd);
    await AuthServices().addService(
        Step2.sprovidersecondary,
        Step2.rateSecondary,
        Step3.days,
        Step3.workingTimeStart,
        Step3.workingTimeEnd);
  }

  @override
  Widget build(BuildContext context) {
    Step5.urlSend = urlImage.toString();
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              MyAppBarBackButton(),
              Column(
                children: [
                  SizedBox(
                    height: 35,
                  ),
                  MyAction(pageNumber: '5'),
                ],
              )
            ],
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyHeadingTextWidget(text: 'Secure Your Earnings'),
              MyDescTextWidget(
                  text: 'Enter Your Payment Details for Smooth Transactions'),
              SizedBox(
                height: 30,
              ),
              MyTextField(
                controller: accountNumber,
                keyboardtype: TextInputType.number,
                hintText: 'Account Number',
              ),
              SizedBox(
                height: 15,
              ),
              MyTextField(
                  controller: ifscCode,
                  keyboardtype: TextInputType.text,
                  hintText: 'IFSC Code'),
              SizedBox(
                height: 15,
              ),
              MyTextField(
                  controller: branchName,
                  keyboardtype: TextInputType.name,
                  hintText: 'Branch Name'),
              SizedBox(
                height: 30,
              ),
              MyTextButton(
                  text: 'Complete Profile',
                  onPressed: () {
                    databaseData();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Dashboard()),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
