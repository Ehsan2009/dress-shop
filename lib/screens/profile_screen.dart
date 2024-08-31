import 'package:flutter/material.dart';
import 'package:shop_app/components/my_row.dart';
import 'package:shop_app/components/profile_information_container.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_vert_rounded),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Container(
                width: 180,
                height: 180,
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
              const SizedBox(height: 25),
              const Text(
                'Ehsan Javdan',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'ehsanjavdan77@gmail.com',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProfileInformationContainer(
                    icon: Icons.shopping_bag_rounded,
                    color: Colors.red,
                    borderColor: Colors.red[100]!,
                    title: 'Progress',
                    input: '10+',
                  ),
                  ProfileInformationContainer(
                    icon: Icons.add_shopping_cart_outlined,
                    color: Colors.blue,
                    borderColor: Colors.blue[100]!,
                    title: 'Promocode',
                    input: '5',
                  ),
                  ProfileInformationContainer(
                    icon: Icons.shopping_bag_rounded,
                    color: Colors.yellow,
                    borderColor: Colors.yellow[100]!,
                    title: 'Reviews',
                    input: '4.5K',
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Personal Information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Divider(),
              ),
              const MyRow(text: 'Name:', textLeading: 'Ehsan Javdan',),
              const MyRow(text: 'Email:', textLeading: 'ehsanjavdan77@gmail.com',),
              const MyRow(text: 'Location:', textLeading: 'Earth',),
              const MyRow(text: 'Zip Code:', textLeading: '1200',),
            ],
          ),
        ),
      ),
    );
  }
}
