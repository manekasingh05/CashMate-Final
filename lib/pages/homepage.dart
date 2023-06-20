import 'package:cashmate_vscode/pages/askMoney.dart';
import 'package:cashmate_vscode/pages/custom_paint.dart';
import 'package:cashmate_vscode/pages/registerPage.dart';
import 'package:cashmate_vscode/pages/transactionHistory.dart';
import 'package:cashmate_vscode/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/cupertino.dart';
import 'package:cashmate_vscode/components/configuration.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';
import 'package:cashmate_vscode/pages/loginPage.dart';
import 'package:cashmate_vscode/components/NavBar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cashmate_vscode/pages/addMoneyinWallet.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<HomeScreen> {
  var getResult = 'QR Code Result';
  var height, width;
  String currentDate = DateFormat.yMMMd('en_US').format(DateTime.now());
  final myusername = MyRegister.myUsername;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 60),
          child: AppBar(
            elevation: 0,
            backgroundColor: Color.fromARGB(255, 0, 0, 0).withOpacity(0.2),
            centerTitle: false,
            title: SingleChildScrollView(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 9.0),
                    child: Container(
                      height: 39,
                      width: width * 0.12,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Colors.white,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          "images/profile.jpg",
                          height: height * 0.05,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Welcome, ${myusername.text}",
                        style: GoogleFonts.lexend(
                          fontSize: width * 0.042,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 90.0),
                        child: Text(
                          "${currentDate}",
                          style: GoogleFonts.lexend(
                            fontSize: width * 0.032,
                            fontWeight: FontWeight.w200,
                            color: Colors.yellow,
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
                        color: const Color.fromARGB(255, 211, 195, 47),
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
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.04,
                  width: width,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                  ),
                ),
                Container(
                  width: width,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          height: height * 0.28,
                          width: width * 0.56,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF674AEF).withOpacity(0.4),
                              width: width * 0.01,
                            ),
                          ),
                          child: Stack(
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: SimpleCircularProgressBar(
                                  backStrokeWidth: width * 0.03,
                                  size: width * 0.38,
                                  progressColors: [Colors.yellow],
                                  backColor: Colors.grey.shade400,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Container(
                                  height: height * 0.15,
                                  width: width * 0.3,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            Color(0xFF674AEF).withOpacity(0.8),
                                        offset: Offset(0, 0),
                                        blurRadius: 20,
                                        spreadRadius: 3,
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                    color: Color(0xFF674AEF),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Balance",
                                        style: GoogleFonts.lexend(
                                          fontSize: width * 0.03,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        'Rs. 20,000',
                                        style: GoogleFonts.lexend(
                                          fontSize: width * 0.04,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.04,
                ),
                Container(
                  height: height * 0.6,
                  width: width,
                  decoration: BoxDecoration(
                      color: Color(0xFF674AEF),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50),
                      )),
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: width * 0.1),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Overview",
                              style: GoogleFonts.lexend(
                                fontSize: width * 0.05,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: height * 0.4,
                        width: width * 0.8,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, MyRoutes.transactionRoute);
                                  },
                                  child: Column(
                                    children: [
                                      Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Container(
                                          height: height * 0.09,
                                          width: width * 0.15,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                                "images/wallet.png",
                                                height: height * 0.05),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Transaction \n History",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lexend(
                                            fontSize: width * 0.032,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(context,
                                        MyRoutes.GameCurvedNavBarWhiteRoute);
                                  },
                                  child: Column(
                                    children: [
                                      Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Container(
                                          height: height * 0.09,
                                          width: width * 0.15,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                                "images/token.png",
                                                height: height * 0.09),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Tokens \n Earned",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lexend(
                                            fontSize: width * 0.032,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, MyRoutes.payListUsersRoute);
                                  },
                                  child: Column(
                                    children: [
                                      Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Container(
                                          height: height * 0.09,
                                          width: width * 0.15,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                                "images/phone.png",
                                                height: height * 0.05),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Pay with \n Wallet",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lexend(
                                            fontSize: width * 0.032,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    scanQRCode();
                                  },
                                  child: Column(
                                    children: [
                                      Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Container(
                                          height: height * 0.09,
                                          width: width * 0.15,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                                "images/qrcode.png",
                                                height: height * 0.05),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "QR Code\n Scan",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lexend(
                                            fontSize: width * 0.032,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, MyRoutes.selectContacts);
                                  },
                                  child: Column(
                                    children: [
                                      Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Container(
                                          height: height * 0.09,
                                          width: width * 0.15,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                                "images/chat.png",
                                                height: height * 0.05),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Chats",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lexend(
                                            fontSize: width * 0.032,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, MyRoutes.addCardRoute);
                                  },
                                  child: Column(
                                    children: [
                                      Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Container(
                                          height: height * 0.09,
                                          width: width * 0.15,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                                "images/credit-card.png",
                                                height: height * 0.05),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Credit/Debit \n Cards",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lexend(
                                            fontSize: width * 0.032,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, MyRoutes.notificationRoute);
                                  },
                                  child: Column(
                                    children: [
                                      Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Container(
                                          height: height * 0.09,
                                          width: width * 0.15,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                                "images/send.png",
                                                height: height * 0.05),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Send \n Notifications",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lexend(
                                            fontSize: width * 0.032,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, MyRoutes.budgetPlannerRoute);
                                  },
                                  child: Column(
                                    children: [
                                      Card(
                                        elevation: 10,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(40),
                                        ),
                                        child: Container(
                                          height: height * 0.09,
                                          width: width * 0.15,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(40),
                                            color: Colors.white,
                                          ),
                                          child: Center(
                                            child: Image.asset(
                                                "images/calendar.png",
                                                height: height * 0.05),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Budget\nPlanner",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.lexend(
                                            fontSize: width * 0.032,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ]),
        ),
        drawer: NavBar(),
      ),
    );
  }

  void scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        Navigator.pushNamed(context, MyRoutes.PayWithWalletRoute);
      });
      print("QRCode_Result:--");
      print(qrCode);
    } on PlatformException {
      getResult = 'Failed to scan QR Code.';
    }
  }
}
