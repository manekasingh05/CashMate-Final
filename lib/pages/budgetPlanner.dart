import 'package:cashmate_vscode/components/budget_card.dart';
import 'package:cashmate_vscode/json/daily_json.dart';
import 'package:cashmate_vscode/Widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:cashmate_vscode/utils/routes.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:cashmate_vscode/json/budgetPlanner.dart';
import 'package:cashmate_vscode/pages/create_budget.dart';

class BudgetPage extends StatefulWidget {
  static List<Budget> budgets = List.empty(growable: true);

  BudgetPage({Key? key}) : super(key: key);
  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage> {
  List<Budget> budget = BudgetPage.budgets;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF674AEF),
          elevation: 0,
          title: SingleChildScrollView(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Budget Planner",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, MyRoutes.createBudgetRoute);
                  },
                  child: Icon(Icons.add),
                ),
              ],
            ),
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
                      height: 130,
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: List.generate(
                                budget_json.length,
                                (index) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          color: white,
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          boxShadow: [
                                            BoxShadow(
                                              color: grey.withOpacity(0.8),
                                              spreadRadius: 6,
                                              blurRadius: 3,
                                              // changes position of shadow
                                            ),
                                          ]),
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                            left: 25,
                                            right: 25,
                                            bottom: 25,
                                            top: 25),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              budget_json[index]['name'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 13,
                                                  color: Color(0xFF674AEF)),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      budget_json[index]
                                                          ['price'],
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 8,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 3),
                                                      child: Text(
                                                        budget_json[index][
                                                            'label_percentage'],
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontSize: 13,
                                                            color: Color(
                                                                    0xff67727d)
                                                                .withOpacity(
                                                                    0.6)),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 3),
                                                  child: Text(
                                                    "\Rs.5000.00",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                        color: Color(0xff67727d)
                                                            .withOpacity(0.6)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Stack(
                                              children: [
                                                Container(
                                                  width: (size.width - 40),
                                                  height: 4,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Color(0xff67727d)
                                                          .withOpacity(0.1)),
                                                ),
                                                Container(
                                                  width: (size.width - 40) *
                                                      budget_json[index]
                                                          ['percentage'],
                                                  height: 4,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: Color(0xFF674AEF)),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                          budget.isEmpty
                              ? const Text('No More Budgets')
                              : Expanded(
                                  child: ListView.builder(
                                    itemCount: budget.length,
                                    itemBuilder: (context, data) =>
                                        getRow(data),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Container(
                      height: 130,
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                                children: List.generate(
                                    budget_json_weekly.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: grey.withOpacity(0.8),
                                          spreadRadius: 6,
                                          blurRadius: 3,
                                          // changes position of shadow
                                        ),
                                      ]),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                        bottom: 25,
                                        top: 25),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          budget_json_weekly[index]['name'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Color(0xFF674AEF)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  budget_json_weekly[index]
                                                      ['price'],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 3),
                                                  child: Text(
                                                    budget_json_weekly[index]
                                                        ['label_percentage'],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                        color: Color(0xff67727d)
                                                            .withOpacity(0.6)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 3),
                                              child: Text(
                                                "\Rs.10,000.00",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                    color: Color(0xff67727d)
                                                        .withOpacity(0.6)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Stack(
                                          children: [
                                            Container(
                                              width: (size.width - 40),
                                              height: 4,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Color(0xff67727d)
                                                      .withOpacity(0.1)),
                                            ),
                                            Container(
                                              width: (size.width - 40) *
                                                  budget_json_weekly[index]
                                                      ['percentage'],
                                              height: 4,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Color(0xFF674AEF)),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 130,
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                                children: List.generate(
                                    budget_json_monthly.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: grey.withOpacity(0.8),
                                          spreadRadius: 6,
                                          blurRadius: 3,
                                          // changes position of shadow
                                        ),
                                      ]),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                        bottom: 25,
                                        top: 25),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          budget_json_monthly[index]['name'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Color(0xFF674AEF)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  budget_json_monthly[index]
                                                      ['price'],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 3),
                                                  child: Text(
                                                    budget_json_monthly[index]
                                                        ['label_percentage'],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                        color: Color(0xff67727d)
                                                            .withOpacity(0.6)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 3),
                                              child: Text(
                                                "\Rs.30,000.00",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                    color: Color(0xff67727d)
                                                        .withOpacity(0.6)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Stack(
                                          children: [
                                            Container(
                                              width: (size.width - 40),
                                              height: 4,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Color(0xff67727d)
                                                      .withOpacity(0.1)),
                                            ),
                                            Container(
                                              width: (size.width - 40) *
                                                  budget_json_monthly[index]
                                                      ['percentage'],
                                              height: 4,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Color(0xFF674AEF)),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 130,
                      child: Column(
                        children: [
                          SizedBox(height: 50),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                                children: List.generate(
                                    budget_json_yearly.length, (index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 20),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      color: white,
                                      borderRadius: BorderRadius.circular(12),
                                      boxShadow: [
                                        BoxShadow(
                                          color: grey.withOpacity(0.8),
                                          spreadRadius: 6,
                                          blurRadius: 3,
                                          // changes position of shadow
                                        ),
                                      ]),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                        left: 25,
                                        right: 25,
                                        bottom: 25,
                                        top: 25),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          budget_json_yearly[index]['name'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 13,
                                              color: Color(0xFF674AEF)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  budget_json_yearly[index]
                                                      ['price'],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 8,
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 3),
                                                  child: Text(
                                                    budget_json_yearly[index]
                                                        ['label_percentage'],
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 13,
                                                        color: Color(0xff67727d)
                                                            .withOpacity(0.6)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 3),
                                              child: Text(
                                                "\Rs.1,25,000.00",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 13,
                                                    color: Color(0xff67727d)
                                                        .withOpacity(0.6)),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Stack(
                                          children: [
                                            Container(
                                              width: (size.width - 40),
                                              height: 4,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Color(0xff67727d)
                                                      .withOpacity(0.1)),
                                            ),
                                            Container(
                                              width: (size.width - 40) *
                                                  budget_json_yearly[index]
                                                      ['percentage'],
                                              height: 4,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  color: Color(0xFF674AEF)),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget getRow(int data) {
    return Padding(
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: grey.withOpacity(0.8),
                spreadRadius: 6,
                blurRadius: 3,
              ),
            ]),
        child: Padding(
          padding: EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                budget[data].budgetName,
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                    color: Color(0xFF674AEF)),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Rs. 0",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 3),
                        child: Text(
                          "0%",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Color(0xff67727d).withOpacity(0.6)),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 3),
                    child: Text(
                      'Rs. ${budget[data].budgetAmount}',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: Color(0xff67727d).withOpacity(0.6)),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Stack(
                children: [
                  Container(
                    width: 10,
                    height: 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xff67727d).withOpacity(0.1)),
                  ),
                  Container(
                    width: 10,
                    height: 4,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFF674AEF)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
