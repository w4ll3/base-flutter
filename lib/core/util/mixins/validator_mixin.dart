import 'dart:async';

mixin ValidatorMixin {
  static const int MIN_PW_LENGTH = 6;
  static const int MAX_PW_LENGTH = 12;
  static final RegExp blockEmojiRegExp = RegExp(
    r'(\u00a9|\u00ae|[\u2000-\u3300]|\ud83c[\ud000-\udfff]|\ud83d[\ud000-\udfff]|\ud83e[\ud000-\udfff])',
  );
  static final emailRegExp = RegExp(
    r'^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );

  final emailValidator = StreamTransformer<String, String>.fromHandlers(
    handleData: (email, sink) {
      if (emailRegExp.hasMatch(email) && !blockEmojiRegExp.hasMatch(email)) {
        sink.add(email);
      } else if (email.isEmpty) {
        sink.addError(null);
      } else {
        sink.addError('error.invalidUsername');
      }
    },
  );

  final actionValidator =
      (Function action) => StreamTransformer<bool, Function>.fromHandlers(
            handleData: (value, sink) {
              if (value) {
                sink.add(action);
              } else {
                sink.add(null);
              }
            },
          );

  final lenghtValidator = ({int min = 0, int max = 65535}) =>
      StreamTransformer<String, String>.fromHandlers(
        handleData: (value, sink) {
          if (_interval(value, min, max)) {
            sink.add(value);
          } else if (value.isEmpty) {
            sink.addError(null);
          } else {
            sink.addError('^error.length|{"min": "$min", "max": "$max"}');
          }
        },
      );

  static bool _interval(String value, int min, int max) {
    final biggerThanMin = value.length - min;
    final smallerThanMax = max - value.length;
    return biggerThanMin * smallerThanMax >= 0;
  }
}
