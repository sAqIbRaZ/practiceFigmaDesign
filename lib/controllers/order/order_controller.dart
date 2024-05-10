import 'package:get/get.dart';

class OrderController extends GetxController {
  RxBool isPreparingDone = false.obs;
  RxBool isPickedUpDone = false.obs;

  void preparingDoneFunction() {
    isPreparingDone.value = true;
  }

  void pickedUpDoneFunction() {
    isPickedUpDone.value = true;
  }
}
