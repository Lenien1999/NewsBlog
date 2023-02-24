import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late bool _open;
  bool isloading = false;
  @override
  void initState() {
    _open = false;
    super.initState();
  }

  final username = TextEditingController();
  final password = TextEditingController();
  final firtsname = TextEditingController();
  final othername = TextEditingController();
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.black,
        body: Form(
          key: _key,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Sign Up, \n Lenient Blog.",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 26),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 50,
                  child: UsernameField(label: 'Username', controller: username),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 50,
                  child:
                      UsernameField(label: 'FirstName', controller: firtsname),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 50,
                  child:
                      UsernameField(label: 'Othername', controller: othername),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 50,
                  child: TextFormField(
                    controller: password,
                    obscureText: !_open,
                    decoration: InputDecoration(
                        filled: true,
                        border: const OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
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
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: 'Already have an account?',
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
                            text: "  Go Back",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 25),
               isloading? const CircularProgressIndicator(): LoginButton(
                  label: 'Create Account',
                  tap: () async {
                    setState(() {
                                isloading = true;
                              });
                    if (_key.currentState!.validate()) {
                      _key.currentState!.save();

                      try {
                        FirebaseAuth auth = FirebaseAuth.instance;
                        UserCredential userCredential = await FirebaseAuth
                            .instance
                            .createUserWithEmailAndPassword(
                          email: username.text.trim(),
                          password: password.text.trim(),
                        );

                        User? user = userCredential.user;
                        await FirebaseFirestore.instance
                            .collection('users')
                            .doc(user!.uid)
                            .set({
                          'firstname': firtsname.text,
                          'othername': othername.text,
                        });
                        user = auth.currentUser;
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).pop();
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          Get.showSnackbar(
                            const GetSnackBar(
                              title: 'Error!',
                              message: 'The password provided is too weak.',
                              icon: Icon(Icons.refresh),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        } else if (e.code == 'email-already-in-use') {
                          Get.showSnackbar(
                            const GetSnackBar(
                              title: 'Error!',
                              message:
                                  'The account already exists for that email.',
                              icon: Icon(Icons.refresh),
                              duration: Duration(seconds: 3),
                            ),
                          );
                        }
                      } catch (e) {
                        Get.showSnackbar(
                          GetSnackBar(
                            title: 'Error!',
                            message: e.toString(),
                            icon: const Icon(Icons.refresh),
                            duration: const Duration(seconds: 3),
                          ),
                        );
                      }
                    }
                    setState(() {
                                isloading = false;
                              });
                  },
                ),
                const SizedBox(height: 30),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 235, 229, 229),
                      borderRadius: BorderRadius.circular(15)),
                  child: const Center(
                    child: Text("Enjoy Yourself",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 156, 17, 17))),
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
