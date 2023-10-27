import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RouterTransition {
  static CustomTransitionPage slideTransition({
    required GoRouterState state,
    required Widget page,
  }) {
    return CustomTransitionPage<void>(
      key: state.pageKey,
      child: page,
      transitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        return SlideTransition(
          position: animation.drive(
            Tween(
              begin: const Offset(1.5, 0),
              end: Offset.zero,
            ).chain(
              CurveTween(curve: Curves.ease),
            ),
          ),
          child: child,
        );
      },
    );
  }
}
