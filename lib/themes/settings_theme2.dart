import 'package:cashmate_vscode/utils/routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

enum SingingCharacter { English, Hindi }

class SettingsPageUItheme2 extends StatefulWidget {
  const SettingsPageUItheme2({super.key});

  @override
  _SettingsPageUItheme2State createState() => _SettingsPageUItheme2State();
}

class _SettingsPageUItheme2State extends State<SettingsPageUItheme2> {
  SingingCharacter? _character = SingingCharacter.English;

  bool valNotify1 = true;
  bool valNotify2 = false;
  bool valNotify3 = false;
  onChangeFunctional1(bool newValue1) {
    setState(() {
      valNotify2 = newValue1;
    });
  }

  onChangeFunctional2(bool newValue2) {
    setState(() {
      valNotify1 = newValue2;
    });
  }

  onChangeFunctional3(bool newValue3) {
    setState(() {
      valNotify3 = newValue3;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Image.asset(
        "images/cartoon-2.png",
        width: 190,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endContained,
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text("Settings", style: TextStyle(fontSize: 22)),
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
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SizedBox(height: 40),
            Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.deepPurple,
                ),
                SizedBox(width: 10),
                Text("Account",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
              ],
            ),
            Divider(height: 20, thickness: 1),
            SizedBox(height: 10),
            InkWell(
              onTap: () {
                Navigator.pushNamed(
                    context, MyRoutes.ChangepasswordTheme2Route);
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: Text("Change Password",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[600])),
              ),
            ),
            buildAccountOption(context, "Language"),
            buildPrivacy(context, "Privacy and Securtiy"),
            SizedBox(height: 40),
            Row(
              children: [
                Icon(Icons.volume_up_outlined, color: Colors.deepPurple),
                SizedBox(width: 10),
                Text("Notifications",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
              ],
            ),
            Divider(height: 20, thickness: 1),
            SizedBox(height: 10),
            buildNotificationOption(
                "Theme Activated", valNotify1, onChangeFunctional1),
            buildNotificationOption(
                "Turn On Notifications", valNotify3, onChangeFunctional3),
            SizedBox(height: 50),
            Center(
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFF674AEF),
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        title: new Text(
                          "Do you want to logout?",
                          style: TextStyle(
                              color: const Color.fromARGB(255, 0, 0, 0)),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF674AEF),
                            ),
                            child: new Text(
                              "Yes",
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, MyRoutes.loginRoute);
                            },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF674AEF),
                            ),
                            child: new Text(
                              "No",
                              style: TextStyle(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255)),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, MyRoutes.settingsTheme2Route);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Log Out",
                    style: TextStyle(
                        fontSize: 16,
                        color: const Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold)),
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding buildNotificationOption(
      String title, bool value, Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600])),
          Transform.scale(
            scale: 0.7,
            child: CupertinoSwitch(
              activeColor: Color(0xFF674AEF),
              trackColor: Colors.grey,
              value: value,
              onChanged: (bool newValue) {
                onChangeMethod(newValue);
              },
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector buildPrivacy(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  title,
                  style: TextStyle(
                    color: Colors.deepPurple,
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                          "This Privacy Policy describes our policies regarding the collection, usage, protection and processing of personally identifiable information received from Users and its related applications and services, We encourage you to read our Privacy Policy carefully before using our Wallet. We do not collect any information that may identify You without your permission. However by using the Wallet, you give us a consent and permission to collect, store and use the information about you, including your personal information, as prescribed by this Policy. You acknowledge and agree that such personal information may be transferred to and stored on the servers of the Wallet and the servers of authorized third parties. We may collect the information provided or generated whenever the User takes any action in our Wallet or omits to do it or otherwise uses our services."),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close"))
                ],
              );
            });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600])),
            Icon(Icons.arrow_forward_ios, color: Colors.grey)
          ],
        ),
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
      onTap: () {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  title,
                  style: TextStyle(
                    color: Colors.deepPurple,
                  ),
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: const Text('English'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.English,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Hindi'),
                      leading: Radio<SingingCharacter>(
                        value: SingingCharacter.Hindi,
                        groupValue: _character,
                        onChanged: (SingingCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Close"))
                ],
              );
            });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600])),
            Icon(Icons.arrow_forward_ios, color: Colors.grey)
          ],
        ),
      ),
    );
  }
}
