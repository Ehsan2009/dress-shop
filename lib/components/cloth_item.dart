import 'package:flutter/material.dart';

class ClothItem extends StatelessWidget {
  const ClothItem({
    super.key,
    required this.clothUrl,
    required this.clothName,
  });

  final String clothUrl;
  final String clothName;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Image.asset(clothUrl, width: 70,),
          Text(clothName),
        ],
      ),
    );
  }
}
