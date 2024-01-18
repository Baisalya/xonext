import 'dart:ui';

import 'package:flutter/material.dart';

class BlurredCircleBackground extends StatefulWidget {
  final bool isDark;

  BlurredCircleBackground({required this.isDark});

  @override
  _BlurredCircleBackgroundState createState() =>
      _BlurredCircleBackgroundState();
}

class _BlurredCircleBackgroundState extends State<BlurredCircleBackground>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 1000),
      vsync: this,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: widget.isDark ? Colors.black : Colors.white,
        ),
        Positioned.fill(
          child: AnimatedBuilder(
            animation: _rotationController,
            builder: (context, child) {
              return Transform.rotate(
                angle: _rotationController.value * 2 * 3.1415,
                child: child,
              );
            },
            child: Stack(
              children: [
                _buildCircle(Colors.blue.withOpacity(0.8), size: 200, alignment: Alignment(0.4, 0.4)),
                _buildCircle(Colors.red.withOpacity(0.7), size: 180, alignment: Alignment(0.3, -0.1)),
                _buildCircle(Colors.purple.withOpacity(0.6), size: 220, alignment: Alignment(0.2, -0.1)),
                _buildCircle(Colors.yellow.withOpacity(0.9), size: 250, alignment: Alignment(0.1, 0.2)),
              ],
            ),
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 75, sigmaY: 85,tileMode: TileMode.repeated),
          child: Container(
            color: Colors.transparent,
          ),
        ),
      ],
    );
  }

  Widget _buildCircle(Color color, {double size = 300, Alignment alignment = Alignment.center}) {
    return Positioned(
      left: MediaQuery.of(context).size.width * alignment.x,
      top: MediaQuery.of(context).size.height * alignment.y,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          gradient: LinearGradient(
            colors: [color, color.withOpacity(0.5)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 10,
              offset: Offset(0, 2),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _rotationController.dispose();
    super.dispose();
  }
}
