import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(children: [
          emailField(),
          passwordField(),
          SizedBox(
            height: 20,
          ),
          submitbutton(),
        ]),
      ),
    );
  }

  emailField() {
    return const TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'you@example.com',
        labelText: 'Email Address',
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }

  passwordField() {
    return const TextField(
      obscureText: false,
      decoration: InputDecoration(
          hintText: 'use strong password', labelText: 'Password'),
    );
  }

  submitbutton() {
    return ElevatedButton(
      onPressed: () {},
      child: Text('login'),
      style: ElevatedButton.styleFrom(primary: Colors.red),
    );
  }
}
