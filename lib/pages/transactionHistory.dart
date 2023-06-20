import 'package:cashmate_vscode/Widgets/chart_monthly.dart';
import 'package:cashmate_vscode/Widgets/chart_weekly.dart';
import 'package:cashmate_vscode/Widgets/chart_yearly.dart';
import 'package:cashmate_vscode/json/daily_json.dart';
import 'package:cashmate_vscode/Widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:cashmate_vscode/utils/routes.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/gestures.dart';
import 'package:cashmate_vscode/Widgets/chart.dart';

class DailyPage extends StatefulWidget {
  const DailyPage({Key? key}) : super(key: key);
  @override
  State<DailyPage> createState() => _DailyPageState();
}

class _DailyPageState extends State<DailyPage> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    List expenses = [
      {
        "icon": Icons.arrow_downward,
        "color": green,
        "label": "Income",
        "cost": "\Rs. 6593.75"
      },
      {
        "icon": Icons.arrow_upward,
        "color": red,
        "label": "Expense",
        "cost": "\Rs. 2645.50"
      }
    ];

    List expenses_weekly = [
      {
        "icon": Icons.arrow_downward,
        "color": green,
        "label": "Income",
        "cost": "\Rs.8593.00"
      },
      {
        "icon": Icons.arrow_upward,
        "color": red,
        "label": "Expense",
        "cost": "\Rs. 10,645.60"
      }
    ];

    List expenses_monthly = [
      {
        "icon": Icons.arrow_downward,
        "color": green,
        "label": "Income",
        "cost": "\Rs. 1,66,593.00"
      },
      {
        "icon": Icons.arrow_upward,
        "color": red,
        "label": "Expense",
        "cost": "\Rs. 40,645.90"
      }
    ];

    List expenses_yearly = [
      {
        "icon": Icons.arrow_downward,
        "color": green,
        "label": "Income",
        "cost": "\Rs. 12,06,593.95"
      },
      {
        "icon": Icons.arrow_upward,
        "color": red,
        "label": "Expense",
        "cost": "\Rs. 9,90,645.67"
      }
    ];

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF674AEF),
          elevation: 0,
          title: Text(
            "Transaction History",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
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
        body: DefaultTabController(
          length: 4,
          child: Column(
            children: [
              Material(
                child: Container(
                  height: 70,
                  color: Color(0xFF674AEF),
                  child: TabBar(
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 10),
                    unselectedLabelColor: Colors.yellow,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(255, 228, 211, 52)),
                    tabs: [
                      Tab(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Daily",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Weekly",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Monthly",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Yearly",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    Container(
                      width: 100,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 490,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Container(
                                      width: double.infinity,
                                      height: 250,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 14, 10, 32),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: grey.withOpacity(0.6),
                                              spreadRadius: 10,
                                              blurRadius: 3,
                                              // changes position of shadow
                                            ),
                                          ]),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 10,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Net balance",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "\Rs. 20,000.00",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 25,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              child: Container(
                                                width: (size.width - 20),
                                                height: 160,
                                                child:
                                                    const ExpenseGraphDesign(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Wrap(
                                      spacing: 20,
                                      children: List.generate(expenses.length,
                                          (index) {
                                        return Container(
                                          width: (size.width - 60) / 2,
                                          height: 170,
                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: grey.withOpacity(0.6),
                                                  spreadRadius: 10,
                                                  blurRadius: 3,
                                                  // changes position of shadow
                                                ),
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 25,
                                                right: 25,
                                                top: 20,
                                                bottom: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: expenses[index]
                                                          ['color']),
                                                  child: Center(
                                                      child: Icon(
                                                    expenses[index]['icon'],
                                                    color: white,
                                                  )),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      expenses[index]['label'],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13,
                                                          color: Color(
                                                              0xff67727d)),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      expenses[index]['cost'],
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: List.generate(
                                  daily.length,
                                  (index) {
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: (size.width - 40) * 0.7,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          grey.withOpacity(0.1),
                                                    ),
                                                    child: Center(
                                                      child: Image.asset(
                                                        daily[index]['icon'],
                                                        width: 30,
                                                        height: 30,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 15),
                                                  Container(
                                                    width:
                                                        (size.width - 90) * 0.5,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          daily[index]['name'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          daily[index]['date'],
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: black
                                                                  .withOpacity(
                                                                      0.5),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: (size.width - 40) * 0.3,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    daily[index]['price'],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15,
                                                        color: Color.fromARGB(
                                                            255, 228, 211, 52)),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 490,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Container(
                                      width: double.infinity,
                                      height: 250,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 14, 10, 32),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: grey.withOpacity(0.6),
                                              spreadRadius: 10,
                                              blurRadius: 3,
                                              // changes position of shadow
                                            ),
                                          ]),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 10,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Net balance",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "\Rs. 20,000.00",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 25,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              child: Container(
                                                width: (size.width - 20),
                                                height: 160,
                                                child:
                                                    const ExpenseGraphDesign_weekly(),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Wrap(
                                      spacing: 20,
                                      children: List.generate(expenses.length,
                                          (index) {
                                        return Container(
                                          width: (size.width - 60) / 2,
                                          height: 170,
                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: grey.withOpacity(0.6),
                                                  spreadRadius: 10,
                                                  blurRadius: 3,
                                                  // changes position of shadow
                                                ),
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 25,
                                                right: 25,
                                                top: 20,
                                                bottom: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: expenses[index]
                                                          ['color']),
                                                  child: Center(
                                                      child: Icon(
                                                    expenses[index]['icon'],
                                                    color: white,
                                                  )),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      expenses[index]['label'],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13,
                                                          color: Color(
                                                              0xff67727d)),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      expenses_weekly[index]
                                                          ['cost'],
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: List.generate(
                                  weekly.length,
                                  (index) {
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: (size.width - 40) * 0.7,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          grey.withOpacity(0.1),
                                                    ),
                                                    child: Center(
                                                      child: Image.asset(
                                                        weekly[index]['icon'],
                                                        width: 30,
                                                        height: 30,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 15),
                                                  Container(
                                                    width:
                                                        (size.width - 90) * 0.5,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          weekly[index]['name'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          weekly[index]['date'],
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: black
                                                                  .withOpacity(
                                                                      0.5),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: (size.width - 40) * 0.3,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    weekly[index]['price'],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15,
                                                        color: Color.fromARGB(
                                                            255, 228, 211, 52)),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 490,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Container(
                                      width: double.infinity,
                                      height: 250,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 14, 10, 32),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: grey.withOpacity(0.6),
                                              spreadRadius: 10,
                                              blurRadius: 3,
                                              // changes position of shadow
                                            ),
                                          ]),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 10,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Net balance",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "\Rs. 20,000.00",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 25,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              child: Container(
                                                width: (size.width - 20),
                                                height: 160,
                                                child:
                                                    const ExpenseGraphDesign_monthly(),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Wrap(
                                      spacing: 20,
                                      children: List.generate(expenses.length,
                                          (index) {
                                        return Container(
                                          width: (size.width - 60) / 2,
                                          height: 170,
                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: grey.withOpacity(0.6),
                                                  spreadRadius: 10,
                                                  blurRadius: 3,
                                                  // changes position of shadow
                                                ),
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 25,
                                                right: 25,
                                                top: 20,
                                                bottom: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: expenses[index]
                                                          ['color']),
                                                  child: Center(
                                                      child: Icon(
                                                    expenses[index]['icon'],
                                                    color: white,
                                                  )),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      expenses[index]['label'],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13,
                                                          color: Color(
                                                              0xff67727d)),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      expenses_monthly[index]
                                                          ['cost'],
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: List.generate(
                                  monthly.length,
                                  (index) {
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: (size.width - 40) * 0.7,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          grey.withOpacity(0.1),
                                                    ),
                                                    child: Center(
                                                      child: Image.asset(
                                                        monthly[index]['icon'],
                                                        width: 30,
                                                        height: 30,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 15),
                                                  Container(
                                                    width:
                                                        (size.width - 90) * 0.5,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          monthly[index]
                                                              ['name'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          monthly[index]
                                                              ['date'],
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: black
                                                                  .withOpacity(
                                                                      0.5),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: (size.width - 40) * 0.3,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    monthly[index]['price'],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15,
                                                        color: Color.fromARGB(
                                                            255, 228, 211, 52)),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 100,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            Container(
                              height: 490,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, right: 20),
                                    child: Container(
                                      width: double.infinity,
                                      height: 250,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(255, 14, 10, 32),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: grey.withOpacity(0.6),
                                              spreadRadius: 10,
                                              blurRadius: 3,
                                              // changes position of shadow
                                            ),
                                          ]),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                top: 10,
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    "Net balance",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                        color: Colors.white),
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    "\Rs. 20,000.00",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 25,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Positioned(
                                              bottom: 0,
                                              child: Container(
                                                width: (size.width - 20),
                                                height: 160,
                                                child:
                                                    const ExpenseGraphDesign_yearly(),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Wrap(
                                      spacing: 20,
                                      children: List.generate(expenses.length,
                                          (index) {
                                        return Container(
                                          width: (size.width - 60) / 2,
                                          height: 170,
                                          decoration: BoxDecoration(
                                              color: white,
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: grey.withOpacity(0.6),
                                                  spreadRadius: 10,
                                                  blurRadius: 3,
                                                  // changes position of shadow
                                                ),
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 25,
                                                right: 25,
                                                top: 20,
                                                bottom: 20),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: 40,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color: expenses[index]
                                                          ['color']),
                                                  child: Center(
                                                      child: Icon(
                                                    expenses[index]['icon'],
                                                    color: white,
                                                  )),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      expenses[index]['label'],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 13,
                                                          color: Color(
                                                              0xff67727d)),
                                                    ),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                      expenses_yearly[index]
                                                          ['cost'],
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        );
                                      }))
                                ],
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 20, right: 20),
                              child: Column(
                                children: List.generate(
                                  yearly.length,
                                  (index) {
                                    return Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(
                                              width: (size.width - 40) * 0.7,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 50,
                                                    height: 50,
                                                    decoration: BoxDecoration(
                                                      shape: BoxShape.circle,
                                                      color:
                                                          grey.withOpacity(0.1),
                                                    ),
                                                    child: Center(
                                                      child: Image.asset(
                                                        yearly[index]['icon'],
                                                        width: 30,
                                                        height: 30,
                                                      ),
                                                    ),
                                                  ),
                                                  SizedBox(width: 15),
                                                  Container(
                                                    width:
                                                        (size.width - 90) * 0.5,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          yearly[index]['name'],
                                                          style: TextStyle(
                                                              fontSize: 15,
                                                              color: black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                        SizedBox(height: 5),
                                                        Text(
                                                          yearly[index]['date'],
                                                          style: TextStyle(
                                                              fontSize: 12,
                                                              color: black
                                                                  .withOpacity(
                                                                      0.5),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              width: (size.width - 40) * 0.3,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Text(
                                                    yearly[index]['price'],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontSize: 15,
                                                        color: Color.fromARGB(
                                                            255, 228, 211, 52)),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        Divider(),
                                      ],
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
