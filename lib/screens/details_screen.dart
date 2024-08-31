import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/components/circle_container.dart';
import 'package:shop_app/components/my_button.dart';
import 'package:shop_app/model/cloth.dart';
import 'package:shop_app/provider/cart_provider.dart';
import 'package:shop_app/provider/favorite_provider.dart';

class DetailsScreen extends ConsumerStatefulWidget {
  const DetailsScreen({
    super.key,
    required this.cloth,
  });

  final Cloth cloth;

  @override
  ConsumerState<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends ConsumerState<DetailsScreen> {
  Color selectedColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    final isLiked = ref.watch(favoriteClothProvider).contains(widget.cloth);
    final isInCart = ref.watch(cartClothProvider).contains(widget.cloth);

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 400,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
            decoration: BoxDecoration(
              color: Colors.brown[200],
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 231, 168, 84),
                  Color.fromARGB(255, 109, 67, 13),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
                bottomRight: Radius.circular(50),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
                Hero(
                  tag: widget.cloth.clothId,
                  child: Image.asset(widget.cloth.clothUrl),
                ),
                IconButton(
                  onPressed: () {
                    ref
                        .read(favoriteClothProvider.notifier)
                        .favoriteClothStatus(widget.cloth);
                  },
                  icon: isLiked
                      ? const Icon(Icons.favorite, color: Colors.red)
                      : const Icon(Icons.favorite_border),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Text(
                        'Casual Henley Shirts',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        '\$175',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua Egestas purus viverra accumsan in nisl nisi',
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Colors',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      CircleContainer(
                        onPressed: () {
                          setState(() {
                            selectedColor = Colors.blue;
                          });
                        },
                        color: Colors.blue,
                        borderColor: Colors.blue[100]!,
                        isSelected: selectedColor == Colors.blue,
                      ),
                      CircleContainer(
                        onPressed: () {
                          setState(() {
                            selectedColor = Colors.red;
                          });
                        },
                        color: Colors.red,
                        borderColor: Colors.red[100]!,
                        isSelected: selectedColor == Colors.red,
                      ),
                      CircleContainer(
                        onPressed: () {
                          setState(() {
                            selectedColor = Colors.green;
                          });
                        },
                        color: Colors.green,
                        borderColor: Colors.green[100]!,
                        isSelected: selectedColor == Colors.green,
                      ),
                      CircleContainer(
                        onPressed: () {
                          setState(() {
                            selectedColor = Colors.brown;
                          });
                        },
                        color: Colors.brown,
                        borderColor: Colors.brown[100]!,
                        isSelected: selectedColor == Colors.brown,
                      ),
                    ],
                  ),
                  const Spacer(),
                  Align(
                    alignment: Alignment.center,
                    child: MyButton(
                      width: 300,
                      onPressed: () {
                        ref
                            .read(cartClothProvider.notifier)
                            .cartClothStatus(widget.cloth);
                      },
                      text: isInCart ? 'Remove from cart' : 'Add to cart',
                      enableIcon: false,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
