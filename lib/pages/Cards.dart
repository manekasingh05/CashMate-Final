import 'package:flutter/material.dart';
import 'package:cashmate_vscode/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:cashmate_vscode/components/NavBar.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';
import 'package:cashmate_vscode/pages/addCard.dart';

class MyCardScreen extends StatefulWidget {
  const MyCardScreen({Key? key, String? name}) : super(key: key);

  @override
  State<MyCardScreen> createState() => _MyCardScreenState();
}

class _MyCardScreenState extends State<MyCardScreen> {
  final name = "Maneka";

  var height, width;
  String currentDate = DateFormat.yMMMd('en_US').format(DateTime.now());

  bool isDrawerOpen = false;
  int _focusedIndex = 0;

  List<int> data = [2, 1];

  List<dynamic> cardNumber = ['6104 3389 3256 8955', '4456 7789 9900 1289'];

  List<dynamic> cvv = ['456', '441'];

  List<dynamic> paid = ['amazon', 'Flipkart'];

  List<dynamic> date = ['02/23', '08/26'];

  List<double> money = [5000.00, 1000.00];

  List<Color> colors = [
    Color(0xFF674AEF),
    const Color.fromARGB(255, 221, 54, 110)
  ];

  void _onItemFocus(int index) {
    setState(() {
      _focusedIndex = index;
    });
  }

// ignore: unused_element
  Widget _buildItemList(BuildContext context, int index) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;

    if (index == data.length) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }

    return Align(
      alignment: Alignment.center,
      child: Container(
        width: myWidth * 0.6,
        height: myHeight * 0.6,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                height: myHeight * 0.2,
                width: myWidth * 0.9,
                decoration: BoxDecoration(
                    color: colors[index],
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: myWidth * 0.05,
                            vertical: myHeight * 0.015),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'images/1.png',
                              height: myHeight * 0.04,
                              color: Colors.white,
                            ),
                            Container(
                              // height: myHeight * 0.03,
                              // width: myWidth * 0.1,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white.withOpacity(0.5)),
                              child: Center(
                                  child: Text(
                                '${date[index]}',
                                style: TextStyle(color: Colors.white),
                              )),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: myHeight * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${cardNumber[index]}',
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  wordSpacing: 3),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: myWidth * 0.05,
                            vertical: myHeight * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Maneka Singh',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                            Text(
                              'CVV: ${cvv[index]}',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Container(
        child: Scaffold(
          backgroundColor: Colors.grey.shade100,
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 60),
            child: AppBar(
              elevation: 0,
              backgroundColor: Color(0xFF674AEF).withOpacity(0.5),
              centerTitle: false,
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 9.0),
                    child: Container(
                      height: 39,
                      width: myWidth * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Colors.white,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "images/profile.jpg",
                          height: myHeight * 0.05,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text("Welcome, ${name}"),
                      Padding(
                        padding: const EdgeInsets.only(right: 90.0),
                        child: Text(
                          "${currentDate}",
                          style: GoogleFonts.lexend(
                            fontSize: myWidth * 0.032,
                            fontWeight: FontWeight.w400,
                            color: const Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: IconButton(
                      icon: Icon(
                        Icons.notifications_active,
                        size: 30,
                        color: Color.fromARGB(255, 255, 230, 0),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.activityRoute);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Container(
            height: myHeight,
            width: myWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: myHeight * 0.04, left: myWidth * 0.08),
                  child: Row(
                    children: [
                      Text(
                        'My Cards',
                        style: GoogleFonts.lexend(
                            fontSize: 28, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: myHeight * 0.04,
                ),
                Expanded(
                  child: ScrollSnapList(
                    itemBuilder: _buildItemList,
                    itemSize: 250,
                    dynamicItemSize: true,
                    onReachEnd: () {
                      print('Done');
                    },
                    itemCount: data.length,
                    onItemFocus: _onItemFocus,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: myWidth * 0.08, vertical: myHeight * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      myItemContiner('Card balance', '100.000'),
                      myItemContiner('Last Used', '90.000'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: myHeight * 0.02, left: myWidth * 0.08),
                  child: Row(
                    children: [
                      Text(
                        'Transation History',
                        style: TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: myHeight * 0.02,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: myHeight * 0.01),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: myWidth * 0.06,
                                    vertical: myHeight * 0.02),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white),
                                child: Image.asset(
                                  'images/credit-card.png',
                                  height: myHeight * 0.05,
                                  // color: Color(0xff7847FC),
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Paid to ${paid[index]}',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: myHeight * 0.01),
                                Text(
                                  'Yesterday',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                            Text(
                              '\Rs.${money[index]}',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0xff7847FC),
                              ),
                            ),
                            Divider(),
                          ],
                        ),
                      );
                    },
                  ),
                )
              ],
            ),
          ),
          drawer: NavBar(),
        ),
      ),
    );
  }

  Widget myText(String txt) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: myWidth * 0.03),
      child: Text(
        txt,
        style: TextStyle(
            fontSize: 27, color: Colors.white, fontWeight: FontWeight.normal),
      ),
    );
  }

  Widget myItemContiner(String title, String price) {
    double myHeight = MediaQuery.of(context).size.height;
    double myWidth = MediaQuery.of(context).size.width;
    return Card(
      elevation: 10,
      child: Material(
        borderRadius: BorderRadius.circular(50),
        child: Container(
          padding: EdgeInsets.only(
              top: myHeight * 0.02,
              left: myWidth * 0.05,
              right: myWidth * 0.1,
              bottom: myHeight * 0.02),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Color(0xff7847FC),
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: myHeight * 0.01,
              ),
              Row(
                children: [
                  Text(
                    '\Rs. ',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    price,
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
