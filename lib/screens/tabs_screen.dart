import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen(this.navigationShell ,{super.key});

  final StatefulNavigationShell navigationShell;

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  void onTap(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: widget.navigationShell,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        elevation: 6,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                onTap(0);
              },
              icon: const Icon(Icons.home),
              color: widget.navigationShell.currentIndex == 0 ? Colors.redAccent : Colors.grey[600],
            ),
            IconButton(
              onPressed: () {
                onTap(1);
              },
              icon: const Icon(Icons.shopping_cart),
              color: widget.navigationShell.currentIndex == 1 ? Colors.redAccent : Colors.grey[600],
            ),
            IconButton(
              onPressed: () {
                onTap(2);
              },
              icon: const Icon(Icons.favorite),
              color: widget.navigationShell.currentIndex == 2 ? Colors.redAccent : Colors.grey[600],
            ),
            IconButton(
              onPressed: () {
                onTap(3);
              },
              icon: const Icon(Icons.person),
              color: widget.navigationShell.currentIndex == 3 ? Colors.redAccent : Colors.grey[600],
            ),
          ],
        ),
      ),
    );
  }
}
