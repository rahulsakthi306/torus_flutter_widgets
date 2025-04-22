import 'dart:async' as async;
import 'package:flutter/material.dart';

enum IconPosition {
  leftRight,
  rightLeft,
}

class CountUpTimer extends StatefulWidget {
  final int seconds; // Target time in seconds
  final IconData leftIcon;
  final bool showIcons;
  final IconPosition iconPosition;
  final bool startAutomatically;

  const CountUpTimer({
    super.key,
    this.seconds = 60,
    this.leftIcon = Icons.access_time,
    this.showIcons = true,
    this.iconPosition = IconPosition.leftRight,
    this.startAutomatically = true,
  });

  @override
  State<CountUpTimer> createState() => _CountUpTimerState();
}

class _CountUpTimerState extends State<CountUpTimer> {
  late int _currentSeconds;
  async.Timer? _countUpTimer;
  bool _isRunning = false;

  @override
  void initState() {
    super.initState();
    _currentSeconds = 0;
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
    _countUpTimer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    if (_isRunning || _currentSeconds >= widget.seconds) return;

    _countUpTimer = async.Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_currentSeconds < widget.seconds) {
        setState(() {
          _currentSeconds++;
        });
      } else {
        timer.cancel();
        setState(() => _isRunning = false);
      }
    });

    setState(() {
      _isRunning = true;
    });
  }

  void _resetTimer() {
    _countUpTimer?.cancel();
    setState(() {
      _currentSeconds = 0;
      _isRunning = false;
    });
  }

  String _formatTimeUnit(int unit) => unit.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    // Format the current seconds
    final timeText = Text(
      _formatTimeUnit(_currentSeconds),
      style: const TextStyle(fontSize: 32.0),
    );

    // Determine which icon to show based on the iconPosition and showIcons flag
    final icon = widget.showIcons
        ? Icon(widget.leftIcon, size: 32.0)
        : const SizedBox.shrink();

    // Create the layout based on iconPosition
    final row = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: widget.iconPosition == IconPosition.leftRight
          ? [icon, timeText]
          : [timeText, icon],
    );

    return GestureDetector(
      onTap: () {
        if (_currentSeconds >= widget.seconds) {
          _resetTimer();
        } else {
          _startTimer();
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
        child: row,
      ),
    );
  }
}
