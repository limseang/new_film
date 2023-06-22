import 'package:flutter/material.dart';

void showCustomSnackBar(String message, BuildContext context,
    {bool isError = true}) {
  // final snackBar = SnackBar(content: Text($message));
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      behavior: SnackBarBehavior.floating,
      content: Text(
        message,
        // style: robotoRegular,
      ),
      backgroundColor: isError ? Colors.yellow : Colors.green,
    ),
  );
}