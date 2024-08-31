import 'package:go_router/go_router.dart';
import 'package:shop_app/model/cloth.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/details_screen.dart';
import 'package:shop_app/screens/favorite_screen.dart';
import 'package:shop_app/screens/home_screen.dart';
import 'package:shop_app/screens/auth_screen.dart';
import 'package:shop_app/screens/order_screen.dart';
import 'package:shop_app/screens/profile_screen.dart';
import 'package:shop_app/screens/settings_screen.dart';
import 'package:shop_app/screens/splash_screen.dart';
import 'package:shop_app/screens/tabs_screen.dart';
import 'package:shop_app/screens/wallet_screen.dart';
import 'package:flutter/material.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _sectionNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/auth_screen',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/wallet_screen',
      builder: (context, state) => const WalletScreen(),
    ),
    GoRoute(
      path: '/order_screen',
      builder: (context, state) => const OrderScreen(),
    ),
    GoRoute(
      path: '/settings_screen',
      builder: (context, state) => const SettingsScreen(),
    ),
    GoRoute(
      path: '/details_screen',
      builder: (context, state) {
        final cloth = state.extra as Cloth;
        return DetailsScreen(cloth: cloth);
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return TabsScreen(navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _sectionNavigatorKey,
          routes: [
            GoRoute(
              path: '/home_screen',
              builder: (context, state) => const HomeScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/cart_screen',
              builder: (context, state) => const CartScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/favorite_screen',
              builder: (context, state) => const FavoriteScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile_screen',
              builder: (context, state) => const ProfileScreen(),
            ),
          ],
        ),
      ],
    ),
    // ShellRoute(
    //   builder: (context, state, child) {
    //     return const TabsScreen();
    //   },
    //   routes: [
    //     GoRoute(
    //       path: '/home_screen',
    //       builder: (context, state) => const HomeScreen(),
    //     ),
    //     GoRoute(
    //       path: '/favorite_screen',
    //       builder: (context, state) => const FavoriteScreen(),
    //     ),
    //     GoRoute(
    //       path: '/cart_screen',
    //       builder: (context, state) => const CartScreen(),
    //     ),
    //     GoRoute(
    //       path: '/profile_screen',
    //       builder: (context, state) => const ProfileScreen(),
    //     ),
    //   ],
    // ),
  ],
);
