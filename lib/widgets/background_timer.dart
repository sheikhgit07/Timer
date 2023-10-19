import 'dart:async';

class BackgroundTimer {
  DateTime? startTime;
  Timer? _timer;
  int elapsedSeconds = 0;

  void start() {
    startTime = DateTime.now();
    _timer = Timer.periodic(Duration(seconds: 1), (_) {
      final currentTime = DateTime.now();
      elapsedSeconds = currentTime.difference(startTime!).inSeconds;
    });
  }

  void stop() {
    _timer?.cancel();
  }

  int getElapsedMinutes() {
    return elapsedSeconds ~/ 60;
  }
}
