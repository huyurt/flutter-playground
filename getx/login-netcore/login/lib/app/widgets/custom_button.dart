import 'package:flutter/material.dart';

class CustomButtonWidget extends Container {
  final text, callback;

  CustomButtonWidget({this.callback, this.text});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Text(
        this.text,
      ),
      onPressed: () => this.callback(),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
    );
  }
}
