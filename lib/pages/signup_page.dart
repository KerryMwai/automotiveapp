import 'package:automotiveapp/constants/colors.dart';
import 'package:automotiveapp/models/user.dart';
import 'package:automotiveapp/pages/home_page.dart';
import 'package:automotiveapp/pages/signin_page.dart';
import 'package:automotiveapp/firebase/user_authority.dart';
import 'package:automotiveapp/widgets/custom_header_text.dart';
import 'package:automotiveapp/widgets/sign_button.dart';
import 'package:automotiveapp/widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: black,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 40, left: 30),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomHeaderText(
                  title: "Get on Borad",
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField2(
                    size: size,
                    inputController: emailController,
                    obsecureText: false,
                    labeltext: "E-mail"),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField2(
                    size: size,
                    inputController: nameController,
                    obsecureText: false,
                    labeltext: "Name"),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField2(
                    size: size,
                    inputController: passwordController,
                    obsecureText: true,
                    labeltext: "Enter Password"),
                const SizedBox(
                  height: 10,
                ),
                CustomTextField2(
                    size: size,
                    inputController: confirmPasswordController,
                    obsecureText: true,
                    labeltext: "Confirm Password"),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "By creating an account, you agree to the",
                          style: TextStyle(
                            color: white.withOpacity(0.3),
                            wordSpacing: 4,
                            fontSize: 14,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print("Terms and Use");
                          },
                          child: Text(
                            "Terms and Use",
                            style: TextStyle(
                                color: white.withOpacity(0.3),
                                fontSize: 14,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                        Text(
                          " and ",
                          style: TextStyle(
                            color: white.withOpacity(0.3),
                            fontSize: 14,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print("Privacy and Policy");
                          },
                          child: Text(
                            "Privacy and Policy",
                            style: TextStyle(
                                color: white.withOpacity(0.3),
                                fontSize: 14,
                                decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                        onTap: () async {
                          final userAuth = UserAuthorization();
                          await userAuth
                              .signUpUser(UserModel(
                                  userEmail: emailController.text,
                                  userPassword: passwordController.text))
                              .then((value) => context.go("/Home"))
                              .catchError((e)=>print(e));
                        },
                        child: const SignButton(
                          buttonText: "Sign Up",
                        )),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInPage()));
                      },
                      child: Text(
                        "I am already a member",
                        style: TextStyle(
                            color: white.withOpacity(0.3),
                            fontSize: 16,
                            letterSpacing: 1.4,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
