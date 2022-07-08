import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'login_state.dart';

class LoginController extends GetxController {
  final _loginStateStream = LoginState().obs;

  LoginState get state => _loginStateStream.value;
  login(String email, String password) async {
    _loginStateStream.value = LoginLoading();
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _loginStateStream.value = LoginSuccess();
      Get.offAllNamed('/dashboard');
    } on FirebaseAuthException catch(e)  {
      Fluttertoast.showToast(msg: e.message ?? '');
      _loginStateStream.value = LoginFailure(error: e.message ?? 'FirebaseAuthException');
    }
    catch (e) {
      print(e);
      Fluttertoast.showToast(msg: e.toString());
      _loginStateStream.value = LoginFailure(error: e.toString());
    }
  }
}
