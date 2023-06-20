import 'package:cashmate_vscode/pages/homepage.dart';
import 'package:cashmate_vscode/pages/registerPage.dart';
import 'package:cashmate_vscode/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:cashmate_vscode/Widgets/Widgets.dart';
import 'package:cashmate_vscode/pages/loginPage.dart';

class SendMoneyPage extends StatefulWidget {
  const SendMoneyPage({Key? key}) : super(key: key);

  @override
  _SendMoneyPageState createState() => _SendMoneyPageState();
}

class _SendMoneyPageState extends State<SendMoneyPage> {
  final myusername = MyRegister.myUsername;
  List numberAsList = [];

  String money = '0';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      appBar: appBar(),
      body: body(),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            // Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back)),
      elevation: 0,
      title: Text("Add Money in Wallet"),
      backgroundColor: Colors.grey.shade900,
    );
  }

  Widget body() {
    return Column(
      children: [
        userTile(),
        moneyWidget(),
        keypadWidget(),
        button(),
      ],
    );
  }

  Widget userTile() {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: AssetImage("images/profile.jpg"),
      ),
      title: Text(
        "${myusername.text}",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget moneyWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 28),
      child: RichText(
//Rs
        text: TextSpan(
          text: '\Rs. ',
          style: TextStyle(
            fontSize: 60,
            color: Colors.grey.withOpacity(0.5),
            fontWeight: FontWeight.w300,
          ),
          children: [
//20
            TextSpan(
              text: money,
              style: TextStyle(
                fontSize: 60,
                color: Colors.white,
                fontWeight: FontWeight.w400,
              ),
            ),
//.0
            if (money != '')
              TextSpan(
                  text: '.0',
                  style: TextStyle(
                    fontSize: 60,
                    color: Colors.grey.withOpacity(0.5),
                    fontWeight: FontWeight.w300,
                  )),
          ],
        ),
      ),
    );
  }

  Widget keypadWidget() {
    return Flexible(
      child: GridView.builder(
        padding: EdgeInsets.symmetric(
          horizontal: 40,
        ),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 1.5,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: numbers.length,
        itemBuilder: (BuildContext context, int index) {
          int number = numbers[index];
          if (index == 9) return Container(height: 0, width: 0);
          return InkWell(
            borderRadius: BorderRadius.circular(360),
            onTap: () {
              if (index == 11) {
                try {
                  setState(() => money =
                      money.replaceRange(money.length - 1, money.length, ''));
                } catch (e) {
                  print("Error removing $e");
                }
              } else {
                setState(() => money = '$money$number');
              }
            },
            child: Container(
              child: index == 11
                  ? Icon(Icons.backspace, color: Colors.grey)
                  : Txt(
                      text: number,
                      color: Colors.white,
                    ),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.black38,
                shape: BoxShape.circle,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget button() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, MyRoutes.CurvedNavBarWhiteRoute);
        },
        child: Container(
          height: 55,
          width: double.maxFinite,
          alignment: Alignment.center,
          child: Text(
            "Add",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 18,
            ),
          ),
          decoration: BoxDecoration(
            color: Color(0xFF674AEF),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }

  static List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, -1, 0, -1];
}
