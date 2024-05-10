import 'package:get/get.dart';
import 'package:food_delivery_app/controllers/auth_controller/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController()); // Register AuthController here
  }
}
