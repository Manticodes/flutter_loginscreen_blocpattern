import 'package:flutter/material.dart';
import 'blocs/bloc.dart';
import '../screens/blocs/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      appBar: AppBar(title: Text('Log me in ')),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(children: [
          emailField(bloc),
          passwordField(bloc),
          SizedBox(
            height: 20,
          ),
          submitbutton(),
        ]),
      ),
    );
  }

  emailField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.emailvalidation,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changeEmail,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            hintText: 'you@example.com',
            labelText: 'Email Address',
            hintStyle: TextStyle(color: Colors.grey),
            errorText:
                snapshot.error != null ? snapshot.error.toString() : null,
          ),
        );
      },
    );
  }

  passwordField(Bloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordvalidation,
      builder: (context, snapshot) {
        return TextField(
          onChanged: bloc.changePassword,
          obscureText: false,
          decoration: InputDecoration(
              hintText: 'use strong password',
              labelText: 'Password',
              errorText:
                  snapshot.error != null ? snapshot.error.toString() : null),
        );
      },
    );
  }

  submitbutton(Bloc bloc) {
    return StreamBuilder(stream:bloc.submitValid ,builder: (context , snapshot){},)
  }
}
