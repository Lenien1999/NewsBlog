import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';

class UsernameField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const UsernameField({
    Key? key,
    required this.label,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          border: const OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          hintText: label,
          suffixIcon: const Icon(
            Icons.person,
            color: Color.fromARGB(255, 223, 66, 66),
          )),
    );
  }
}

class LoginButton extends StatelessWidget {
  final String label;
  final Function() tap;
  const LoginButton({
    Key? key,
    required this.label,
    required this.tap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 156, 17, 17),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(label,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
      ),
    );
  }
}

class MySnackBars {
  /// failure
  static var failureSnackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'On Snap!',
      message:
          'You have failed to read this failure message.\nPlease try again!',
      contentType: ContentType.failure,
    ),
  );

  /// help
  static var helpSnackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Hi There!',
      message:
          'You need to use this package in the app to uplift your Snackbar Experinece!',
      contentType: ContentType.help,
    ),
  );

  /// success
  static var successSnackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Congratulation!',
      message:
          'You have successfulyy read this message.\nPlease continue working!',
      contentType: ContentType.success,
    ),
  );

  /// warning
  static var warningSnackBar = SnackBar(
    elevation: 0,
    behavior: SnackBarBehavior.floating,
    backgroundColor: Colors.transparent,
    content: AwesomeSnackbarContent(
      title: 'Warning!',
      message: 'You Have a warning for this message.\nPlease read carefully!',
      contentType: ContentType.warning,
    ),
  );
}
