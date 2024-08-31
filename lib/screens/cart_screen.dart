import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/components/cloth_card.dart';
import 'package:shop_app/components/my_button.dart';
import 'package:shop_app/components/my_row.dart';
import 'package:shop_app/model/cloth.dart';
import 'package:shop_app/provider/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  int clothesAmount(List<Cloth> clothes) {
    var totalAmount = 0;

    for (final cloth in clothes) {
      totalAmount += cloth.clothPrice;
    }

    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    List<Cloth> cartClothes = ref.watch(cartClothProvider);

    Widget mainContent = const Center(
      child: Text('There is no cloth here, Add some!'),
    );

    if (cartClothes.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: cartClothes.length,
                itemBuilder: (ctx, index) {
                  return ClothCard(
                    cloth: cartClothes[index],
                    cartScreen: true,
                  );
                },
              ),
            ),
            MyRow(
              text: 'Subtotal:',
              textLeading: '\$${clothesAmount(cartClothes)}',
            ),
            MyButton(
              onPressed: () {},
              text: 'Checkout',
              enableIcon: false,
              width: 220,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('My Cart'),
      ),
      body: mainContent,
    );
  }
}
