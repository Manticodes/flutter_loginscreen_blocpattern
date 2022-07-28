import 'bloc.dart';
import 'package:flutter/material.dart';

class Provider extends InheritedWidget {
  Provider({Key? key, required Widget child}) : super(key: key, child: child);
  bool updateShouldNotify(_) => true;
  final bloc = Bloc();
  static Bloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<Provider>() as Provider)
        .bloc;
  }
}
