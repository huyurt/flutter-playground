import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/app/data/services/config/config_service.dart';

class CustomTffWidget extends Container {
  final config = Get.find<ConfigService>();
  final Function(String s)? onSaved;
  final Function(String s)? onValidate;
  final Function(String s)? onChanged;
  final TextEditingController? controller;
  final text, size, obscure, check, icon, type, enabled, initialValue;

  CustomTffWidget(
      {this.text,
      this.enabled = true,
      this.type,
      this.controller,
      this.initialValue,
      this.icon,
      this.obscure = false,
      this.check = false,
      this.size,
      this.onChanged,
      this.onSaved,
      this.onValidate});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: this.size,
      child: Theme(
        data: new ThemeData(
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: this.config.getTheme() ? Colors.white : Colors.black,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: this.config.getTheme() ? Colors.white : Colors.black,
              ),
            ),
            focusColor: this.config.getTheme() ? Colors.white : Colors.black,
          ),
        ),
        child: TextFormField(
          style: TextStyle(
            color: this.config.getTheme() ? Colors.white : Colors.black,
          ),
          initialValue: this.initialValue,
          enabled: this.enabled,
          controller: this.controller,
          obscureText: this.obscure,
          onSaved: (v) => this.onSaved!(v!),
          validator: (v) => this.onValidate!(v!),
          onChanged: (v) => this.onChanged!(v),
          cursorColor: this.config.getTheme() ? Colors.white : Colors.black,
          keyboardType: this.type,
          decoration: new InputDecoration(
            suffixIcon: Icon(
              this.icon,
              color: this.check ? Colors.green : Colors.grey,
            ),
            labelText: this.text,
            labelStyle: TextStyle(
              color: this.config.getTheme() ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
