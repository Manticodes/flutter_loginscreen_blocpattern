import 'package:flutter/material.dart';

import 'package:flutter_loginscreen_blocpattern/src/screens/loginscreen.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  build(context) => MaterialApp(
        title: 'Log me in ',
        home: LoginScreen(),
      );
}
