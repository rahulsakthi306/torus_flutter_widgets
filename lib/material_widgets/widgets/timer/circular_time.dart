import 'package:flutter/material.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';

class CircularTime extends StatefulWidget {
  const CircularTime({super.key, this.title});

  final String? title;

  @override
  State<CircularTime> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<CircularTime> {
  final int _duration = 10;
  final CountDownController _controller = CountDownController();

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: _duration,
      initialDuration: 0,
      controller: _controller,
      width: MediaQuery.of(context).size.width / 2,
      height: MediaQuery.of(context).size.height / 2,
      ringColor: Colors.grey[300]!,
      ringGradient: null,
      fillColor: Colors.purpleAccent[100]!,
      fillGradient: null,
      backgroundColor: Colors.purple[500],
      backgroundGradient: null,
      strokeWidth: 20.0,
      strokeCap: StrokeCap.round,
      textStyle: const TextStyle(
        fontSize: 33.0,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
      textFormat: CountdownTextFormat.S,
      isReverse: false,
      isReverseAnimation: false,
      isTimerTextShown: true,
      autoStart: true,
      // onStart: () {
      //   debugPrint('Countdown Started');
      // },
      // onComplete: () {
      //   debugPrint('Countdown Ended');
      // },
      // onChange: (String timeStamp) {
      //   debugPrint('Countdown Changed $timeStamp');
      // },
    );
  }
}
