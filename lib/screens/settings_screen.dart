import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shop_app/components/hidden_drawer.dart';
import 'package:shop_app/components/my_list_tile.dart';
import 'package:shop_app/provider/switch_button_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  final advancedDrawerController = AdvancedDrawerController();

  void drawerControl() {
    advancedDrawerController.showDrawer();
  }

  @override
  Widget build(BuildContext context) {
    bool notificationButtonValue = ref.watch(notificationProvider);
    bool updateButtonValue = ref.watch(updateProvider);

    return HiddenDrawer(
      isSelected: 'Settings',
      controller: advancedDrawerController,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: drawerControl,
            icon: const Icon(Icons.menu),
          ),
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Settings',
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          actions: const [
            SizedBox(width: 45),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: MyListTile(
                        onTap: () {},
                        icon: Icons.email,
                        title: 'Email Support',
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: MyListTile(
                        onTap: () {},
                        icon: Icons.error,
                        title: 'Faq',
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: MyListTile(
                        onTap: () {},
                        icon: Icons.lock,
                        title: 'Privacy Statements',
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: MyListTile(
                        onTap: () {},
                        icon: Icons.notifications,
                        title: 'Notification',
                      ),
                    ),
                    Switch(
                      value: notificationButtonValue,
                      onChanged: (isChecked) {
                        ref.read(notificationProvider.notifier).switchValue();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: MyListTile(
                        onTap: () {},
                        icon: Icons.upload_file_outlined,
                        title: 'Update',
                      ),
                    ),
                    Switch(
                      value: updateButtonValue,
                      onChanged: (isChecked) {
                        ref.read(updateProvider.notifier).switchValue();
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
