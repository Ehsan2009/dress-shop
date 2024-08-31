import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/components/my_list_tile.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({
    super.key,
    required this.child,
    required this.controller,
    required this.isSelected,
  });

  final Widget child;
  final AdvancedDrawerController controller;
  final String isSelected;

  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  late String isSelected;

  @override
  void initState() {
    isSelected = widget.isSelected;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      controller: widget.controller,
      openRatio: 0.6,
      openScale: 0.7,
      drawer: Padding(
        padding: const EdgeInsets.only(top: 40, left: 12),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                width: 100,
                height: 100,
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.redAccent,
                ),
                child: Image.asset(
                  'assets/images/ehsan.jpg',
                  fit: BoxFit.cover,
                ),
              ),
                const SizedBox(width: 8),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ehsan Javdan',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text('Flutter Developer'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: MyListTile(
                onTap: () {
                  context.go('/');
                  setState(() {
                    isSelected = 'Home';
                  });
                },
                icon: Icons.home,
                title: 'Home',
                isSelected: isSelected,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: MyListTile(
                onTap: () {
                  context.go('/wallet_screen');
                  setState(() {
                    isSelected = 'Wallet';
                  });
                },
                icon: Icons.wallet_outlined,
                title: 'Wallet',
                isSelected: isSelected,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: MyListTile(
                onTap: () {
                  context.go('/order_screen');
                  setState(() {
                    isSelected = 'My Orders';
                  });
                },
                icon: Icons.badge,
                title: 'My Orders',
                isSelected: isSelected,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: MyListTile(
                onTap: () {},
                icon: Icons.list_alt_rounded,
                title: 'About Us',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: MyListTile(
                onTap: () {},
                icon: Icons.lock,
                title: 'Privacy Policy',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: MyListTile(
                onTap: () {
                  context.go('/settings_screen');
                  setState(() {
                    isSelected = 'Settings';
                  });
                },
                icon: Icons.settings,
                title: 'Settings',
                isSelected: isSelected,
              ),
            ),
            const Spacer(),
            MyListTile(
              onTap: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icons.exit_to_app,
              title: 'Logout',
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Image.asset(
                  'assets/images/simple.png',
                  width: 100,
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
      child: widget.child,
    );
  }
}
