import 'package:blog/frontend/constant.dart';
import 'package:blog/frontend/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bottomnavigation.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late bool _open;
  @override
  void initState() {
    _open = false;
    super.initState();
  }

  bool isloading = false;

  final _key = GlobalKey<FormState>();
  final username = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ListView(
                  shrinkWrap: true,
                  children: [
                    const Text(
                      "Hey, \n Login Now.",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 26),
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                        height: 50,
                        child: UsernameField(
                            label: 'Username', controller: username)),
                    const SizedBox(height: 25),
                    SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: password,
                        //                  validator: (value) {
                        //   if (value!.isEmpty) {
                        //     return 'Please enter your email';
                        //   }
                        //   if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                        //     return 'Please enter a valid email';
                        //   }
                        //   return null;
                        // },
                        obscureText: !_open,
                        decoration: InputDecoration(
                            filled: true,
                            border: const OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            hintText: 'Password',
                            suffixIcon: GestureDetector(
                              onTap: (() {
                                setState(() {
                                  _open = !_open;
                                });
                              }),
                              child: Icon(
                                _open ? Icons.visibility : Icons.visibility_off,
                                color: const Color.fromARGB(255, 197, 47, 47),
                              ),
                            )),
                      ),
                    ),
                    const SizedBox(height: 25),
                    RichText(
                      text: TextSpan(
                        text: 'Forget Password?',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const LoginPage()),
                                      )
                                    },
                              text: '  Reset',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    const SizedBox(height: 25),
                    isloading
                        ? const CircularProgressIndicator()
                        : LoginButton(
                            label: 'Login',
                            tap: () async {
                              setState(() {
                                isloading = true;
                              });
                              if (_key.currentState!.validate()) {
                                _key.currentState!.save();

                                _login(
                                    username: username.text.trim(),
                                    password: password.text.trim());
                              }
                              setState(() {
                                isloading = false;
                              });
                            },
                          ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 235, 229, 229),
                            borderRadius: BorderRadius.circular(15)),
                        child: const Center(
                          child: Text("Sign Up",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 156, 17, 17))),
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future _login({
    required String password,
    required String username,
  }) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: username,
        password: password,
      );

      if (userCredential != null) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
              builder: (context) => const BuildBottomNavigation()),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.showSnackbar(
          const GetSnackBar(
            title: 'Error!',
            message: 'No user found for that email',
            icon: Icon(Icons.refresh),
            duration: Duration(seconds: 3),
          ),
        );
      } else if (e.code == 'wrong-password') {
        Get.showSnackbar(
          const GetSnackBar(
            title: 'Error!',
            message: 'Wrong password provided for that user.',
            icon: Icon(Icons.refresh),
            duration: Duration(seconds: 3),
          ),
        );
      } else {
        Get.showSnackbar(
          GetSnackBar(
            backgroundColor: Color.fromARGB(255, 124, 33, 33),
            title: 'Error!',
            message: e.toString(),
            icon: const Icon(Icons.refresh),
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }
}
