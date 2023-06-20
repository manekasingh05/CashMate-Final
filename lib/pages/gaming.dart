import 'dart:async';
import 'package:cashmate_vscode/pages/barriers.dart';
import 'package:cashmate_vscode/pages/bird.dart';
import 'package:cashmate_vscode/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cashmate_vscode/pages/bird.dart';
import 'package:flip_card/flip_card.dart';

class GameScreen extends StatefulWidget {
  @override
  _GameScreenState createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  static double birdYaxis = 0;
  double time = 0;
  double height = 0;
  double initialHeight = birdYaxis;
  bool gameHasStarted = false;
  int count = 0;
  int target = 10;
  static double barrierXone = 1;
  double barrierXtwo = barrierXone + 1.5;
  double birdWidth = 0.1;
  double birdheight = 0.1;

  static List<double> barrierX = [2, 2 + 1.5];
  static double barrierWidth = 0.5;
  List<List<double>> barrierHeight = [
    [0.6, 0.4],
    [0.4, 0.6]
  ];

  void startGame() {
    gameHasStarted = true;
    Timer.periodic(Duration(milliseconds: 60), (timer) {
      time += 0.04;
      height = -4.9 * time * time + 2.8 * time;
      setState(() {
        birdYaxis = initialHeight - height;
      });

      setState(() {
        if (barrierX[0] < -1.1) {
          barrierX[0] += 3.2;
          count++;
        } else {
          barrierX[0] -= 0.05;
        }
      });

      setState(() {
        if (barrierX[1] < -1.1) {
          barrierX[1] += 3.2;
        } else {
          barrierX[1] -= 0.05;
        }
      });

      if (birdIsDead()) {
        timer.cancel();
        gameHasStarted = false;
        _showDialog();
      }
      time += 0.01;
    });
  }

  void resetGame() {
    Navigator.pop(context);
    setState(() {
      birdYaxis = 0;
      gameHasStarted = false;
      time = 0;
      count = 0;
      initialHeight = birdYaxis;
    });
  }

  void _showDialog() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/cartoon-8.png'),
                fit: BoxFit.cover,
                opacity: 0.7,
              ),
            ),
            child: AlertDialog(
              backgroundColor: const Color.fromARGB(0, 255, 255, 255),
              title: Column(
                children: [
                  Center(
                    child: Text(
                      'G A M E   O V E R',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                  ),
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Sorry, You have not acheived the Target!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              content: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Score: ${count}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Target: ${target}",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                image: DecorationImage(
                                  image: AssetImage('images/tokens.png'),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              height: 60,
                              width: 60,
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Tokens: +3",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  image: DecorationImage(
                                    image: AssetImage('images/giftbox.png'),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                height: 60,
                                width: 60,
                              ),
                            ),
                            Text(
                              "Reward: +1",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              image: DecorationImage(
                                image: AssetImage('images/Energy.png'),
                                fit: BoxFit.contain,
                              ),
                            ),
                            height: 60,
                            width: 60,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          "Energy: +3",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: showDialogRewards,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            "Claim Rewards",
                            style: TextStyle(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: resetGame,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          padding: EdgeInsets.all(7),
                          child: Text(
                            "Play Again",
                            style: TextStyle(
                                color:
                                    const Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, MyRoutes.gameLevelRoute);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 7, bottom: 7, left: 25, right: 25),
                          child: Text(
                            "Quit",
                            style: TextStyle(
                                color:
                                    const Color.fromARGB(255, 255, 255, 255)),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  void showDialogRewards() {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlipCard(
                    fill: Fill
                        .fillBack, // Fill the back side of the card to make in the same size as the front.
                    direction: FlipDirection.HORIZONTAL, // default
                    side: CardSide.FRONT,
                    onFlipDone: (status) {
                      print(status);
                    },
                    front: Container(
                      height: 240,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Color(0xFF674AEF),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 35, 24, 80)
                                .withOpacity(0.5),
                            borderRadius: BorderRadius.circular(60)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/giftbox.png"),
                                    fit: BoxFit.contain),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'R E W A R D S',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Token: -5',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Choose',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ),
                    back: Container(
                      width: 180,
                      height: 240,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        image: DecorationImage(
                          image: AssetImage("images/offer.jpg"),
                          fit: BoxFit.cover,
                          opacity: 0.1,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "FLAT 20% OFF",
                              style: TextStyle(
                                  color: Color(0xFF674AEF),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text(
                              "Get a chance to have 20% off on the bills of nearby restaurant Chilli.",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.grey.shade200,
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text("XFGTYUI78"),
                                    Icon(
                                      Icons.copy,
                                      color: Color(0xFF674AEF),
                                    ),
                                  ]),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Center(
                              child: Text(
                                "Use Code to claim reward",
                                style: TextStyle(
                                    color: Color(0xFF674AEF),
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  FlipCard(
                    fill: Fill
                        .fillBack, // Fill the back side of the card to make in the same size as the front.
                    direction: FlipDirection.HORIZONTAL, // default
                    side: CardSide.FRONT,
                    onFlipDone: (status) {
                      print(status);
                    },
                    front: Container(
                      height: 240,
                      width: 180,
                      decoration: BoxDecoration(
                        color: Color(0xFF674AEF),
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(255, 35, 24, 80)
                                .withOpacity(0.5),
                            borderRadius: BorderRadius.circular(60)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage("images/giftbox.png"),
                                    fit: BoxFit.contain),
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'R E W A R D S',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                            SizedBox(height: 20),
                            Text(
                              'Token: -5',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Choose',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800),
                            ),
                          ],
                        ),
                      ),
                    ),
                    back: Container(
                        width: 180,
                        height: 240,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          image: DecorationImage(
                              image: AssetImage(
                                'images/cartoon-5.png',
                              ),
                              fit: BoxFit.cover,
                              opacity: 0.2),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Cashback Rs.10",
                                style: TextStyle(
                                    color: Color(0xFF674AEF),
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "CONGRATULATIONS!!!",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w800),
                              ),
                            ),
                            Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "You have just earned Rs.10 in your wallet, Keep Playing to earn more!!",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
          );
        });
  }

  void jump() {
    setState(() {
      time = 0;
      initialHeight = birdYaxis;
    });
  }

  bool birdIsDead() {
    if (birdYaxis < -1 || birdYaxis > 1) {
      return true;
    }

    for (int i = 0; i < barrierX.length; i++) {
      if (barrierX[i] <= birdWidth &&
          barrierX[i] + barrierWidth >= -birdWidth &&
          (birdYaxis <= -1 + barrierHeight[i][0] ||
              birdYaxis + birdheight >= 1 - barrierHeight[i][1])) {
        return true;
      }
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: gameHasStarted ? jump : startGame,
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.blue,
                child: Center(
                  child: Stack(
                    children: [
                      MyBird(
                          birdYaxis: birdYaxis,
                          birdWidth: birdWidth,
                          birdheight: birdheight),
                      Container(
                        alignment: Alignment(0, -0.3),
                        child: gameHasStarted
                            ? Text("")
                            : Text(
                                'T A P  T O  P L A Y',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                      ),
                      MyBarrier(
                        barrierX: barrierX[0],
                        barrierWidth: barrierWidth,
                        barrierHeight: barrierHeight[0][0],
                        isThisBottomBarrier: false,
                      ),
                      MyBarrier(
                        barrierX: barrierX[0],
                        barrierWidth: barrierWidth,
                        barrierHeight: barrierHeight[0][1],
                        isThisBottomBarrier: true,
                      ),
                      MyBarrier(
                        barrierX: barrierX[1],
                        barrierWidth: barrierWidth,
                        barrierHeight: barrierHeight[1][0],
                        isThisBottomBarrier: false,
                      ),
                      MyBarrier(
                        barrierX: barrierX[1],
                        barrierWidth: barrierWidth,
                        barrierHeight: barrierHeight[1][1],
                        isThisBottomBarrier: true,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              height: 15,
              color: Colors.green,
            ),
            Expanded(
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Score:',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                        SizedBox(height: 20),
                        Text(
                          '${count}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Target:',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(height: 20),
                        Text(
                          '${target}',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 35,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
