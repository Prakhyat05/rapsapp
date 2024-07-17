// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:service/export.dart';

class AppLanguage extends StatefulWidget {
  const AppLanguage({super.key});

  @override
  State<AppLanguage> createState() => _AppLanguageState();
}

class _AppLanguageState extends State<AppLanguage> {
  bool _englishSelected = true;
  bool _hindiSelected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: allBackgroundColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height < 750 ? 30 : 40,
            ),
            Row(
              children: [
                MyAppBarBackButton(),
                SizedBox(
                  width: MediaQuery.of(context).size.width < 400
                      ? 30
                      : MediaQuery.of(context).size.width < 420
                          ? 40
                          : 60,
                ),
                MySecondHeading(
                  text: 'App Language',
                  fontWeight: FontWeight.w600,
                  fontsize: 25,
                ),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final content = Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.width > 400 &&
                              MediaQuery.of(context).size.height > 750
                          ? MediaQuery.of(context).size.height - 145
                          : null,
                      margin: EdgeInsets.only(top: 50),
                      padding:
                          EdgeInsets.symmetric(horizontal: 25, vertical: 30),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: Offset(0, 3),
                          )
                        ],
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          MyTextWidget(
                            text: 'Choose your Language',
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: fontWeight500,
                            align: TextAlign.start,
                          ),
                          Divider(
                            color: Colors.grey.shade400,
                            thickness: 2,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyTextWidget(
                                      text: 'English / अंग्रेजी ',
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? 20
                                              : 25,
                                      align: TextAlign.start,
                                    ),
                                    CustomRadioButton(
                                      isSelected: _englishSelected,
                                      onTap: () {
                                        setState(() {
                                          _englishSelected = true;
                                          _hindiSelected = false;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50, vertical: 5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyTextWidget(
                                      text: 'Hindi / हिन्दी ',
                                      color: Colors.black,
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? 20
                                              : 25,
                                      align: TextAlign.start,
                                    ),
                                    CustomRadioButton(
                                      isSelected: _hindiSelected,
                                      onTap: () {
                                        setState(() {
                                          _englishSelected = false;
                                          _hindiSelected = true;
                                        });
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );

            return constraints.maxHeight > MediaQuery.of(context).size.height
                ? content
                : SingleChildScrollView(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight,
                      ),
                      child: content,
                    ),
                  );
          },
        ),
      ),
    );
  }
}

class CustomRadioButton extends StatelessWidget {
  final bool isSelected;
  final VoidCallback onTap;

  const CustomRadioButton({required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 26,
        height: 26,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: isSelected
              ? null
              : Border.all(color: Color.fromARGB(255, 53, 194, 193), width: 2),
        ),
        child: isSelected
            ? Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 53, 194, 193),
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Color.fromARGB(255, 53, 194, 193), width: 2),
                ),
                child: Icon(Icons.check, size: 16, color: Colors.white))
            : null,
      ),
    );
  }
}
