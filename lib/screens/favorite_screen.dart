import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/components/cloth_container.dart';
import 'package:shop_app/model/cloth.dart';
import 'package:shop_app/provider/favorite_provider.dart';

class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Cloth> favoriteClothes = ref.watch(favoriteClothProvider);

    Widget mainContent = const Center(
      child: Text('There is no cloth here, Add some!'),
    );

    if (favoriteClothes.isNotEmpty) {
      mainContent = GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 2 / 3,
          crossAxisCount: 2,
        ),
        itemCount: favoriteClothes.length,
        itemBuilder: (ctx, index) {
          return ClothContainer(
            cloth: favoriteClothes[index],
            favoriteScreen: true,
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Favorite'),
      ),
      body: mainContent,
    );
  }
}
