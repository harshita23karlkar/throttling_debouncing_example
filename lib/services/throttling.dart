import 'dart:async';

class Throttle {
  final Duration? duration;
  Timer? _timer;
  bool isReady = true;
  Throttle({this.duration});

  void call(Function action) {
    if (isReady) {
      isReady = false;
      action();
      _timer = Timer(duration ?? const Duration(seconds: 1), () {
        isReady = true;
      });
    }
  }
}
