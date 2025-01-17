import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

class PageTransition {
  static pageTransition(screen) {
    return PageRouteBuilder(
      transitionDuration: const Duration(milliseconds: 800),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = const Offset(0, 1.0);
        var end = Offset.zero;
        var curve =
            const Cubic(0.25, 0.1, 0.25, 1.0); // Similar to CSS cubic-bezier

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        var opacityTween = Tween<double>(begin: 0.0, end: 1.0);

        return SlideTransition(
          position: animation.drive(tween),
          child: FadeTransition(
            opacity: animation.drive(opacityTween),
            child: child,
          ),
        );
      },
      pageBuilder: (context, animation, secondaryAnimation) => screen,
    );
  }

  static Widget transition(Widget child) {
    return PageTransitionSwitcher(
      duration: const Duration(milliseconds: 300),
      reverse: false,
      transitionBuilder: (
        Widget child,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
      ) {
        return SharedAxisTransition(
          animation: animation,
          secondaryAnimation: secondaryAnimation,
          transitionType: SharedAxisTransitionType.scaled,
          child: child,
        );
      },
      child: child,
    );
  }
}
