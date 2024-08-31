import 'package:flutter/material.dart';
import 'package:shop_app/components/icon_container.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    super.key,
    required this.onTap,
    required this.icon,
    required this.title,
    this.isSelected,
  });

  final void Function() onTap;
  final IconData icon;
  final String title;
  final String? isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: IconContainer(icon: icon),
      title: Text(
        title,
        style: TextStyle(
          color: const Color.fromARGB(255, 10, 7, 7),
          fontWeight: isSelected == title ? FontWeight.bold : null,
        ),
      ),
    );
  }
}
