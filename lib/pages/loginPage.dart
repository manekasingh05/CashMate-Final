import 'package:cashmate_vscode/pages/otp.dart';
import 'package:cashmate_vscode/pages/registerPage.dart';
import 'package:cashmate_vscode/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:cashmate_vscode/pages/paint_tool.dart';
import 'package:google_fonts/google_fonts.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final phoneNum = MyRegister.phoneNumber;

  var height, width;

  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFe1e5f2),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: EdgeInsets.only(left: 35, top: 30),
              child: Column(children: [
                CustomPaint(painter: Painter()),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Text(
                    'Welcome\nBack Mate',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 33,
                        fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    'images/flyingman.png',
                    fit: BoxFit.contain,
                    width: 200,
                    height: 300,
                  ),
                ]),
              ]),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            style: TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "UserName",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            style: TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Password",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Material(
                                  elevation: 10,
                                  color: Color(0xFF674AEF),
                                  borderRadius: BorderRadius.circular(10),
                                  shadowColor: Color.fromARGB(67, 66, 66, 66),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, MyRoutes.addBankRoute);
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 130),
                                      child: Text(
                                        "Login",
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
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    left: MediaQuery.of(context).size.height *
                                        0.01),
                                child: Material(
                                  elevation: 10,
                                  color: Color(0xFF674AEF),
                                  borderRadius: BorderRadius.circular(10),
                                  shadowColor: Color.fromARGB(67, 66, 66, 66),
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  OTPScreen(phoneNum.text)));
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 80),
                                      child: Text(
                                        "Login through OTP",
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
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, MyRoutes.registerRoute);
                                },
                                child: Text(
                                  "Sign Up Here",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                      fontSize: 18),
                                ),
                                style: ButtonStyle(),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, MyRoutes.forgotpasswordRoute);
                                  },
                                  child: Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
