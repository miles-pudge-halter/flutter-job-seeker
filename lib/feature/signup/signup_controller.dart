import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:job_seeker/feature/signup/signup_state.dart';

class SignupController extends GetxController {
  final _signupStateStream = SignupState().obs;

  SignupState get state => _signupStateStream.value;

  signup(String name, String email, String password) async {
    try {
      _signupStateStream.value = SignupLoading();
      var auth = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (auth.user != null) {
        print(auth.user);
        FirebaseDatabase database = FirebaseDatabase.instance;
        await database.ref('users/${auth.user!.uid}').set({
          'name': name,
          'email': email,
        });
        _signupStateStream.value = SignupSuccess();
        Get.offAllNamed('/dashboard');
      } else {
        _signupStateStream.value = SignupFailure(error: 'User null');
      }
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(msg: e.message ?? '');
      _signupStateStream.value = SignupFailure(error: e.message ?? 'FirebaseAuthExcepion');
    }
    catch(e) {
      Fluttertoast.showToast(msg: e.toString());
      print(e);
      _signupStateStream.value = SignupFailure(error: e.toString());
    }
  }
}
