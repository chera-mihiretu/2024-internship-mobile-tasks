import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/themes/themes.dart';
import '../../../product/presentation/widgets/costum_input.dart';
import '../../../product/presentation/widgets/fill_custom_button.dart';
import 'signup_page.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  static const String routes = '/log_in_page';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              const Center(
                child: Image(
                  height: 80,
                  image: AssetImage(
                    'assets/images/logo.png',
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              const Text(
                'Sign into your account',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
              const SizedBox(
                height: 40,
              ),
              CostumInput(
                hint: 'ex: json.smith@email.com',
                control: emailController,
                text: 'Email',
                textColor: MyTheme.ecGrey,
              ),
              CostumInput(
                hint: '***********',
                control: passwordController,
                text: 'Password',
                textColor: MyTheme.ecGrey,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  children: [
                    Checkbox(value: false, onChanged: (val) {}),
                    RichText(
                      text: const TextSpan(
                          text: 'I undrestood the ',
                          style: TextStyle(color: MyTheme.ecGrey, fontSize: 15),
                          children: [
                            TextSpan(
                                text: 'term & policy.',
                                style: TextStyle(color: MyTheme.ecBlue))
                          ]),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: FillCustomButton(
                      press: () {},
                      label: 'SIGN IN',
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 8,
              ),
              RichText(
                text: TextSpan(
                    text: 'Don\'t have an account?',
                    style: const TextStyle(color: MyTheme.ecGrey, fontSize: 20),
                    children: [
                      TextSpan(
                        text: ' SIGN UP',
                        style: const TextStyle(color: MyTheme.ecBlue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(context, SignUpPage.routes);
                          },
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
