import 'package:flutter/material.dart';

class CustomSliderThumbShape extends SliderComponentShape {
  final double thumbRadius;

  CustomSliderThumbShape({this.thumbRadius = 8.0});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {Animation<double>? activationAnimation,
        Animation<double>? enableAnimation,
        bool? isDiscrete,
        TextPainter? labelPainter,
        RenderBox? parentBox,
        SliderThemeData? sliderTheme,
        TextDirection? textDirection,
        double? value,
        double? textScaleFactor,
        Size? sizeWithOverflow}) {
    final Canvas canvas = context.canvas;

    // Customize thumb painting
    final paint = Paint()
      ..color = sliderTheme!.thumbColor!
      ..style = PaintingStyle.fill;

    canvas.drawCircle(center, thumbRadius, paint);
  }
}

