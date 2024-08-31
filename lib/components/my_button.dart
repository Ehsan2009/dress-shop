import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.onPressed,
    required this.text,
    required this.enableIcon,
    required this.width,
    this.child,
  });

  final void Function() onPressed;
  final Widget? child;
  final String text;
  final bool enableIcon;
  final double width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.redAccent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (child != null)
              child!
            else
              Text(
                text,
                style: const TextStyle(color: Colors.white, fontSize: 16),
              ),
            if (enableIcon)
              const Icon(
                Icons.navigate_next_outlined,
                color: Colors.white,
              ),
          ],
        ),
      ),
    );
  }
}
