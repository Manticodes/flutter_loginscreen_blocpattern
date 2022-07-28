import 'package:flutter/material.dart';
import 'package:flutter_loginscreen_blocpattern/src/screens/blocs/provider.dart';

import 'package:flutter_loginscreen_blocpattern/src/screens/loginscreen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  build(context) {
    return Provider(
        key: key,
        child: MaterialApp(
          title: 'Log me in ',
          home: LoginScreen(),
        ));
  }
}
