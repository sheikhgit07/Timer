import 'package:flutter/material.dart';
import 'package:loc_it/utilites/colors.dart';

class CircularRadioButton extends StatefulWidget {
  final bool isSelected;
  final Function(bool) onChanged;
  final double? width;
  final double? height;
  final Color? selectedColor;
  final Color? borderColor;

  CircularRadioButton({
    required this.isSelected,
    required this.onChanged,
    this.width,
    this.height,
    this.selectedColor,
    this.borderColor,
  });

  @override
  _CircularRadioButtonState createState() => _CircularRadioButtonState();
}

class _CircularRadioButtonState extends State<CircularRadioButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.isSelected);
      },
      child: Container(
        width: widget.width ?? 24, // Adjust size as needed
        height: widget.height ?? 24,

        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.transparent,
          border: Border.all(
            color: widget.borderColor ?? blackColor,
            width: 2,
          ),
        ),
        child: widget.isSelected
            ? Container(
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.isSelected
                      ? widget.selectedColor ?? blackColor
                      : Colors.transparent,
                ),
              )
            : null,
      ),
    );
  }
}
