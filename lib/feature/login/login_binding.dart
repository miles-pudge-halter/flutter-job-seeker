import 'package:get/get.dart';
import 'package:job_seeker/feature/login/login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}