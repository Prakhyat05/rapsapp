// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:developer';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:service/export.dart';

class Step1 extends StatefulWidget {
  const Step1({super.key});
  static String nameSend = "";
  static String townSend = "";
  static String citySend = "";
  static String districtSend = "";
  static String pincodeSend = "";
  static String urlSend = "";
  static File? pickedImageSend;

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  final TextEditingController name = TextEditingController();
  final TextEditingController town = TextEditingController();
  final TextEditingController city = TextEditingController();
  final TextEditingController district = TextEditingController();
  final TextEditingController pincode = TextEditingController();
  File? pickedImage;
  //String urlImage = "";

  showAlertBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Select Image From"),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  onTap: () {
                    pickImage(ImageSource.camera);
                    Navigator.pop(context);
                  },
                  leading: Icon(Icons.camera_alt),
                  title: Text("Camera"),
                ),
                ListTile(
                  onTap: () {
                    pickImage(ImageSource.gallery);
                    Navigator.pop(context);
                  },
                  leading: Icon(Icons.image),
                  title: Text("Gallery"),
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    Step1.nameSend = name.text.toString();
    Step1.townSend = town.text.toString();
    Step1.citySend = city.text.toString();
    Step1.districtSend = district.text.toString();
    Step1.pincodeSend = pincode.text.toString();
    //Step1.urlSend = urlImage;
    Step1.pickedImageSend = pickedImage;

    /*uploadData() async {
      UploadTask uploadTask = FirebaseStorage.instance
          .ref("Profile Pics")
          .child(Step1.nameSend)
          .putFile(pickedImage!);
      TaskSnapshot taskSnapshot = await uploadTask;
      String url = await taskSnapshot.ref.getDownloadURL();
      urlImage = url;
      print(Step1.urlSend);
      print("Data Uploaded");
    }*/

    bool isSmallScreen = screenWidth < 350 || screenHeight < 800;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: Column(
            children: [
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyAppBarBackButton(),
                  Column(
                    children: [
                      MyAction(pageNumber: '1'),
                    ],
                  )
                ],
              ),
            ],
          )),
      body: SafeArea(
        child: LayoutBuilder(builder: (context, constraints) {
          return SizedBox(
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MyHeadingTextWidget(text: 'You\'re Almost There!'),
                      MyDescTextWidget(text: 'Let\'s Get to Know You Better'),

                      SizedBox(
                        height: 15,
                      ),
                      // image

                      Center(
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                showAlertBox();
                              },
                              child: pickedImage != null
                                  ? CircleAvatar(
                                      radius: 50,
                                      backgroundImage: FileImage(pickedImage!),
                                    )
                                  : CircleAvatar(
                                      radius: 50,
                                      child: Image.asset(
                                          'assets/images/profile/AddImage.png',
                                          scale: 4),
                                    ),
                            ),
                            /*InkWell(
                              onTap: () {
                                showAlertBox();
                              },
                              child: Image.asset(
                                  'assets/images/profile/AddImage.png',
                                  scale: 4),
                            ),*/
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 10,
                      ),

                      Center(child: MyTextWidget(text: 'Add Profile Image')),

                      SizedBox(
                        height: 20,
                      ),

                      MyTextField(
                          controller: name,
                          keyboardtype: TextInputType.name,
                          hintText: 'Enter your Full Name'),

                      SizedBox(
                        height: 15,
                      ),
                      MyTextField(
                          controller: town,
                          keyboardtype: TextInputType.streetAddress,
                          hintText: 'Enter your Town'),
                      SizedBox(
                        height: 15,
                      ),
                      MyTextField(
                          controller: city,
                          keyboardtype: TextInputType.streetAddress,
                          hintText: 'Enter your City'),
                      SizedBox(
                        height: 15,
                      ),
                      MyTextField(
                          controller: district,
                          keyboardtype: TextInputType.streetAddress,
                          hintText: 'Enter your District'),
                      SizedBox(
                        height: 15,
                      ),
                      MyTextField(
                          controller: pincode,
                          keyboardtype: TextInputType.number,
                          hintText: 'Enter your PinCode'),
                      SizedBox(
                        height: 15,
                      ),

                      isSmallScreen
                          ? SizedBox()
                          : MyTextButton(
                              text: 'Next',
                              onPressed: () {
                                //uploadData();
                                Navigator.pushNamed(context, 'profile_step2');
                              }),
                      SizedBox(
                        height: 15,
                      ),

                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }),
      ),
      bottomNavigationBar: isSmallScreen
          ? BottomAppBar(
              color: Colors.white,
              child: MyTextButton(
                  text: 'Next',
                  onPressed: () {
                    Navigator.pushNamed(context, 'profile_step2');
                  }),
            )
          : SizedBox(),
    );
  }

  pickImage(ImageSource imageSource) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageSource);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });
    } catch (e) {
      log(e.toString());
    }
  }
}
