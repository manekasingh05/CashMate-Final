import 'package:cashmate_vscode/components/NavBar.dart';
import 'package:cashmate_vscode/models/transaction_model.dart';
import 'package:cashmate_vscode/pages/edit_MoneyLocked.dart';
import 'package:cashmate_vscode/pages/loginPage.dart';
import 'package:cashmate_vscode/pages/registerPage.dart';
import 'package:cashmate_vscode/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:sliding_switch/sliding_switch.dart';

class moneyLockPage2 extends StatefulWidget {
  @override
  _moneyLockPage2State createState() => _moneyLockPage2State();
}

class _moneyLockPage2State extends State<moneyLockPage2> {
  var height, width;
  String currentDate = DateFormat.yMMMd('en_US').format(DateTime.now());
  final myusername = MyRegister.myUsername;

  bool isDrawerOpen = false;
  bool _isIncome = false;
  bool value = false;
  bool theme = false;
  var textValue = EditMoneyScreen.MoneyToLock;
  var days = '1';
  var token = '0';
  var rate = '0';
  var percent = 0;
  var days_percent = 1;

  static const Color _primaryColor = Color(0xFF674AEF);
  static const Color _secondaryColor = Color.fromARGB(255, 211, 195, 47);

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Image.asset(
        "images/cartoon-1.png",
        width: 90,
      ),
      appBar: _buildAppBar(),
      body: Container(
        color: Colors.grey.shade300,
        child: Column(
          children: <Widget>[
            _appBarBottomSection(),
            _mainBody(),
          ],
        ),
      ),
      drawer: NavBar(),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************

  /// App Bar
  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xFF674AEF),
      centerTitle: false,
      title: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 9.0),
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
                  Icons.add,
                  size: 30,
                  color: const Color.fromARGB(255, 211, 195, 47),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, MyRoutes.editMoneyLockingRoute);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void toggleSwitch(bool isSwitched) {
    if (value == false) {
      setState(() {
        value = true;
        textValue = TextEditingController(text: '0');
        token = '0';
        days = '0';
        percent = 0;
        days_percent = 0;
        rate = '0';
      });
    } else {
      setState(() {
        value = false;
        textValue = textValue;
        token = token;
        days = days;
        percent = percent;
        days_percent = days_percent;
        rate = rate;
      });
    }
  }

  /// App Bar Bottom Section
  Card _appBarBottomSection() {
    return Card(
      color: Color.fromARGB(255, 35, 24, 80),
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 35, 24, 80),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '\Rs',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          height: 1,
                        ),
                      ),
                      Text(
                        textValue.text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                          height: 0.9,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Money Locked',
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1,
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                ],
              ),
            ),
          ),
          SlidingSwitch(
              value: value,
              contentSize: 17,
              width: 420.0,
              height: 55.0,
              onTap: () {},
              onDoubleTap: () {},
              onSwipe: () {},
              colorOn: _secondaryColor,
              colorOff: Color(0xff6682c0),
              background: Color.fromARGB(255, 35, 24, 80),
              animationDuration: const Duration(milliseconds: 400),
              textOff: "Money Locked",
              textOn: "Money Unlocked",
              onChanged: toggleSwitch,
              inactiveColor: Colors.white,
              buttonColor: value ? Colors.white : _secondaryColor),
        ],
      ),
    );
  }

  /// Main Body
  Expanded _mainBody() {
    return Expanded(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        physics: ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            _reportCell(
              isSavings: true,
              title: 'Daily Streak',
              Tokens: token,
              rate: rate,
              progress: percent,
            ),
            SizedBox(
              height: 12,
            ),
            _reportCell_Days(
              isSavings: false,
              title: 'Days Remaining',
              completed: days,
              rate: rate,
              progress: days_percent,
            ),
            SizedBox(
              height: 32,
            ),
          ],
        ),
      ),
    );
  }

  /// Report Cell
  Container _reportCell({
    required bool isSavings,
    required String title,
    required String Tokens,
    required String rate,
    required int progress,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      decoration: BoxDecoration(
        color: isSavings ? Colors.white : _secondaryColor,
        borderRadius: BorderRadius.circular(30),
        border: isSavings
            ? Border.all(color: _primaryColor.withOpacity(0.1), width: 2)
            : null,
        boxShadow: isSavings
            ? []
            : [
                BoxShadow(
                  color: _secondaryColor.withOpacity(0.6),
                  offset: Offset(0, 8),
                  blurRadius: 10,
                ),
              ],
      ),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: progress / 100,
                  strokeWidth: 6,
                  backgroundColor: isSavings
                      ? _primaryColor.withOpacity(0.2)
                      : _primaryColor.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(
                      isSavings ? _secondaryColor : Colors.white),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  progress.toString() + '%',
                  style: TextStyle(
                    color: isSavings ? _primaryColor : Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: isSavings ? _primaryColor : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: <Widget>[
                  _reportInnerCell(
                    isSavings: isSavings,
                    title: 'Tokens Earned',
                    value: Tokens,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  _reportInnerCell(
                    isSavings: isSavings,
                    title: 'Rate',
                    value: rate,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container _reportCell_Days({
    required bool isSavings,
    required String title,
    required String completed,
    required String rate,
    required int progress,
  }) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      decoration: BoxDecoration(
        color: isSavings ? Colors.white : _secondaryColor,
        borderRadius: BorderRadius.circular(30),
        border: isSavings
            ? Border.all(color: _primaryColor.withOpacity(0.1), width: 2)
            : null,
        boxShadow: isSavings
            ? []
            : [
                BoxShadow(
                  color: _secondaryColor.withOpacity(0.6),
                  offset: Offset(0, 8),
                  blurRadius: 10,
                ),
              ],
      ),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: progress / 100,
                  strokeWidth: 6,
                  backgroundColor: isSavings
                      ? _primaryColor.withOpacity(0.2)
                      : _primaryColor.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(
                      isSavings ? _secondaryColor : Colors.white),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  progress.toString() + '%',
                  style: TextStyle(
                    color: isSavings ? _primaryColor : Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: isSavings ? _primaryColor : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: <Widget>[
                  _reportInnerCell(
                    isSavings: isSavings,
                    title: 'Days Completed',
                    value: completed,
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  _reportInnerCell(
                    isSavings: isSavings,
                    title: 'Rate',
                    value: rate,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Report Inner Cell
  Column _reportInnerCell(
      {required bool isSavings, required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: isSavings ? _primaryColor.withOpacity(0.5) : Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text(
          value,
          style: TextStyle(
            color: isSavings ? Colors.black87 : Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
