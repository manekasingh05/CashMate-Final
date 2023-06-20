import 'package:cashmate_vscode/utils/routes.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:cashmate_vscode/controllers/success.dart';

class TransactionSuccessView extends GetView<TransactionSuccessController> {
  const TransactionSuccessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF674AEF),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 278,
                width: 278,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/Success.png'),
                    scale: 2.0,
                  ),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                'Success',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
              Text(
                'Yayyy!! Enjoy your Payment with us',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {},
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(
                        context, MyRoutes.addMoneyinWalletRoute);
                  },
                  child: Container(
                    height: 55,
                    width: Get.width * 0.8,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      'Finish',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF674AEF),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
