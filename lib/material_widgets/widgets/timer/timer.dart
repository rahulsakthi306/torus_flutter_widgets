import 'dart:async' as async;
import 'package:flutter/material.dart';

enum IconPosition {
  leftRight,
  rightLeft,
}

enum TimerMode {
  forward,
  backward,
}

// List<String> IconPosition = [ 'leftRight', 'rightLeft' ];

// List<String> TimerMode  = [ 'forward','backward' ];

class CountUpTimer extends StatefulWidget {
  final int seconds; 
  final IconData Icon;
  final bool showIcons;
  final IconPosition iconPosition;
  final bool startAutomatically;
  final VoidCallback? onTimerComplete;
  final int stepSeconds; 
  final TimerMode timerMode; 

  const CountUpTimer({
    super.key,
    this.seconds = 30,
    this.Icon = Icons.access_time,
    this.showIcons = true,
    this.iconPosition = IconPosition.leftRight,
    this.startAutomatically = true,
    this.onTimerComplete,
    this.stepSeconds = 1,
    this.timerMode = TimerMode.forward, 
  });

  @override
  State<CountUpTimer> createState() => _CountUpTimerState();
}

class _CountUpTimerState extends State<CountUpTimer> {
  late int _currentSeconds;
  async.Timer? _timer;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _currentSeconds = widget.timerMode == TimerMode.backward ? widget.seconds : 0;
    if (widget.startAutomatically) {
      _startTimer();
    }
  }

  @override
  void didUpdateWidget(covariant CountUpTimer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.seconds != widget.seconds) {
      _resetTimer();
      if (widget.startAutomatically) {
        _startTimer();
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    if (_isRunning) return;

    _timer = async.Timer.periodic(const Duration(seconds: 1), (timer) {
      if (widget.timerMode == TimerMode.forward) {
        if (_currentSeconds < widget.seconds) {
          setState(() => _currentSeconds++);
        } else {
          timer.cancel();
          setState(() => _isRunning = false);
          widget.onTimerComplete?.call();
        }
      } else if (widget.timerMode == TimerMode.backward) {
        if (_currentSeconds > 0) {
          setState(() => _currentSeconds--);
        } else {
          timer.cancel();
          setState(() => _isRunning = false);
          widget.onTimerComplete?.call();
        }
      }
    });

    setState(() {
      _isRunning = true;
    });
  }

  void _resetTimer() {
    _timer?.cancel();
    setState(() {
      _currentSeconds = widget.timerMode == TimerMode.backward ? widget.seconds : 0;
      _isRunning = false;
    });
  }

  void _adjustTime(int change) {
    setState(() {
      if (widget.timerMode == TimerMode.forward) {
        _currentSeconds = (_currentSeconds + change).clamp(0, widget.seconds);
      } else if (widget.timerMode == TimerMode.backward) {
        _currentSeconds = (_currentSeconds - change).clamp(0, widget.seconds);
      }
    });
  }

  String _formatTime(int totalSeconds) {
    final hours = totalSeconds ~/ 3600;
    final minutes = (totalSeconds % 3600) ~/ 60;
    final seconds = totalSeconds % 60;

    final parts = <String>[];
    if (hours > 0) parts.add("${hours}");
    if (minutes > 0 || hours > 0) parts.add("${minutes}");
    parts.add("${seconds}");

    return parts.join(' ');
  }

  @override
  Widget build(BuildContext context) {
    final icon = widget.showIcons
        ? Icon(widget.Icon, size: 32.0)
        : const SizedBox.shrink();

    final timeText = Text(
      _formatTime(_currentSeconds),
      style: const TextStyle(fontSize: 32.0),
    );

    final row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
 children: widget.iconPosition == IconPosition.leftRight
          ? [icon, timeText]
          : [timeText, icon],
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        GestureDetector(
          onTap: () {
            if ((_currentSeconds >= widget.seconds && widget.timerMode == TimerMode.forward) || 
                (_currentSeconds <= 0 && widget.timerMode == TimerMode.backward)) {
              _resetTimer();
            } else {
              _startTimer();
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
            child: row,
          ),
        ),
      
      ],
    );
  }
}