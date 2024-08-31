import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shop_app/model/cloth.dart';
import 'package:shop_app/provider/favorite_provider.dart';

class ClothContainer extends ConsumerStatefulWidget {
  const ClothContainer({
    super.key,
    required this.cloth,
    required this.favoriteScreen,
  });

  final Cloth cloth;
  final bool favoriteScreen;

  @override
  ConsumerState<ClothContainer> createState() => _ClothContainerState();
}

class _ClothContainerState extends ConsumerState<ClothContainer> {
  @override
  Widget build(BuildContext context) {
    final isLiked = ref.watch(favoriteClothProvider).contains(widget.cloth);



    return GestureDetector(
      onTap: () {
        context.push('/details_screen', extra: widget.cloth);
      },
      child: Card(
        margin: widget.favoriteScreen ? const EdgeInsets.all(16) : null,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20, right: 12, left: 12),
              padding: const EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  Hero(
                    tag: widget.cloth.clothId,
                    child: Image.asset(widget.cloth.clothUrl, width: 140),
                  ),
                  Positioned(
                    right: 2,
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          ref
                              .read(favoriteClothProvider.notifier)
                              .favoriteClothStatus(widget.cloth);
                        });
                      },
                      icon: isLiked
                          ? const Icon(Icons.favorite, color: Colors.redAccent)
                          : const Icon(Icons.favorite_border),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 5),
            Text(widget.cloth.clothName),
            Text(
              '\$${widget.cloth.clothPrice}',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
