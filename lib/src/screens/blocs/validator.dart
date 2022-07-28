import 'dart:async';
import 'dart:math';

class Validator {
  final validateEmail = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.contains('@') && data.contains('.')) {
        sink.add(data);
      } else {
        sink.addError('Enter Valid emaill');
      }
    },
  );
  final validatePassword = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.length > 3) {
        sink.add(data);
      } else {
        sink.addError('Password is too short');
      }
    },
  );
  final validateText = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      sink.add(data);
    },
  );
}
