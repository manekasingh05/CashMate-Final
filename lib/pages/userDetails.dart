import 'package:cashmate_vscode/pages/registerPage.dart';
import 'package:flutter/material.dart';
import 'package:cashmate_vscode/pages/loginPage.dart';
import 'package:cashmate_vscode/utils/routes.dart';
import 'package:cashmate_vscode/pages/bankDetails.dart';

class CreateProfile extends StatefulWidget {
  @override
  _CreateProfileState createState() => _CreateProfileState();
}

class _CreateProfileState extends State<CreateProfile> {
  final myusername = MyRegister.myUsername;
  final mypassword = MyRegister.password;
  final BankAcc = bankDetails.titleController;
  final Bankaddress = bankDetails.aboutController;
  final myEmail = MyRegister.myEmail;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _professionController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _aboutController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF674AEF),
        title: Text('Account Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: <Widget>[
                  imageProfile(),
                  SizedBox(
                    height: 20,
                  ),
                  nameTextField(),
                  SizedBox(
                    height: 20,
                  ),
                  professionTextField(),
                  SizedBox(
                    height: 20,
                  ),
                  dobField(),
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
              color: Color(0xFF674AEF),
              borderRadius: BorderRadius.circular(10),
              shadowColor: Color.fromARGB(67, 66, 66, 66),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, MyRoutes.homeRoute);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 80),
                  child: Text(
                    "Change",
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

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          CircleAvatar(
            radius: 80.0,
            backgroundImage: AssetImage("images/profile.jpg"),
          ),
          Positioned(
            bottom: 20.0,
            right: 20.0,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomSheet()),
                );
              },
              child: Icon(
                Icons.camera_alt,
                color: Colors.teal,
                size: 28.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100.0,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          Text(
            "Choose Profile Photo",
            style: TextStyle(
              fontSize: 20.0,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(children: <Widget>[
            TextButton.icon(
              icon: Icon(Icons.camera),
              onPressed: () {},
              label: Text("Camera"),
            ),
            TextButton.icon(
              icon: Icon(Icons.image),
              onPressed: () {},
              label: Text("Gallery"),
            ),
          ])
        ],
      ),
    );
  }

  Widget nameTextField() {
    return TextFormField(
      controller: _nameController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "${myusername.text}",
        helperText: "Name can't be empty",
        hintText: "username",
      ),
    );
  }

  Widget professionTextField() {
    return TextFormField(
      controller: _professionController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "12345",
        helperText: "Password can't be empty",
      ),
    );
  }

  Widget dobField() {
    return TextFormField(
      controller: _dobController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "${myEmail.text}",
      ),
    );
  }

  Widget titleTextField() {
    return TextFormField(
      controller: _titleController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "${BankAcc.text}",
      ),
    );
  }

  Widget aboutTextField() {
    return TextFormField(
      controller: _aboutController,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: "${Bankaddress.text}",
      ),
    );
  }
}
