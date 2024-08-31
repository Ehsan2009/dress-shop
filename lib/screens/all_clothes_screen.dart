import 'package:flutter/material.dart';
import 'package:shop_app/components/cloth_container.dart';
import 'package:shop_app/components/filter.dart';
import 'package:shop_app/data/cloth.dart';

class AllClothesScreen extends StatelessWidget {
  const AllClothesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on_outlined),
            Text(
              '15/2 New Texas',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 14),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  const Icon(Icons.search),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        labelText: 'Search items...',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (ctx) {
                          return const Filter();
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Colors.redAccent,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Image.asset(
                        'assets/icons/filter.png',
                        width: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Expanded(
                  child: ListTile(
                    title: Text(
                      'Recent Searches',
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
            const Divider(),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 2 / 3.1,
                  crossAxisCount: 2,
                ),
                itemCount: clothes.length,
                itemBuilder: (ctx, index) {
                  return ClothContainer(
                    cloth: clothes[index],
                    favoriteScreen: true,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
