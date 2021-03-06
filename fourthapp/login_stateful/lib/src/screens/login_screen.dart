import 'package:flutter/material.dart';
import 'package:login_stateful/src/mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: <Widget>[
            emailField(),
            passwordField(),
            Container(
              margin: EdgeInsets.only(
                top: 25.0,
              ),
            ),
            submitButton(),
          ],
        ),
      ),
    );
  }

  emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: validationEmail,
      onSaved: (String value) {
        email = value;
      },
    );
  }

  passwordField() {
    return Container(
      margin: EdgeInsets.only(
        bottom: 25.0,
      ),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          labelText: 'Enter Password',
          hintText: 'Password',
        ),
        validator: validationPassword,
        onSaved: (String value) {
          password = value;
        },
      ),
    );
  }

  submitButton() {
    return RaisedButton(
      color: Colors.blue,
      child: Text('Submit'),
      onPressed: () {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
        }
      },
    );
  }
}
