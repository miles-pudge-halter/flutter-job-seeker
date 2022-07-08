import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {

  checkUserData() async {
    Future.delayed(const Duration(milliseconds: 1000));
    var currentUser = FirebaseAuth.instance.currentUser;
    if(currentUser != null) {
      Get.offAllNamed('/dashboard');
    } else {
      Get.offAllNamed('/entry');
    }
  }

  @override
  void onInit() {
    super.onInit();
    checkUserData();
  }
}