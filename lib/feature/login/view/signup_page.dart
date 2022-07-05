import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../../Constants.dart';
import '../../shared/buttons.dart';
import '../../shared/form_inputs.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(height: 30),
                SvgPicture.asset(
                  'assets/login.svg',
                  fit: BoxFit.contain,
                  width: 400,
                ),
                const SizedBox(height: 60),
                Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: 40),
                Form(
                  child: Column(
                    children: [
                      NFQTextFormField(
                        'Full name',
                        inputType: TextInputType.name,
                        inputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 10),
                      NFQTextFormField(
                        'Email',
                        inputType: TextInputType.emailAddress,
                        inputAction: TextInputAction.next,
                      ),
                      const SizedBox(height: 10),
                      NFQTextFormField(
                        'Password',
                        inputType: TextInputType.visiblePassword,
                        obscureText: true,
                      ),
                      const SizedBox(height: 20),
                      Container(
                        width: double.infinity,
                        height: 55,
                        child: NFQPrimaryButton(
                          'Join Now',
                          () {},
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already a user?',
                      style: TextStyle(
                        color: ThemeColor().darkGrey,
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Text(
                        'Login now',
                        style: TextStyle(
                          color: ThemeColor().yellow,
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
