import 'package:flutter/material.dart';
import 'package:cashmate_vscode/pages/loginPage.dart';
import 'package:cashmate_vscode/utils/routes.dart';

class bankDetails extends StatefulWidget {
  static TextEditingController titleController = TextEditingController();
  static TextEditingController aboutController = TextEditingController();

  @override
  _bankDetailsState createState() => _bankDetailsState();
}

class _bankDetailsState extends State<bankDetails> {
  final account = bankDetails.titleController;
  final address = bankDetails.aboutController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Image.asset(
        "images/cartoon-1.png",
        width: 90,
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text('Add Bank Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 20,
                  ),
                  titleTextField(),
                  SizedBox(
                    height: 20,
                  ),
                  aboutTextField(),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Material(
              elevation: 10,
              color: Color(0xFF674AEF),
              borderRadius: BorderRadius.circular(10),
              shadowColor: Color.fromARGB(67, 66, 66, 66),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.successRoute);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                  child: Text(
                    "Submit",
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
          ],
        ),
      ),
    );
  }

  Widget titleTextField() {
    return TextFormField(
      controller: account,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Bank Account Number",
      ),
    );
  }

  Widget aboutTextField() {
    return TextFormField(
      controller: address,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "Bank Branch Address",
      ),
    );
  }
}
