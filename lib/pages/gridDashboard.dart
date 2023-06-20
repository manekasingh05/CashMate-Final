import 'package:cashmate_vscode/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GridDashboard extends StatelessWidget {
  Items item1 = new Items(
    title: "Change",
    subtitle: "",
    event: "",
    img: "images/theme2.jpg",
  );

  Items item2 = new Items(
    title: "Change",
    subtitle: "",
    event: "",
    img: "images/theme3.jpg",
  );
  Items item3 = new Items(
    title: "Change",
    subtitle: "",
    event: "",
    img: "images/background.jpg",
  );

  Items item4 = new Items(
    title: "Chanage",
    subtitle: "",
    event: "",
    img: "images/theme4.jpg",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];
    return Flexible(
      child: GridView.count(
        childAspectRatio: 1.0,
        padding: EdgeInsets.only(left: 16, right: 16),
        crossAxisCount: 2,
        crossAxisSpacing: 18,
        mainAxisSpacing: 18,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  item1.img,
                  width: 42,
                ),
                SizedBox(
                  height: 14,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.homePageTheme2Route);
                  },
                  child: Card(
                    child: Material(
                      elevation: 10,
                      color: Color(0xFF674AEF),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          item1.title,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  item2.img,
                  width: 42,
                ),
                SizedBox(
                  height: 14,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.homePageTheme3Route);
                  },
                  child: Card(
                    child: Material(
                      elevation: 10,
                      color: Color(0xFF674AEF),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          item2.title,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.4),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  item3.img,
                  width: 42,
                ),
                SizedBox(
                  height: 14,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  child: Card(
                    child: Material(
                      elevation: 10,
                      color: Color(0xFF674AEF),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          item3.title,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.6),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(
                  item4.img,
                  width: 42,
                ),
                SizedBox(
                  height: 14,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.homeRoute);
                  },
                  child: Card(
                    child: Material(
                      elevation: 10,
                      color: Color(0xFF674AEF),
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Text(
                          item4.title,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Items {
  String title;
  String subtitle;
  String event;
  String img;
  Items(
      {required this.title,
      required this.subtitle,
      required this.event,
      required this.img});
}
