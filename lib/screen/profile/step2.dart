// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:service/common/AlertDialogBox/service_provider.dart';
import 'package:service/export.dart';
import 'package:snippet_coder_utils/FormHelper.dart';

class Step2 extends StatefulWidget {
  const Step2({super.key});
  static String sproviderPrimary = "";
  static String sprovidersecondary = "";
  static var ratePrimary;
  static var rateSecondary;

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  final TextEditingController listServiceProviderPrimary =
      TextEditingController();
  final TextEditingController ratePerHourPrimary = TextEditingController();

  final TextEditingController listServiceProviderSecondary =
      TextEditingController();
  final TextEditingController ratePerHourSecondary = TextEditingController();

  List<dynamic> category = [];
  List<dynamic> subcategory = [];
  List<dynamic> subcategoryMaster = [];

  String? categoryId;
  String? subcategoryId;

  @override
  void initState() {
    super.initState();

    this.category.add({"id": 1, "name": "Personal Services"});
    this.category.add({"id": 2, "name": "Home Maintenance"});
    this.category.add({"id": 3, "name": "Education"});
    this.category.add({"id": 4, "name": "Household and Other Services"});
    this.category.add({"id": 5, "name": "Health and Wellness"});
    this.category.add({"id": 6, "name": "Professional Services"});
    this.category.add({"id": 7, "name": "Event and Entertainment"});
    this.category.add({"id": 8, "name": "Food and Beverage"});
    this.category.add({"id": 9, "name": "Transportation"});
    this.category.add({"id": 10, "name": "Travel and Hospitality"});
    this.category.add({"id": 11, "name": "Technology and Digital Services"});

    this.subcategoryMaster.add({"ID": 1, "Name": "Beauticians", "ParentId": 1});
    this
        .subcategoryMaster
        .add({"ID": 2, "Name": "Fashion Advice", "ParentId": 1});
    this
        .subcategoryMaster
        .add({"ID": 3, "Name": "Tailoring Services", "ParentId": 1});
    this.subcategoryMaster.add({"ID": 1, "Name": "Plumber", "ParentId": 2});
    this.subcategoryMaster.add({"ID": 2, "Name": "Electrician", "ParentId": 2});
    this.subcategoryMaster.add({"ID": 3, "Name": "Masons", "ParentId": 2});
    this.subcategoryMaster.add({"ID": 4, "Name": "Carpenters", "ParentId": 2});
    this
        .subcategoryMaster
        .add({"ID": 5, "Name": "Interior Decorator", "ParentId": 2});
    this
        .subcategoryMaster
        .add({"ID": 6, "Name": "Exterior Decorator", "ParentId": 2});
    this.subcategoryMaster.add({"ID": 7, "Name": "Architect", "ParentId": 2});
    this.subcategoryMaster.add({"ID": 8, "Name": "Glass Work", "ParentId": 2});
    this
        .subcategoryMaster
        .add({"ID": 9, "Name": "Housekeeping", "ParentId": 2});
    this.subcategoryMaster.add({"ID": 10, "Name": "Maids", "ParentId": 2});
    this
        .subcategoryMaster
        .add({"ID": 1, "Name": "Home Tutions", "ParentId": 3});
    this
        .subcategoryMaster
        .add({"ID": 2, "Name": "Tution Centre", "ParentId": 3});
    this
        .subcategoryMaster
        .add({"ID": 3, "Name": "Online Tution", "ParentId": 3});
    this
        .subcategoryMaster
        .add({"ID": 4, "Name": "Coaching Service/Sports", "ParentId": 3});
    this
        .subcategoryMaster
        .add({"ID": 5, "Name": "Expert Talks/Demo (Offline)", "ParentId": 3});
    this
        .subcategoryMaster
        .add({"ID": 6, "Name": "Online Guest Lectures", "ParentId": 3});
    this
        .subcategoryMaster
        .add({"ID": 7, "Name": "Project Works", "ParentId": 3});
    this
        .subcategoryMaster
        .add({"ID": 8, "Name": "Speaking Courses", "ParentId": 3});
    this
        .subcategoryMaster
        .add({"ID": 1, "Name": "Home/room for Rent", "ParentId": 4});
    this
        .subcategoryMaster
        .add({"ID": 2, "Name": "Baby Sitting", "ParentId": 4});
    this
        .subcategoryMaster
        .add({"ID": 3, "Name": "Driving Schools", "ParentId": 4});
    this
        .subcategoryMaster
        .add({"ID": 4, "Name": "Car Repairing", "ParentId": 4});
    this
        .subcategoryMaster
        .add({"ID": 5, "Name": "Summer Camps for kids", "ParentId": 4});
    this
        .subcategoryMaster
        .add({"ID": 6, "Name": "House Building Materials", "ParentId": 4});
    this
        .subcategoryMaster
        .add({"ID": 1, "Name": "Online medical Consultation", "ParentId": 5});
    this
        .subcategoryMaster
        .add({"ID": 2, "Name": "Vetrinary Services", "ParentId": 5});
    this
        .subcategoryMaster
        .add({"ID": 3, "Name": "Yoga Service offline", "ParentId": 5});
    this
        .subcategoryMaster
        .add({"ID": 4, "Name": "Yoga service Online", "ParentId": 5});
    this
        .subcategoryMaster
        .add({"ID": 5, "Name": "Fitness programe online", "ParentId": 5});
    this.subcategoryMaster.add({"ID": 1, "Name": "CA Service", "ParentId": 6});
    this
        .subcategoryMaster
        .add({"ID": 2, "Name": "Home Shift Service", "ParentId": 6});
    this
        .subcategoryMaster
        .add({"ID": 3, "Name": "Carrier Councelling", "ParentId": 6});
    this.subcategoryMaster.add({"ID": 4, "Name": "Man Power", "ParentId": 6});
    this
        .subcategoryMaster
        .add({"ID": 1, "Name": "Event Organizing", "ParentId": 7});
    this.subcategoryMaster.add({"ID": 2, "Name": "DJ Services", "ParentId": 7});
    this
        .subcategoryMaster
        .add({"ID": 3, "Name": "Tent Service", "ParentId": 7});
    this
        .subcategoryMaster
        .add({"ID": 4, "Name": "Dance Classes", "ParentId": 7});
    this.subcategoryMaster.add({"ID": 5, "Name": "Photography", "ParentId": 7});
    this
        .subcategoryMaster
        .add({"ID": 1, "Name": "Cooking Service", "ParentId": 8});
    this
        .subcategoryMaster
        .add({"ID": 2, "Name": "Water Tankers", "ParentId": 8});
    this
        .subcategoryMaster
        .add({"ID": 3, "Name": "Water Tank Cleaning", "ParentId": 8});
    this.subcategoryMaster.add({"ID": 1, "Name": "Taxi", "ParentId": 9});
    this.subcategoryMaster.add({"ID": 2, "Name": "Bus Booking", "ParentId": 9});
    this
        .subcategoryMaster
        .add({"ID": 1, "Name": "Tour and Travel Packagee", "ParentId": 10});
    this.subcategoryMaster.add({"ID": 2, "Name": "Hotel", "ParentId": 10});
    this
        .subcategoryMaster
        .add({"ID": 1, "Name": "Web Developing", "ParentId": 11});
    this
        .subcategoryMaster
        .add({"ID": 2, "Name": "Digital Marketing", "ParentId": 11});
  }

  @override
  Widget build(BuildContext context) {
    Step2.ratePrimary = ratePerHourPrimary.text;
    Step2.rateSecondary = ratePerHourSecondary.text;
    Step2.sproviderPrimary = listServiceProviderPrimary.text.toString();
    Step2.sprovidersecondary = listServiceProviderSecondary.text.toString();

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    bool isSmallScreen = screenWidth < 350 || screenHeight < 800;
    return Scaffold(
      backgroundColor: Colors.white,
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
                  MyAction(pageNumber: '2'),
                ],
              )
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 25,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Heading
                      MyHeadingTextWidget(text: 'Define Your Expertise'),
                      // Desc
                      MyDescTextWidget(
                          text: 'Tell Us About the Services You Offer'),

                      //
                      SizedBox(
                        height: 30,
                      ),

                      //heading
                      MySecondHeading(text: 'Primary Service'),

                      //
                      SizedBox(
                        height: 10,
                      ),

                      Column(
                        children: [
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              border: Border.all(
                                color: Colors.black54,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: FormHelper.dropDownWidget(
                                context,
                                "Select Service Category",
                                categoryId,
                                textColor: Colors.white,
                                category, (onChangedVal) {
                              categoryId = onChangedVal;
                              print('Selected Category: $onChangedVal');

                              subcategory = subcategoryMaster
                                  .where(
                                    (subcategoryItem) =>
                                        subcategoryItem["ParentId"]
                                            .toString() ==
                                        onChangedVal.toString(),
                                  )
                                  .toList();
                              subcategoryId = null;
                              setState(() {});
                            }, (onValidateVal) {
                              if (onValidateVal == null) {
                                return 'Please Select Category';
                              }
                              return null;
                            },
                                borderColor: Color(0xF5F5F5FF),
                                borderFocusColor: Color(0xF5F5F5FF),
                                borderRadius: 2,
                                optionValue: "id",
                                optionLabel: "name",
                                //borderWidth: 2,
                                paddingTop: 5,
                                paddingLeft: 10,
                                paddingRight: 0,
                                paddingBottom: 5,
                                hintFontSize: 18),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              border: Border.all(
                                color: Colors.black54,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: FormHelper.dropDownWidget(
                                context,
                                "Select Service Sub Category",
                                subcategoryId,
                                subcategory, (onChangedVal) {
                              subcategoryId = onChangedVal;
                              print('Selected Sub Category: $onChangedVal');
                            }, (onValidate) {
                              return null;
                            },
                                borderColor: Color(0xF5F5F5FF),
                                borderFocusColor: Color(0xF5F5F5FF),
                                borderRadius: 2,
                                optionValue: "ID",
                                optionLabel: "Name",
                                //borderWidth: 2,
                                paddingTop: 5,
                                paddingLeft: 10,
                                paddingRight: 0,
                                paddingBottom: 5,
                                hintFontSize: 18),
                          )
                        ],
                      ),

                      /*MyGestureButton(
                          onPressed: (){},
                          hintText: 'Select Service Category',
                          imageLocation:
                              'assets/images/profile/DropdownIcon.png'),*/
                      /*SizedBox(
                        height: 15,
                      ),

                      // List Services Provided
                      MyTextField(
                        controller: listServiceProviderPrimary,
                        keyboardtype: TextInputType.name,
                        hintText: 'List Services Provided',
                      ),*/
                      SizedBox(
                        height: 15,
                      ),

                      // Rater Per Hour
                      MyTextField(
                        controller: ratePerHourPrimary,
                        keyboardtype: TextInputType.number,
                        hintText: 'Rate/Hour',
                      ),

                      // SizedBox
                      SizedBox(
                        height: 35,
                      ),

                      //
                      MySecondHeading(text: 'Secondary Service (Optional)'),
                      SizedBox(
                        height: 10,
                      ),

                      Column(
                        children: [
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              border: Border.all(
                                color: Colors.black54,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: FormHelper.dropDownWidget(
                                context,
                                "Select Service Category",
                                categoryId,
                                textColor: Colors.white,
                                category, (onChangedVal) {
                              categoryId = onChangedVal;
                              print('Selected Category: $onChangedVal');

                              subcategory = subcategoryMaster
                                  .where(
                                    (subcategoryItem) =>
                                        subcategoryItem["ParentId"]
                                            .toString() ==
                                        onChangedVal.toString(),
                                  )
                                  .toList();
                              subcategoryId = null;
                              setState(() {});
                            }, (onValidateVal) {
                              if (onValidateVal == null) {
                                return 'Please Select Category';
                              }
                              return null;
                            },
                                borderColor: Color(0xF5F5F5FF),
                                borderFocusColor: Color(0xF5F5F5FF),
                                borderRadius: 2,
                                optionValue: "id",
                                optionLabel: "name",
                                //borderWidth: 2,
                                paddingTop: 5,
                                paddingLeft: 10,
                                paddingRight: 0,
                                paddingBottom: 5,
                                hintFontSize: 18),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              border: Border.all(
                                color: Colors.black54,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(2),
                            ),
                            child: FormHelper.dropDownWidget(
                                context,
                                "Select Service Sub Category",
                                subcategoryId,
                                subcategory, (onChangedVal) {
                              subcategoryId = onChangedVal;
                              print('Selected Sub Category: $onChangedVal');
                            }, (onValidate) {
                              return null;
                            },
                                borderColor: Color(0xF5F5F5FF),
                                borderFocusColor: Color(0xF5F5F5FF),
                                borderRadius: 2,
                                optionValue: "ID",
                                optionLabel: "Name",
                                //borderWidth: 2,
                                paddingTop: 5,
                                paddingLeft: 10,
                                paddingRight: 0,
                                paddingBottom: 5,
                                hintFontSize: 18),
                          )
                        ],
                      ),

                      /*MyGestureButton(
                          onPressed: () {},
                          hintText: 'Select Service Category',
                          imageLocation:
                              'assets/images/profile/DropdownIcon.png'),

                      SizedBox(
                        height: 15,
                      ),

                      // List Services Provided
                      MyTextField(
                        controller: listServiceProviderSecondary,
                        keyboardtype: TextInputType.name,
                        hintText: 'List Services Provided',
                      ),*/
                      SizedBox(
                        height: 15,
                      ),

                      // Rater Per Hour
                      MyTextField(
                        controller: ratePerHourSecondary,
                        keyboardtype: TextInputType.number,
                        hintText: 'Rate/Hour',
                      ),

                      SizedBox(
                        height: 15,
                      ),
                      isSmallScreen
                          ? SizedBox()
                          : MyTextButton(
                              text: 'Next',
                              onPressed: () {
                                Navigator.pushNamed(context, 'profile_step3');
                              }),

                      SizedBox(
                        height: 15,
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
              child: MyTextButton(
                  text: 'Next',
                  onPressed: () {
                    Navigator.pushNamed(context, 'profile_step3');
                  }),
            )
          : SizedBox(),
    );
  }
}
