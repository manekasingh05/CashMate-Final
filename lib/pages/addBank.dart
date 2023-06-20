import 'package:flutter/material.dart';
import 'package:cashmate_vscode/utils/routes.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cashmate_vscode/components/user.dart';

class addBank extends StatefulWidget {
  static var myBank = TextEditingController();
  static var myBankDetails = TextEditingController();

  const addBank({Key? key}) : super(key: key);

  @override
  State<addBank> createState() => _addBankState();
}

class _addBankState extends State<addBank> {
  bool _hasBeenPressed = false;
  bool _hasBeenPressedAmerican = false;
  bool _hasBeenPressedHDFC = false;
  bool _hasBeenPressedSBI = false;
  bool _hasBeenPressedAxis = false;
  bool _hasBeenPressedBaroda = false;
  bool _hasBeenPressedPunjab = false;
  bool _hasBeenPressedCanara = false;

  final bank = addBank.myBank;
  final bankDetails = addBank.myBankDetails;

  @override
  void dispose() {
    bank.dispose();
    bankDetails.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 235, 235),
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text('Add Bank Details'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              "Select Bank",
              textAlign: TextAlign.left,
              style: GoogleFonts.lexend(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: const Color.fromARGB(255, 119, 119, 119),
              ),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => {
                        setState(() {
                          _hasBeenPressedAmerican = !_hasBeenPressedAmerican;
                        })
                      },
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(30),
                        color: _hasBeenPressedAmerican
                            ? Color(0xFF674AEF)
                            : Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "American Express Bank",
                            style: TextStyle(
                              color: _hasBeenPressedAmerican
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => {
                        setState(() {
                          _hasBeenPressed = !_hasBeenPressed;
                        })
                      },
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(30),
                        color:
                            _hasBeenPressed ? Color(0xFF674AEF) : Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "ICICI Bank",
                            style: TextStyle(
                              color:
                                  _hasBeenPressed ? Colors.white : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => {
                        setState(() {
                          _hasBeenPressedHDFC = !_hasBeenPressedHDFC;
                        })
                      },
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(30),
                        color: _hasBeenPressedHDFC
                            ? Color(0xFF674AEF)
                            : Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "HDFC Bank",
                            style: TextStyle(
                              color: _hasBeenPressedHDFC
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => {
                        setState(() {
                          _hasBeenPressedSBI = !_hasBeenPressedSBI;
                        })
                      },
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(30),
                        color: _hasBeenPressedSBI
                            ? Color(0xFF674AEF)
                            : Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "SBI Bank",
                            style: TextStyle(
                              color: _hasBeenPressedSBI
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => {
                        setState(() {
                          _hasBeenPressedAxis = !_hasBeenPressedAxis;
                        })
                      },
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(30),
                        color: _hasBeenPressedAxis
                            ? Color(0xFF674AEF)
                            : Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Axis Bank",
                            style: TextStyle(
                              color: _hasBeenPressedAxis
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () => {
                        setState(() {
                          _hasBeenPressedPunjab = !_hasBeenPressedPunjab;
                        })
                      },
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(30),
                        color: _hasBeenPressedPunjab
                            ? Color(0xFF674AEF)
                            : Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Bank Of Baroda",
                            style: TextStyle(
                              color: _hasBeenPressedPunjab
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => {
                        setState(() {
                          _hasBeenPressedBaroda = !_hasBeenPressedBaroda;
                        })
                      },
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(30),
                        color: _hasBeenPressedBaroda
                            ? Color(0xFF674AEF)
                            : Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Punjab Bank",
                            style: TextStyle(
                              color: _hasBeenPressedBaroda
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => {
                        setState(() {
                          _hasBeenPressedCanara = !_hasBeenPressedCanara;
                        })
                      },
                      child: Material(
                        elevation: 10,
                        borderRadius: BorderRadius.circular(30),
                        color: _hasBeenPressedCanara
                            ? Color(0xFF674AEF)
                            : Colors.white,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Canara Bank",
                            style: TextStyle(
                              color: _hasBeenPressedCanara
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Card(
            elevation: 10,
            color: Color(0xFF674AEF),
            child: CircleAvatar(
              radius: 40,
              child: Icon(Icons.add, size: 40),
              backgroundColor: Color(0xFF674AEF),
            ),
          ),
          SizedBox(height: 90),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 600,
              child: Card(
                elevation: 10,
                color: Color(0xFF674AEF),
                child: Material(
                  color: Color(0xFF674AEF),
                  borderRadius: BorderRadius.circular(10),
                  shadowColor: Color.fromARGB(67, 66, 66, 66),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.bankDetailsRoute);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 180),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
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
    );
  }
}
