import 'package:flutter/material.dart';
import 'package:login_bloc/src/blocs/bloc.dart';
import 'package:login_bloc/src/blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  build(context) {
    final bloc = Provider.of(context);

    return Container(
      margin: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          emailField(bloc),
          passwordField(bloc),
          Container(
            margin: EdgeInsets.only(top: 25.0),
          ),
          submitButton(bloc),
        ],
      ),
    );
  }

  emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.email,
      builder: (context, snapshot) {
        return TextField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Email Address',
            hintText: 'you@example.com',
            errorText: snapshot.error,
          ),
          onChanged: bloc.changeEmail,
        );
      },
    );
  }

  passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.password,
      builder: (context, snapshot) {
        return TextField(
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Enter Password',
            hintText: 'Password',
            errorText: snapshot.error,
          ),
          onChanged: bloc.changePassword,
        );
      },
    );
  }

  submitButton(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.submitValid,
      builder: (context, snapshot) {
        return RaisedButton(
          color: Colors.blue,
          child: Text('Login'),
          onPressed: snapshot.hasData ? bloc.submit : null,
        );
      },
    );
  }
}
