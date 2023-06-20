import 'package:cashmate_vscode/pages/addBank.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:quickalert/quickalert.dart';

class OTPScreen extends StatefulWidget {
  final String phone;
  OTPScreen(this.phone);
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  String? _verificationCode;
  final TextEditingController _pinPutController = TextEditingController();

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: TextStyle(
        fontSize: 20,
        color: Color.fromRGBO(30, 60, 87, 1),
        fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text('OTP Verification'),
      ),
      body: Column(children: [
        Container(
          margin: EdgeInsets.only(top: 40),
          child: Center(
            child: Column(
              children: [
                Text(
                  'OTP Sent Successfully to',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
                ),
                Text(
                  '+91-${widget.phone}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Pinput(
            length: 6,
            defaultPinTheme: defaultPinTheme,
            controller: _pinPutController,
            pinAnimationType: PinAnimationType.fade,
            onSubmitted: (pin) async {
              try {
                await FirebaseAuth.instance
                    .signInWithCredential(PhoneAuthProvider.credential(
                        verificationId: _verificationCode!, smsCode: pin))
                    .then((value) async {
                  if (value.user != null) {
                    QuickAlert.show(
                      context: context,
                      type: QuickAlertType.success,
                      text: 'Logged In Successfully!',
                      confirmBtnColor: Color(0xFF674AEF),
                      onConfirmBtnTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(builder: (context) => addBank()),
                            (route) => false);
                      },
                    );
                  }
                });
              } catch (e) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(e.toString())));
              }
            },
          ),
        ),
        Text(
          'Did not Receive OTP? Send Again',
          style: TextStyle(
              color: Color(0xFF674AEF),
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      ]),
    );
  }

  _verifyPhone() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: '+91${widget.phone}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance
              .signInWithCredential(credential)
              .then((value) async {
            if (value.user != null) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => addBank()),
                  (route) => false);
            }
          });
        },
        verificationFailed: (FirebaseAuthException e) {
          print(e.message);
        },
        codeSent: (String? verficationID, int? resendToken) {
          setState(() {
            _verificationCode = verficationID;
          });
        },
        codeAutoRetrievalTimeout: (String verificationID) {
          setState(() {
            _verificationCode = verificationID;
          });
        },
        timeout: Duration(seconds: 120));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _verifyPhone();
  }
}
