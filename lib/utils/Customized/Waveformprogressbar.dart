import 'dart:math';

import 'package:flutter/material.dart';

class WaveformProgressBar extends StatefulWidget {
  final double progress;
  final int totalBars;
  final double barSpacing;

  const WaveformProgressBar({
    Key? key,
    required this.progress,
    required this.totalBars,
    required this.barSpacing,
  }) : super(key: key);

  @override
  _WaveformProgressBarState createState() => _WaveformProgressBarState();
}

class _WaveformProgressBarState extends State<WaveformProgressBar> {
  bool _isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          child: IconButton(
           iconSize: 29,
            icon: Icon(_isPlaying ? Icons.pause : Icons.play_arrow),
            onPressed: () {
              setState(() {
                _isPlaying = !_isPlaying;
              });
            },
          ),
        ),
        CustomPaint(
          size: Size(200, 30), // Size of the waveform progress bar
          painter: WaveformPainter(
            progress: widget.progress,
            totalBars: widget.totalBars,
            barSpacing: widget.barSpacing,
          ),
        ),
      ],
    );
  }
}

class WaveformPainter extends CustomPainter {
  final double progress;
  final int totalBars;
  final double barSpacing;

  WaveformPainter({
    required this.progress,
    required this.totalBars,
    required this.barSpacing,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final barWidth = (size.width - (barSpacing * (totalBars - 1))) / totalBars;
    final barHeight = size.height;

    final waveAmplitude = size.height / 0.8;
    final waveFrequency = 4.0 * pi / size.width;
    final wavePhase = 0.0;

    for (var i = 0; i < totalBars; i++) {
      final barX = i * (barWidth + barSpacing);
      final barCenterX = barX + barWidth / 2;
      final barProgress = barCenterX / size.width;
      final waveOffset = sin(waveFrequency * barCenterX + wavePhase) * waveAmplitude;
      final barHeightScaled = (waveOffset.abs() + barHeight / 4).clamp(0, barHeight);

      final barPaint = Paint()
        ..color = barProgress <= progress ? Colors.blue : Colors.grey
        ..style = PaintingStyle.fill;

      canvas.drawRRect(
        RRect.fromRectAndRadius(
          Rect.fromLTRB(barX, size.height / 2 - barHeightScaled / 2, barX + barWidth, size.height / 2 + barHeightScaled / 2),
          Radius.circular(4),
        ),
        barPaint,
      );
    }
  }

  @override
  bool shouldRepaint(WaveformPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

