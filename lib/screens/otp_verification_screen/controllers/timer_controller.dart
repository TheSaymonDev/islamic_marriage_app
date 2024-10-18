import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController{

  Duration duration = const Duration(minutes: 2, seconds: 30); // Initial duration
  late Timer timer;
  bool showResendButton = false;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      duration = duration > Duration.zero ? duration - const Duration(seconds: 1) : Duration.zero;
      update();
      if (duration == Duration.zero) {
        timer.cancel();
        showResendButton = true;
        update();
      }
    });
  }

  String getFormattedDuration() {
    // Get the remaining minutes and seconds
    int minutes = duration.inMinutes.remainder(60);
    int seconds = duration.inSeconds.remainder(60);
    // Format the duration
    String formattedMinutes = minutes < 10 ? '0$minutes' : '$minutes';
    String formattedSeconds = seconds < 10 ? '0$seconds' : '$seconds';
    return '$formattedMinutes:$formattedSeconds';
  }
}