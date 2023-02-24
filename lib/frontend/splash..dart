// ignore: file_names
import 'package:blog/frontend/login.dart';
import 'package:flutter/material.dart';
import 'dart:async';
 
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
void initState() {
  super.initState();
  startTimer();
}

startTimer() async {
  var duration = const Duration(seconds: 6);
  return   Timer(duration, route);
}

route() {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => const LoginPage()));
}
  @override
  
  Widget build(BuildContext context) {
    return const Scaffold(
backgroundColor:Colors.black,
      body:Center(
        
        child: Image(image: AssetImage('assets/blog1.jpg')),
      )
    );
  }
}
