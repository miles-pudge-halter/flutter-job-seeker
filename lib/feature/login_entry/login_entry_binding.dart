import 'package:get/get.dart';
import 'package:job_seeker/feature/login_entry/login_entry_controller.dart';

class LoginEntryBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(LoginEntryController());
  }
}