import 'package:flutter/material.dart';
import 'package:shop_app/components/icon_container.dart';

class ProfileInformationContainer extends StatelessWidget {
  const ProfileInformationContainer({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
    required this.input,
    required this.borderColor,
  });

  final IconData icon;
  final Color color;
  final Color borderColor;
  final String title;
  final String input;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          IconContainer(
            icon: icon,
            color: color,
            borderColor: borderColor,
          ),
          const SizedBox(height: 8),
          Text(title),
          const SizedBox(height: 8),
          Text(
            input,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
