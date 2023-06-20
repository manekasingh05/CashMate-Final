import 'package:cashmate_vscode/components/NavBar.dart';
import 'package:cashmate_vscode/pages/loginPage.dart';
import 'package:cashmate_vscode/pages/registerPage.dart';
import 'package:cashmate_vscode/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class GameLevelScreen extends StatefulWidget {
  @override
  _GameLevelScreenState createState() => _GameLevelScreenState();
}

class _GameLevelScreenState extends State<GameLevelScreen> {
  var height, width;
  String currentDate = DateFormat.yMMMd('en_US').format(DateTime.now());
  final myusername = MyRegister.myUsername;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Image.asset(
        "images/cartoon-1.png",
        width: 90,
      ),
      appBar: _buildAppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/game-back.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/tokens.png'),
                              fit: BoxFit.contain),
                        ),
                      ),
                      Text(
                        "Tokens Earned: +10",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 40),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/life.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Life Left: +10",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 28, right: 28),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('images/giftbox.png'),
                              fit: BoxFit.contain),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Rewards Earned: +1",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 30),
                      Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('images/Energy.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Energy Left: +1000",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListWheelScrollView(
                itemExtent: 250,
                perspective: 0.007,
                diameterRatio: 2,
                clipBehavior: Clip.antiAlias,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, MyRoutes.gameRoute);
                    },
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                            image: AssetImage('images/Game-cards.png'),
                            fit: BoxFit.cover),
                      ),
                      child: Card(
                        color: const Color.fromARGB(0, 255, 255, 255),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                            SizedBox(height: 20),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 30),
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          '1',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800,
                                            height: 2.5,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          image: AssetImage('images/game-card-lock.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 30),
                            width: MediaQuery.of(context).size.width,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          image: AssetImage('images/game-card-lock.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 30),
                            width: MediaQuery.of(context).size.width,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          image: AssetImage('images/game-card-lock.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 30),
                            width: MediaQuery.of(context).size.width,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          image: AssetImage('images/game-card-lock.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 30),
                            width: MediaQuery.of(context).size.width,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          image: AssetImage('images/game-card-lock.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 30),
                            width: MediaQuery.of(context).size.width,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          image: AssetImage('images/game-card-lock.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 30),
                            width: MediaQuery.of(context).size.width,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      image: DecorationImage(
                          image: AssetImage('images/game-card-lock.png'),
                          fit: BoxFit.cover),
                    ),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          SizedBox(height: 20),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 50, vertical: 30),
                            width: MediaQuery.of(context).size.width,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: NavBar(),
    );
  }

  /// App Bar
  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[Color.fromARGB(255, 35, 24, 80), Colors.black]),
        ),
      ),
      centerTitle: false,
      title: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 9.0),
              child: Container(
                height: 39,
                width: width * 0.12,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Colors.white,
                ),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "images/profile.jpg",
                    height: height * 0.05,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Text(
                  "Welcome, ${myusername.text}",
                  style: GoogleFonts.lexend(
                    fontSize: width * 0.042,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 90.0),
                  child: Text(
                    "${currentDate}",
                    style: GoogleFonts.lexend(
                      fontSize: width * 0.032,
                      fontWeight: FontWeight.w200,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
