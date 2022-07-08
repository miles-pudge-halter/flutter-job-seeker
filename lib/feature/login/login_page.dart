import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:job_seeker/Constants.dart';
import 'package:job_seeker/feature/login/login_controller.dart';
import 'package:job_seeker/feature/shared/buttons.dart';
import 'package:job_seeker/feature/shared/form_inputs.dart';

import 'login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 30),
                SvgPicture.asset(
                  'assets/login.svg',
                  fit: BoxFit.contain,
                  width: 400,
                ),
                const SizedBox(height: 60),
                Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.headline1,
                ),
                const SizedBox(height: 40),
                LoginForm(),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'New user?',
                      style: TextStyle(
                        color: ThemeColor().darkGrey,
                      ),
                    ),
                    const SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Get.toNamed('/entry/signup');
                      },
                      child: Text(
                        'Create an account',
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

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  LoginController controller = Get.find<LoginController>();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  onSignIn() {
    controller.login(_emailController.text, _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        NFQTextFormField(
          'Email',
          inputType: TextInputType.emailAddress,
          inputAction: TextInputAction.next,
          controller: _emailController,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Email is required';
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
        NFQTextFormField(
          'Password',
          inputType: TextInputType.visiblePassword,
          obscureText: true,
          controller: _passwordController,
          validator: (text) {
            if (text == null || text.isEmpty) {
              return 'Password is required';
            }
            return null;
          },
        ),
        const SizedBox(height: 20),
        Obx(() {
          return controller.state is LoginLoading
              ? CircularProgressIndicator()
              : Container(
                  width: double.infinity,
                  height: 55,
                  child: NFQPrimaryButton(
                    'Sign In',
                    onSignIn,
                  ),
                );
        }),
      ],
    ));
  }
}
