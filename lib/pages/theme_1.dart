import 'package:cashmate_vscode/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quickalert/quickalert.dart';
import 'package:cashmate_vscode/pages/gridDashboard.dart';

class theme_1 extends StatefulWidget {
  const theme_1({super.key});

  @override
  _theme_1State createState() => _theme_1State();
}

class _theme_1State extends State<theme_1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text("Change Themes", style: TextStyle(fontSize: 22)),
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, MyRoutes.homeRoute);
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            GridDashboard()
          ],
        ),
      ),
    );
  }
}
