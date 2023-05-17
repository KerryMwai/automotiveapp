import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/models/user.dart';
import 'package:automotiveapp/pages/signup_page.dart';
import 'package:automotiveapp/firebase/user_authority.dart';
import 'package:automotiveapp/widgets/custom_header_text.dart';
import 'package:automotiveapp/widgets/sign_button.dart';
import 'package:automotiveapp/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: black,
        body: SafeArea(
            child: Container(
          margin: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeaderText(
                  title: "Hello there,\nwelcome back",
                ),
                const SizedBox(
                  height: 50,
                ),
                CustomTextField2(
                  size: size,
                  inputController: emailController,
                  obsecureText: false,
                  labeltext: "E-mail",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField2(
                  size: size,
                  inputController: passwordController,
                  obsecureText: true,
                  labeltext: "Password",
                ),
                const SizedBox(
                  height: 60,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Reset password");
                          },
                          child: Text(
                            "Forgot your Password ?",
                            style: TextStyle(
                                color: white.withOpacity(0.3),
                                fontSize: 18,
                                letterSpacing: 1.2,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final userAuth = UserAuthorization();
                        await userAuth
                            .signInUser(UserModel(
                                userEmail: emailController.text,
                                userPassword: passwordController.text))
                            .then((value) => context.go("/Home"))
                            .catchError((e) => print(e));
                      },
                      child: const SignButton(
                        buttonText: "Sign In",
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "New here ? ",
                          style: TextStyle(
                            color: white.withOpacity(0.3),
                            fontSize: 18,
                            letterSpacing: 1.1,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const SignUpPage()));
                          },
                          child: Text(
                            "Sign Up instead",
                            style: TextStyle(
                                color: white.withOpacity(0.3),
                                fontSize: 18,
                                letterSpacing: 1.2,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        )));
  }
}
