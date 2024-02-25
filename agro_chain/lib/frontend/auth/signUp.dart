import 'package:agro_chain/frontend/onBoarding/page1.dart';

import 'login.dart';

import '../resources/authMethods.dart';
import '../utils/snackbar.dart';
import '../widgets.dart/custom_buttons.dart';
import '../widgets.dart/custom_textfield.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordcontroller = TextEditingController();
  final TextEditingController usernamecontroller = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordcontroller.dispose();
    usernamecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      const Text(
                        'Agro Chain',
                        style: TextStyle(
                            fontSize: 48, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      CustomTextfield(
                        hinttext: 'enter your email',
                        controller: emailcontroller,
                        isobscureText: false,
                        icon: Icons.person,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextfield(
                        hinttext: 'enter your password',
                        controller: passwordcontroller,
                        isobscureText: true,
                        icon: Icons.password,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextfield(
                        hinttext: 'enter your username',
                        controller: usernamecontroller,
                        isobscureText: false,
                        icon: Icons.people,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          const Text('Already an user?'),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => const LoginScreen()));
                              },
                              child: const Text('Login'))
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          String res = await AuthMethods().signup(
                              email: emailcontroller.text,
                              username: usernamecontroller.text,
                              password: passwordcontroller.text,
                              context: context);

                          if (res == 'success') {
                            setState(() {
                              isLoading = false;
                            });
                          await  showSnackbar('Signup success', context);

                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) {
                              return const Page1();
                            }));
                          } else {
                             setState(() {
                              isLoading = false;
                            });
                            showSnackbar(res, context);
                          }
                        },
                        child: const CustomButton(
                            height: 50,
                            width: double.infinity,
                            text: 'Sign up'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
