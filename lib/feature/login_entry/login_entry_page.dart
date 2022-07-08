import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_seeker/Constants.dart';
import 'package:job_seeker/feature/login_entry/login_entry_controller.dart';

class LoginEntryPage extends StatelessWidget {
  LoginEntryController controller = Get.find();

  LoginEntryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const CircleAvatar(
              radius: 150,
              backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1518306896927-d58c59c07b82?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTIxfHxzZWFyY2hpbmclMjB3aXRoJTIwYmlub2N1bGFyc3xlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                'Find Your Dream Job With Us',
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
            ),
            Text(
              'Apply your best job and best locations',
              style: Theme.of(context).textTheme.bodyText2?.copyWith(
                    color: ThemeColor().darkGrey,
                  ),
            ),
            const SizedBox(height: 30),
            _buildLoginButton('Login with Email', false, context, () {
              Get.toNamed('/entry/login');
            }),
            const SizedBox(height: 20),
            _buildLoginButton('Login with Google', true, context, () {
              controller.loginWithGoogle();
            }),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton(
      String title, bool isSocialLogin, BuildContext context, void Function() onClick) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        onTap: onClick,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            color: Colors.grey.shade200,
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    isSocialLogin
                        ? Image.network(
                            'https://myplaceloungechiangmai.com/wp-content/uploads/2015/02/google-logo-icon-PNG-Transparent-Background.png',
                            width: 30,
                            height: 30,
                          )
                        : const Icon(
                            Icons.alternate_email_rounded,
                            size: 30,
                            color: Colors.blue,
                          ),
                    const SizedBox(width: 10),
                    Text(title),
                  ],
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: ThemeColor().blue,
                  ),
                  child: const Icon(
                    Icons.arrow_forward_rounded,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
