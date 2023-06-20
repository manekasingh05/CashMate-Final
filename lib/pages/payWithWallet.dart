import 'package:cashmate_vscode/pages/registerPage.dart';
import 'package:cashmate_vscode/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:flutter/services.dart';

class PayScreen extends StatefulWidget {
  const PayScreen({Key? key}) : super(key: key);

  @override
  State<PayScreen> createState() => _PayScreenState();
}

class _PayScreenState extends State<PayScreen> {
  double screenHeight = 0;
  double screenWidth = 0;
  TextEditingController _amountpay = TextEditingController();
  late Razorpay _razorpay;
  final myusername = MyRegister.myUsername;
  final contact = MyRegister.phoneNumber;
  final myEmail = MyRegister.myEmail;

  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text('Send Money'),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      child: CircleAvatar(
                        radius: 50.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('images/profile9.jpg'),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Send Money To',
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: const Color.fromARGB(255, 255, 255, 255)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      '@Samiksha',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF674AEF),
                      ),
                    ),
                    const SizedBox(height: 40),
                    Align(
                      alignment: Alignment.center,
                      child: TextField(
                        controller: _amountpay,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: const Color.fromARGB(255, 255, 255, 255)),
                        decoration: InputDecoration(
                            fillColor: Colors.transparent,
                            filled: true,
                            hintText: "Rs 0.0",
                            hintStyle: TextStyle(color: Colors.white),
                            border: InputBorder.none),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: SizedBox(
                        height: 150,
                        child: TextField(
                          textAlignVertical: TextAlignVertical.top,
                          expands: true,
                          maxLines: null,
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(3),
                              ),
                              hintText: 'Note :)'),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.height * 0.07),
                          child: Material(
                            elevation: 10,
                            color: Color(0xFF674AEF),
                            borderRadius: BorderRadius.circular(10),
                            shadowColor: Color.fromARGB(67, 66, 66, 66),
                            child: InkWell(
                              onTap: () {
                                Razorpay razorpay = Razorpay();
                                var options = {
                                  'key': 'rzp_test_AiVebg2yILxHuY',
                                  'amount': _amountpay.text,
                                  'name': myusername.text,
                                  'description': 'Pay to Cashmate User',
                                  'retry': {'enabled': true, 'max_count': 1},
                                  'send_sms_hash': true,
                                  'prefill': {
                                    'contact': contact.text,
                                    'email': myEmail.text
                                  },
                                  'external': {
                                    'wallets': ['paytm']
                                  }
                                };

                                razorpay.on(Razorpay.EVENT_PAYMENT_ERROR,
                                    handlePaymentErrorResponse);
                                razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS,
                                    handlePaymentSuccessResponse);
                                razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET,
                                    handleExternalWalletSelected);
                                razorpay.open(options);
                              },
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 140),
                                child: Text(
                                  "Pay",
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
                  ],
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  void handlePaymentErrorResponse(PaymentFailureResponse response) {
    /*
    * PaymentFailureResponse contains three values:
    * 1. Error Code
    * 2. Error Description
    * 3. Metadata
    * */
    showAlertDialog(context, "Payment Failed",
        "Code: ${response.code}\nDescription: ${response.message}\nMetadata:${response.error.toString()}");
  }

  void handlePaymentSuccessResponse(PaymentSuccessResponse response) {
    /*
    * Payment Success Response contains three values:
    * 1. Order ID
    * 2. Payment ID
    * 3. Signature
    * */
    showAlertDialog(
        context, "Payment Successful", "Payment ID: ${response.paymentId}");
  }

  void handleExternalWalletSelected(ExternalWalletResponse response) {
    showAlertDialog(
        context, "External Wallet Selected", "${response.walletName}");
  }

  void showAlertDialog(BuildContext context, String title, String message) {
    // set up the buttons
    Widget continueButton = ElevatedButton(
      child: const Text("Continue"),
      onPressed: () {
        Navigator.pushNamed(context, MyRoutes.PayWithWalletRoute);
      },
    );
    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        continueButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
