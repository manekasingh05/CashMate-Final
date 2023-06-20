import 'package:cashmate_vscode/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:cashmate_vscode/pages/loginPage.dart';
import 'package:cashmate_vscode/pages/registerPage.dart';
import 'package:quickalert/quickalert.dart';

class NavBartheme3 extends StatelessWidget {

final myusername = MyRegister.myUsername;
final myemail = MyRegister.myEmail;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('${myusername.text}'),
            accountEmail: Text('${myemail.text}'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Image.asset(
                  'images/profile.jpg',
                  fit: BoxFit.cover,
                  width: 90,
                  height: 90,
                ),
              ),
            ),
            decoration: BoxDecoration(
              color: const Color(0xFF674AEF),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                      'images/theme3.jpg')),
            ),
          ),
          ListTile(
            iconColor: Color(0xFF674AEF),
            leading: Icon(Icons.person),
            title: Text('Account'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.userdetailsRoute);
            },
          ),
          ListTile(
            iconColor: Color(0xFF674AEF),
            leading: Icon(Icons.money),
            title: Text('Manage Bank Account'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.addBankRoute);
            },
          ),
          ListTile(
            iconColor: Color(0xFF674AEF),
            leading: Icon(Icons.people),
            title: Text('Invite Friends'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.inviteRoute);
            },
          ),
          ListTile(
            iconColor: Color(0xFF674AEF),
            leading: Icon(Icons.wallpaper),
            title: Text('Change Themes'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.selectTheme3Route);
            },
          ),
          Divider(),
          ListTile(
            iconColor: Color(0xFF674AEF),
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              Navigator.pushNamed(context, MyRoutes.settingsTheme3Route);
            },
          ),
          ListTile(
            iconColor: Color(0xFF674AEF),
            leading: Icon(Icons.description),
            title: Text('Help'),
            onTap: () => null,
          ),
          Divider(),
          ListTile(
            iconColor: Color(0xFF674AEF),
            leading: Icon(Icons.language),
            title: Text('Language'),
            onTap: () {
               Navigator.pushNamed(context, MyRoutes.settingsTheme3Route);
            },
          ),
          ListTile(
            iconColor: Color(0xFF674AEF),
            title: Text('Logout'),
            leading: Icon(Icons.exit_to_app),
            onTap: () {
                   showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        title: new Text("Do you want to logout?", style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0)),),
        actions: <Widget>[
          ElevatedButton(
            child: new Text("Yes", style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.loginRoute);
            },
          ),
           ElevatedButton(
            child: new Text("No", style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255)),),
            onPressed: () {
              Navigator.pushNamed(context, MyRoutes.homePageTheme3Route);
            },
          ),
        ],
      );
    },
  );
            },
          ),
        ],
      ),
    );
  }
}