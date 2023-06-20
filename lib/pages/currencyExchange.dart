import 'package:cashmate_vscode/pages/loginPage.dart';
import 'package:cashmate_vscode/pages/registerPage.dart';
import 'package:cashmate_vscode/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:cashmate_vscode/pages/responsive.dart';
import 'package:cashmate_vscode/Widgets/converter_widget.dart';
import 'package:cashmate_vscode/components/NavBar.dart';
import 'package:cashmate_vscode/Widgets/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class CurrencyExchange extends StatefulWidget {
  const CurrencyExchange({Key? key}) : super(key: key);

  @override
  _CurrencyExchangeState createState() => _CurrencyExchangeState();
}

class _CurrencyExchangeState extends State<CurrencyExchange> {
  var height, width;
  String currentDate = DateFormat.yMMMd('en_US').format(DateTime.now());
  final myusername = MyRegister.myUsername;

  bool isDrawerOpen = false;
  bool keepAlive = true;

  final ScrollController _scrollController = ScrollController();

  double _opacity = 0;
  double _screenPosition = 0;

  _scrollListener() {
    setState(() {
      _screenPosition = _scrollController.position.pixels;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    final _screenSize = MediaQuery.of(context).size;
    _opacity = _screenPosition < _screenSize.height * 0.40
        ? _screenPosition / (_screenSize.height * 0.40)
        : 1;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: Responsive.isSmallScreen(context)
          ? AppBar(
              backgroundColor: Color(0xFF674AEF).withOpacity(_opacity),
              elevation: 0,
              title: SingleChildScrollView(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 9.0),
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
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0),
                      child: IconButton(
                        icon: Icon(
                          Icons.notifications_active,
                          size: 30,
                          color: const Color.fromARGB(255, 211, 195, 47),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.activityRoute);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          : PreferredSize(
              preferredSize: Size(_screenSize.width, 1000),
              child: TopBar(opacity: _opacity),
            ),
      drawer: NavBar(),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: ClampingScrollPhysics(),
        child: Container(
          //added line
          color: Colors.grey.shade300,
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    child: SizedBox(
                      height: _screenSize.height * 0.25,
                      width: _screenSize.width,
                      child: Image.asset(
                        'images/background.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: _screenSize.height * 0.10,
                        left: _screenSize.width / 10,
                        right: _screenSize.width / 10),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        ConverterWidget(),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
