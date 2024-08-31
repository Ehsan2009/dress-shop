import 'package:flutter/material.dart';

class PageViewItem extends StatefulWidget {
  const PageViewItem({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.content,
  });

  final String imageUrl;
  final String title;
  final String content;

  @override
  State<PageViewItem> createState() => _PageViewItemState();
}

class _PageViewItemState extends State<PageViewItem> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 40, right: 40, bottom: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset(widget.imageUrl),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: TextStyle(
                color: Colors.green.shade800,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.content,
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey[500],
              ),
              softWrap: true,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
