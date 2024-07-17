// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:service/export.dart';

class Reviews extends StatefulWidget {
  const Reviews({super.key});

  @override
  State<Reviews> createState() => _ReviewsState();
}

class _ReviewsState extends State<Reviews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: MyAppBarBackButton(),
        leadingWidth: 130,
        title: MyHeadingTextWidget(text: 'Reviews'),
        backgroundColor: Colors.transparent,
      ),
      /*PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Row(
            children: [
              MyAppBarBackButton(),
              SizedBox(
                width: MediaQuery.of(context).size.width < 400 ? 50 : 60,
              ),
              Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  MyHeadingTextWidget(text: 'Reviews'),
                ],
              ),
            ],
          )),*/
      backgroundColor: Color(0xFFD6F2F2),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width < 400 ? 15 : 30,
              ),
              // Client's Text

              Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    height: 800,
                    padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical:
                            MediaQuery.of(context).size.width < 400 ? 15 : 30),
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
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  MyTextWidget(
                                    text: '4.0',
                                    fontSize: 48,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                  Column(children: [
                                    Row(
                                      children: [
                                        Icon(Icons.star, color: Colors.yellow),
                                        Icon(Icons.star, color: Colors.yellow),
                                        Icon(Icons.star, color: Colors.yellow),
                                        Icon(Icons.star, color: Colors.yellow),
                                        Icon(
                                          Icons.star_border,
                                          color: Colors.yellow,
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: 20,
                                        ),
                                        MyTextWidget(
                                          text: 'Based on 78 reviews.',
                                          fontSize: 12,
                                          align: TextAlign.start,
                                        )
                                      ],
                                    ),
                                  ]),
                                ],
                              ),
                              SizedBox(height: 16),
                              ReviewBar(rating: 5, count: 28),
                              ReviewBar(rating: 4, count: 21),
                              ReviewBar(rating: 3, count: 16),
                              ReviewBar(rating: 2, count: 7),
                              ReviewBar(rating: 1, count: 2),
                              SizedBox(height: 16),
                              Divider(),
                              SizedBox(height: 16),
                            ],
                          ),
                        ),
                        Container(
                          height: 200,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 1, color: Colors.black45),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        CircleAvatar(
                                          radius: 25,
                                          backgroundColor: greyWithOpacity0_5,
                                          child: Image.asset(profileImage),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                MySecondHeading(
                                                  text: 'Reviewer Name',
                                                  fontWeight:
                                                      MediaQuery.of(context)
                                                                  .size
                                                                  .width <
                                                              400
                                                          ? fontWeight500
                                                          : fontWeight600,
                                                  fontsize:
                                                      MediaQuery.of(context)
                                                                  .size
                                                                  .width <
                                                              400
                                                          ? 16
                                                          : 18,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Image.asset(
                                                  greenVerifiedTick,
                                                  width: 12,
                                                  height: 12,
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                ),
                                                Icon(
                                                  Icons.star,
                                                  color: Colors.yellow,
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    MyDescTextWidget(
                                      text:
                                          'Is simply dummy text of the printing and typesetting  Is simply dummy text of the printing and typesetting',
                                      fontSize:
                                          MediaQuery.of(context).size.width <
                                                  400
                                              ? 12
                                              : 14,
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    MyTextWidget(text: '2 hours ago'),
                                    MyInkWellButton(
                                      text: 'Reply',
                                      onPressed: () {},
                                      fontsize: 16,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10,
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
}

class ReviewBar extends StatelessWidget {
  final int rating;
  final int count;

  ReviewBar({required this.rating, required this.count});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: (MediaQuery.of(context).size.width < 400 ? 36 : 33) /
          3, // adjust the aspect ratio to your liking
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10), // circular border
              child: Stack(
                children: [
                  LinearProgressIndicator(
                    value: 1, // full width
                    valueColor: AlwaysStoppedAnimation(Colors.grey[300]),
                    backgroundColor: Colors.grey,
                    minHeight: 10,
                  ),
                  LinearProgressIndicator(
                    value: count / 30, // progress value
                    backgroundColor: Colors.transparent,
                    color: Colors.teal,
                    minHeight: 10,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width < 400 ? 110 : 125,
            child: Row(
              children: [
                SizedBox(width: 20),
                MySecondHeading(
                  text: '$rating.0',
                  fontsize: MediaQuery.of(context).size.width < 400 ? 14 : 16,
                ),
                SizedBox(width: 10),
                MyTextWidget(
                  text: '$count reviews',
                  fontSize: MediaQuery.of(context).size.width < 400 ? 10 : 12,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
