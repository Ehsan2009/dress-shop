import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasData) {
          // Navigate to TabsScreen if user is authenticated
          Future.microtask(() => context.go('/home_screen'));
        } else {
          // Navigate to IntroductionScreen if user is not authenticated
          Future.microtask(() => context.go('/introduction_screen'));
        }

        // While navigating, show an empty container
        return const Scaffold();
      },
    );
  }
}


// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:shop_app/screens/introduction_screen.dart';
// import 'package:shop_app/screens/tabs_screen.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (ctx, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('Shop App'),
//             ),
//           );
//         }

//         if (snapshot.hasData) {
//           return const TabsScreen();
//         }

//         return const IntroductionScreen();
//       },
//     );
//   }
// }
