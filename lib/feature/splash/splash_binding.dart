import 'package:get/get.dart';
import 'package:job_seeker/feature/splash/splash_controller.dart';

class SplashBinding extends Bindings {

  @override
  void dependencies() {
    Get.put(SplashController());
  }
}