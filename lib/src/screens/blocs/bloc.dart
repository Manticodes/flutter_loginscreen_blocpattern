import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validator {
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();
  final _textController = StreamController<String>.broadcast();
  // add to stream
  Function(String) get reciveText => _textController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  get changePassword => _passwordController.sink.add;
  // access to stream
  Stream<String> get emailvalidation =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get passwordvalidation =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid => Rx.combineLatest2(
        emailvalidation,
        passwordvalidation,
        (a, b) {
          if (a != null && b != null) {
            return true;
          } else {
            return false;
          }
        },
      );
  Stream<String> get accesstext =>
      _textController.stream.transform(validateText);

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
// this line removed because im implementing bloc with provider
//final bloc = Bloc();
