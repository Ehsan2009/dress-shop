import 'package:flutter/material.dart';
import 'package:shop_app/components/category_container.dart';
import 'package:shop_app/components/my_button.dart';

class Filter extends StatefulWidget {
  const Filter({super.key});

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  String selectedCategory = 'New Arrival';

  RangeValues pricingValues = const RangeValues(0.1, 0.5);
  RangeValues distanceValues = const RangeValues(0.1, 0.8);

  @override
  Widget build(BuildContext context) {
    List<String> categories = [
      'New Arrival',
      'Top Trending',
      'Featured Products',
    ];

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Clear',
                  style: TextStyle(
                    color: Colors.redAccent,
                  ),
                ),
                const Text(
                  'Filters',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                    color: Colors.grey,
                      shape: BoxShape.circle
                    ),
                    child: const Icon(
                      Icons.highlight_remove_sharp,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Category',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (ctx, index) {
                  return CategoryContainer(
                    onPressed: () {
                      setState(() {
                        selectedCategory = categories[index];
                      });
                    },
                    text: categories[index],
                    isSelected: selectedCategory == categories[index],
                  );
                },
              ),
            ),
            const SizedBox(height: 30),
            Row(
              children: [
                const Text(
                  'Pricing',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '\$500 - \$200',
                  style: TextStyle(color: Colors.grey[600]),
                )
              ],
            ),
            RangeSlider(
              values: pricingValues,
              onChanged: (newValues) {
                setState(() {
                  pricingValues = newValues;
                });
              },
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const Text(
                  'Distance',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Text(
                  '\$500 - \$200',
                  style: TextStyle(color: Colors.grey[600]),
                ),
              ],
            ),
            RangeSlider(
              values: distanceValues,
              onChanged: (newValues) {
                setState(() {
                  distanceValues = newValues;
                });
              },
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.center,
              child: MyButton(
                onPressed: () {},
                text: 'Apply Filter',
                enableIcon: false,
                width: 220,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
