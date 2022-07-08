import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:job_seeker/feature/login_entry/login_entry_state.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginEntryController extends GetxController {

  final _stateStream = LoginEntryState().obs;

  LoginEntryState get state => _stateStream.value;

  loginWithGoogle () async {
    _stateStream.value = LoginEntryLoading();
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      var auth = await FirebaseAuth.instance.signInWithCredential(credential);
      if(auth.user != null) {
        FirebaseDatabase database = FirebaseDatabase.instance;
        await database.ref('users/${auth.user!.uid}').set({
          'name': auth.user!.displayName,
          'email': auth.user!.email,
        });
        Get.offAllNamed('/dashboard');
      } else {
        _stateStream.value = LoginEntryFailure(error: 'User null');
      }
    } catch(e) {
      _stateStream.value = LoginEntryFailure(error: e.toString());
    }
  }
}