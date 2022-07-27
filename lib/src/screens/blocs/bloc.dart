import 'dart:async';
import 'validator.dart';

class Bloc with Validator {
  final _emailController = StreamController<String>();
  final _passwordController = StreamController<String>();
  // add to stream
  get changeEmail => _emailController.sink.add;
  get changePassword => _passwordController.sink.add;
  // access to stream
  get emailvalidation => _emailController.stream.transform(validateEmail);
  get passwordvalidation =>
      _passwordController.stream.transform(validatePassword);

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}

final bloc = Bloc();
