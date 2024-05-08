import 'package:flutter/material.dart';

class Toast extends StatelessWidget {
  const Toast({super.key});
  void showToast(BuildContext context, String message) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(
          seconds: 2), // Duration for which the toast message will be visible
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
