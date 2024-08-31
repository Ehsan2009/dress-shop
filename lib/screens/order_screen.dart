import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:shop_app/components/cloth_card.dart';
import 'package:shop_app/components/hidden_drawer.dart';
import 'package:shop_app/model/cloth.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final advancedDrawerController = AdvancedDrawerController();

    void drawerControl() {
      advancedDrawerController.showDrawer();
    }

    return HiddenDrawer(
      isSelected: 'My Orders',
      controller: advancedDrawerController,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            bottom: const TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              tabs: [
                Tab(text: 'Completed'),
                Tab(
                  text: 'Cancelled',
                ),
              ],
            ),
            backgroundColor: Colors.white,
            leading: IconButton(
              onPressed: drawerControl,
              icon: const Icon(Icons.menu),
            ),
            title: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'My Orders',
                  style: TextStyle(fontSize: 20),
                ),
              ],
            ),
            actions: const [
              SizedBox(width: 45),
            ],
          ),
          body: const TabBarView(
            children: [
              Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    ClothCard(
                      cloth: Cloth(
                        clothId: 'c1',
                        clothName: 'Henley Shirts',
                        clothPrice: 250,
                        clothUrl: 'assets/images/product_0.png',
                      ),
                      cartScreen: false,
                    ),
                    ClothCard(
                      cloth: Cloth(
                        clothId: 'c2',
                        clothName: 'Casual Shirts',
                        clothPrice: 320,
                        clothUrl: 'assets/images/product_1.png',
                      ),
                      cartScreen: false,
                    ),
                    ClothCard(
                      cloth: Cloth(
                        clothId: 'c3',
                        clothName: 'Casual Nolin',
                        clothPrice: 165,
                        clothUrl: 'assets/images/product_2.png',
                      ),
                      cartScreen: false,
                    ),
                    ClothCard(
                      cloth: Cloth(
                        clothId: 'c4',
                        clothName: 'Casual T-Shirt',
                        clothPrice: 165,
                        clothUrl: 'assets/images/product_3.png',
                      ),
                      cartScreen: false,
                    ),
                  ],
                ),
              ),
              Center(
                child: Text('Orders That Are Cancelled Will Appear Here'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
