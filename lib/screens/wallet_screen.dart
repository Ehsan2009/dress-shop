import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:shop_app/components/cloth_card.dart';
import 'package:shop_app/components/hidden_drawer.dart';
import 'package:shop_app/model/cloth.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  final advancedDrawerController = AdvancedDrawerController();

  void drawerControl() {
    advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return HiddenDrawer(
      isSelected: 'Wallet',
      controller: advancedDrawerController,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          leading: IconButton(
            onPressed: drawerControl,
            icon: const Icon(Icons.menu),
          ),
          title: const Text(
            'My Wallets',
            style: TextStyle(fontSize: 20),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 14),
              child: Icon(Icons.more_vert_rounded),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 66, 60, 60),
                      Colors.black,
                    ],
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/card_logo.png',
                          width: 50,
                        ),
                        const Spacer(),
                        const Text(
                          'Trust Bank',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '5432',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          '5432',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          '5432',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 16),
                        Text(
                          '5432',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        SizedBox(width: 16),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Row(
                      children: [
                        Text(
                          'CARD HOLDER',
                          style: TextStyle(color: Colors.white),
                        ),
                        Spacer(),
                        Text(
                          'VALID THRU',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    const Row(
                      children: [
                        Text(
                          'EHSAN JAVDAN',
                          style: TextStyle(color: Colors.white),
                        ),
                        Spacer(),
                        Text(
                          '02/2022',
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Recent Transactions',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const ClothCard(
                cloth: Cloth(
                  clothId: 'b1',
                  clothName: 'Casual Shirts',
                  clothPrice: 250,
                  clothUrl: 'assets/images/product_2.png',
                ),
                cartScreen: false,
              ),
              const ClothCard(
                cloth: Cloth(
                  clothId: 'b2',
                  clothName: 'Casual Shirts',
                  clothPrice: 250,
                  clothUrl: 'assets/images/product_2.png',
                ),
                cartScreen: false,
              ),
              const ClothCard(
                cloth: Cloth(
                  clothId: 'b3',
                  clothName: 'Casual Shirts',
                  clothPrice: 250,
                  clothUrl: 'assets/images/product_2.png',
                ),
                cartScreen: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
