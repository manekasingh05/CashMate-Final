import 'package:cashmate_vscode/pages/addMoneyinWallet.dart';
import 'package:cashmate_vscode/pages/currencyExchange.dart';
import 'package:cashmate_vscode/pages/game_levels.dart';
import 'package:cashmate_vscode/pages/homepage.dart';
import 'package:cashmate_vscode/pages/moneyLock.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class WhiteBottomNavigationBar extends StatefulWidget {
  @override
  _WhiteBottomNavigationBarState createState() =>
      _WhiteBottomNavigationBarState();
}

class _WhiteBottomNavigationBarState extends State<WhiteBottomNavigationBar> {
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  final screens = [
    HomeScreen(),
    CurrencyExchange(),
    SendMoneyPage(),
    moneyLock(),
    GameLevelScreen()
  ];

  final items = <Widget>[
    Icon(
      Icons.home,
      color: _primaryColor,
    ),
    Icon(
      Icons.currency_exchange,
      color: _primaryColor,
    ),
    Icon(
      Icons.add,
      color: _primaryColor,
    ),
    Icon(
      Icons.lock,
      color: _primaryColor,
    ),
    Icon(
      Icons.games,
      color: _primaryColor,
    ),
  ];
  var index = 0;

  static const Color _primaryColor = Color(0xFF674AEF);
  static const Color _secondaryColor = Color.fromARGB(255, 211, 195, 47);

  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: index,
        height: 48,
        backgroundColor: Colors.transparent,
        color: Colors.white,
        animationDuration: Duration(milliseconds: 300),
        onTap: (index) {
          setState(() {
            this.index = index;
          });
        },
        items: items,
      ),
      body: screens[index],
    );
  }
}
