import 'package:flutter/material.dart';
import 'package:cashmate_vscode/utils/routes.dart';

class MyActivityScreen extends StatelessWidget {
  const MyActivityScreen({Key? key}) : super(key: key);

  final username = "Maneka";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Image.asset("images/cartoon-3.png", width: 200),
      appBar: appBar(),
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 150,
                  height: 60,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Card(
                      color: Color(0xFF674AEF),
                      elevation: 10,
                      child: Material(
                        color: Color(0xFF674AEF),
                        borderRadius: BorderRadius.circular(10),
                        shadowColor: Color.fromARGB(67, 66, 66, 66),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, MyRoutes.selectContacts);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 40),
                            child: Text(
                              "Reply",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 150,
                  height: 60,
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Card(
                      elevation: 10,
                      color: Color(0xFF674AEF),
                      child: Material(
                        color: Color(0xFF674AEF),
                        borderRadius: BorderRadius.circular(10),
                        shadowColor: Color.fromARGB(67, 66, 66, 66),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                                context, MyRoutes.selectContacts);
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 40),
                            child: Text(
                              "Chat",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: listView(),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: Text("Recent Activity"),
      backgroundColor: Color(0xFF674AEF),
    );
  }

  Widget listView() {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "images/LOGO-CASHM.png",
                ),
                fit: BoxFit.contain,
                opacity: 0.4,
                scale: 2,
              ),
            ),
            child: Column(
              children: [
                listViewItem(index),
                Divider(),
                listViewItem2(index),
                Divider(),
                listViewItem3(index),
                Divider(),
                listViewItem4(index),
                Divider(),
                listViewItem5(index),
                Divider(),
                listViewItem6(index),
                Divider(),
                listViewItem7(index),
                Divider(),
                listViewItem8(index),
                Divider(),
                listViewItem9(index),
                Divider(),
                listViewItem10(index),
              ],
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(height: 0);
        },
        itemCount: 1);
  }

  Widget listViewItem(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message(index),
                  timeAndDate(index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listViewItem2(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon2(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message2(index),
                  timeAndDate2(index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listViewItem3(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon3(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message3(index),
                  timeAndDate3(index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listViewItem4(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon4(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message4(index),
                  timeAndDate4(index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listViewItem5(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon5(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message5(index),
                  timeAndDate5(index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listViewItem6(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon6(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message6(index),
                  timeAndDate6(index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listViewItem7(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon7(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message7(index),
                  timeAndDate7(index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listViewItem8(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon8(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message8(index),
                  timeAndDate8(index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listViewItem9(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon9(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message9(index),
                  timeAndDate9(index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget listViewItem10(int index) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 13, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          prefixIcon10(),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  message10(index),
                  timeAndDate10(index),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget prefixIcon() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Image.asset("images/meme_12.jpg", height: 100),
    );
  }

  Widget prefixIcon2() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Image.asset("images/meme_1.png", height: 150),
    );
  }

  Widget prefixIcon3() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Image.asset("images/meme_2.jpg", height: 150),
    );
  }

  Widget prefixIcon4() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Image.asset("images/meme_4.jpg", height: 100),
    );
  }

  Widget prefixIcon5() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Image.asset("images/meme_5.jpg", height: 160),
    );
  }

  Widget prefixIcon6() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Image.asset("images/meme_6.jpeg", height: 100),
    );
  }

  Widget prefixIcon7() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Image.asset("images/meme_7.webp", height: 100),
    );
  }

  Widget prefixIcon8() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Image.asset("images/meme_8.jpeg", height: 80),
    );
  }

  Widget prefixIcon9() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Image.asset("images/meme_9.jpeg", height: 160),
    );
  }

  Widget prefixIcon10() {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: Colors.white,
      ),
      child: Image.asset("images/meme_10.jpeg", height: 100),
    );
  }

  Widget message(int index) {
    double textSize = 14;
    return Container(
      child: RichText(
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "${username}\n",
          style: TextStyle(
            fontSize: textSize,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: '"Bhai paise wapis dede"',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget timeAndDate(int index) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '3-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            '2-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget message2(int index) {
    double textSize = 14;
    return Container(
      child: RichText(
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "Samiksha\n",
          style: TextStyle(
            fontSize: textSize,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: '"Paise kb lauta rha bhai?"',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget timeAndDate2(int index) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '4-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            '2-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget message3(int index) {
    double textSize = 14;
    return Container(
      child: RichText(
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "Vanshita\n",
          style: TextStyle(
            fontSize: textSize,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: '"Rs.100 abhi bhi bache hai."',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget timeAndDate3(int index) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '5-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            '2-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget message4(int index) {
    double textSize = 14;
    return Container(
      child: RichText(
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "John Smith\n",
          style: TextStyle(
            fontSize: textSize,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: '"Hey, I want my money back!!"',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget timeAndDate4(int index) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '3-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            '4-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget message5(int index) {
    double textSize = 14;
    return Container(
      child: RichText(
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "Riya Gupta\n",
          style: TextStyle(
            fontSize: textSize,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: '"Please Bhai"',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget timeAndDate5(int index) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '3-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            '5-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget message6(int index) {
    double textSize = 14;
    return Container(
      child: RichText(
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "Samridhi\n",
          style: TextStyle(
            fontSize: textSize,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: '"Dude I think you have not payed the split.."',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget timeAndDate6(int index) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '6-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            '6-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget message7(int index) {
    double textSize = 14;
    return Container(
      child: RichText(
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "Arima Chaudhary\n",
          style: TextStyle(
            fontSize: textSize,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: '"Mere pe tere paise nhi hai bhai"',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget timeAndDate7(int index) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '6-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            '7-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget message8(int index) {
    double textSize = 14;
    return Container(
      child: RichText(
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "Rahul\n",
          style: TextStyle(
            fontSize: textSize,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: '"Merepe tere paise nhi hai bhai"',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget timeAndDate8(int index) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '8-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            '8-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget message9(int index) {
    double textSize = 14;
    return Container(
      child: RichText(
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "Raj Singh\n",
          style: TextStyle(
            fontSize: textSize,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: '"Haan Bhai de dunga.."',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget timeAndDate9(int index) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '9-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            '11-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget message10(int index) {
    double textSize = 14;
    return Container(
      child: RichText(
        maxLines: 5,
        overflow: TextOverflow.ellipsis,
        text: TextSpan(
          text: "Mohan Gupta\n",
          style: TextStyle(
            fontSize: textSize,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
          children: [
            TextSpan(
              text: '"Theek hai bhai kal tak de diyo"',
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget timeAndDate10(int index) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '23-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
          Text(
            '2-06-2023',
            style: TextStyle(
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
