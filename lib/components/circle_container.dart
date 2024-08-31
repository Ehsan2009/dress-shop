import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer({
    super.key,
    required this.onPressed,
    required this.color,
    required this.borderColor,
    required this.isSelected,
  });

  final void Function() onPressed;
  final Color color;
  final Color borderColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 20,
        height: 20,
        margin: const EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: color,
          border: isSelected
              ? Border.all(
                  color: borderColor,
                  width: 3,
                )
              : null,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
