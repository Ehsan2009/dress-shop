import 'package:flutter/material.dart';

class MyRow extends StatelessWidget {
  const MyRow({
    super.key,
    required this.text,
    required this.textLeading,
  });

  final String text;
  final String textLeading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(color: Colors.grey[600]),
          ),
          const Spacer(),
          Text(
            textLeading,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
    );
  }
}
