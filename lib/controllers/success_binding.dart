import 'package:get/get.dart';

import 'package:cashmate_vscode/controllers/success.dart';

class TransactionSuccessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionSuccessController>(
      () => TransactionSuccessController(),
    );
  }
}
