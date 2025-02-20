// import 'package:animations/animations.dart';
// import 'package:flutter/material.dart';

// class PageTransition {
//   static pageTransition(Widget screen) {
//     return PageRouteBuilder(
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         var begin = 0.0;
//         var end = 1.0;
//         var curve = Curves.easeInOutBack;

//         var tween =
//             Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//         return FadeTransition(
//           opacity: animation.drive(tween),
//           child: child,
//         );
//       },
//       pageBuilder: (context, animation, secondaryAnimation) => screen,
//     );
//   }

//   static Widget transition(Widget child) {
//     return PageTransitionSwitcher(
//       duration: const Duration(milliseconds: 800),
//       reverse: false,
//       transitionBuilder: (
//         Widget child,
//         Animation<double> animation,
//         Animation<double> secondaryAnimation,
//       ) {
//         return SharedAxisTransition(
//           animation: animation,
//           secondaryAnimation: secondaryAnimation,
//           transitionType: SharedAxisTransitionType.scaled,
//           child: child,
//         );
//       },
//       child: child,
//     );
//   }
// }
