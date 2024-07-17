// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:service/export.dart';
import 'package:firebase_storage/firebase_storage.dart';
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
    UploadTask uploadTask = FirebaseStorage.instance
        .ref("Profile Pics")
        .child(Step1.nameSend)
        .putFile(Step1.pickedImageSend!);
    TaskSnapshot taskSnapshot = await uploadTask;
    String url = await taskSnapshot.ref.getDownloadURL();
    urlImage = url;
    await FirebaseFirestore.instance
        .collection("profile")
        .doc(AuthServices.uidUser)
        .set({
      "Image": url,
      "Full Name": Step1.nameSend,
      "Town": Step1.townSend,
      "City": Step1.citySend,
      "District": Step1.districtSend,
      "Pin Code": Step1.pincodeSend,
      "Service Provided (Primary)": Step2.sproviderPrimary,
      "Rate Per Hour (Primary)": Step2.ratePrimary,
      "Service Provided (Secondary)": Step2.sprovidersecondary,
      "Rate Per Hour (Secondary)": Step2.rateSecondary,
      "Working Days": Step3.days,
      "Working Hours": Step3.workingHours,
      "Aadhar Number": Step4.addhar,
      "Account Number": accountNumber.text.toString(),
      "Branch Name": branchName.text.toString(),
      "IFSC Code": ifscCode.text.toString(),
    }).then((value) {
      print("User Uploaded");
    });
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
