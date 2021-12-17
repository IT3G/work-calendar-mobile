import 'dart:async';

Function(String value) debounce(Function(String value) callback) {
  Timer timer = Timer(Duration.zero, () {});

  return (String value) {
    if (timer.isActive) {
      timer.cancel();
    }

    timer = Timer(
    const Duration(milliseconds: 600), 
    () {
      callback(value);
    });
  };
}