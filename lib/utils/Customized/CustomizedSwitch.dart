import 'package:flutter/material.dart';

class CustomizedSwitch extends StatefulWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final Color activeColor;
  final Color inactiveColor;
  final Color borderColor; // New property for border color
  final double borderWidth; // New property for border width
  final double width;
  final double height;

  CustomizedSwitch({
    required this.value,
    required this.onChanged,
    required this.activeColor,
    required this.inactiveColor,
    required this.borderColor,
    required this.borderWidth,
    this.width = 60.0,
    this.height = 34.0,
  });

  @override
  _CustomizedSwitchState createState() => _CustomizedSwitchState();
}

class _CustomizedSwitchState extends State<CustomizedSwitch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged!(!widget.value);
      },
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.height / 2),
          color: widget.value ? widget.activeColor : widget.inactiveColor,
          border: Border.all(
            color: widget.borderColor,
            width: widget.borderWidth,
          ),
          boxShadow: [
            BoxShadow(
              color: widget.value
                  ? widget.activeColor.withOpacity(0.5)
                  : widget.inactiveColor.withOpacity(0.5),
              blurRadius: 8.0,
              spreadRadius: 2.0,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: widget.value
              ? MainAxisAlignment.end
              : MainAxisAlignment.start,
          children: [
            Container(
              width: widget.height - 4,
              height: widget.height - 4,
              margin: EdgeInsets.all(2),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black12,
                  border: Border.all(
                    color: widget.borderColor,
                    width: widget.borderWidth,
                  ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 4.0,
                    spreadRadius: 1.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
