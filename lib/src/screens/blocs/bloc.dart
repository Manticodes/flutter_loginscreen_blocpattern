import 'dart:async';
import 'validator.dart';
import 'package:rxdart/rxdart.dart';

class Bloc with Validator {
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _textController = BehaviorSubject<String>();
  // add to stream
  Function(String) get reciveText => _textController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  // access to stream
  Stream<String> get emailvalidation =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get passwordvalidation =>
      _passwordController.stream.transform(validatePassword);
  Stream<bool> get submitValid =>
      Rx.combineLatest2(emailvalidation, passwordvalidation, (a, b) => true);

  Stream<String> get accesstext =>
      _textController.stream.transform(validateText);

  submit() {
    final validemail = _emailController.value;
    final validpass = _passwordController.value;
    reciveText('user name : $validemail \n pass : $validpass ');
    print('all valid');
  }

  dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
// this line removed because im implementing bloc with provider
//final bloc = Bloc();
