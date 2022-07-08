import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:job_seeker/feature/login/login_controller.dart';
import 'package:job_seeker/feature/signup/signup_controller.dart';
import 'package:job_seeker/feature/signup/signup_state.dart';

import '../../Constants.dart';
import '../shared/buttons.dart';
import '../shared/form_inputs.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

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
                SignUpForm(),
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

class SignUpForm extends StatefulWidget {
  const SignUpForm({Key? key}) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  SignupController controller = Get.find<SignupController>();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  onSignup() {
    if (_key.currentState!.validate()) {
      controller.signup(_nameController.text, _emailController.text,
          _passwordController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _key,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        children: [
          NFQTextFormField(
            'Full name',
            inputType: TextInputType.name,
            inputAction: TextInputAction.next,
            controller: _nameController,
            validator: (text) {
              if (text == null || text.isEmpty) {
                return 'Name is required';
              }
              return null;
            },
          ),
          const SizedBox(height: 10),
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
            return controller.state is SignupLoading
                ? Center(
                  child: CircularProgressIndicator(
                      color: ThemeColor().yellow,
                    ),
                )
                : Container(
                    width: double.infinity,
                    height: 55,
                    child: NFQPrimaryButton(
                      'Join Now',
                      onSignup,
                    ),
                  );
          }),
        ],
      ),
    );
  }
}
