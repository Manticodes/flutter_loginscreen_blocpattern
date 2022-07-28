import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validator {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();
  // add to stream
  Function(String) get changeEmail => _emailController.sink.add;
  get changePassword => _passwordController.sink.add;
  // access to stream
  Stream<String> get emailvalidation =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get passwordvalidation =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(emailvalidation, passwordvalidation, (e, p) => true);

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
// this line removed because im implementing bloc with provider
//final bloc = Bloc();
