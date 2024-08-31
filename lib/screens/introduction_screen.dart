import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/components/my_button.dart';
import 'package:shop_app/components/page_view_item.dart';

class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({super.key});

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  final pageController = PageController(initialPage: 0);

  var currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Row(
              children: [
                Text('${currentPageIndex + 1}'),
                Text(
                  '/3',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {
              context.go('/auth_screen');
            },
            child: const Text(
              'Skip',
              style: TextStyle(
                color: Colors.redAccent,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPageIndex = index;
                });
              },
              children: const [
                PageViewItem(
                  imageUrl: 'assets/images/image_3.png',
                  title: 'Choose Product',
                  content:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
                ),
                PageViewItem(
                  imageUrl: 'assets/images/image_3.png',
                  title: 'Make Payment',
                  content:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
                ),
                PageViewItem(
                  imageUrl: 'assets/images/image_3.png',
                  title: 'Get Your Order',
                  content:
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod',
                ),
              ],
            ),
          ),
          MyButton(
            width: 220,
            onPressed: () {
              if (currentPageIndex == 2) {
                context.go('/auth_screen');
              }
              pageController.animateToPage(
                currentPageIndex + 1,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            text: 'Next',
            enableIcon: true,
          ),
        ],
      ),
    );
  }
}
