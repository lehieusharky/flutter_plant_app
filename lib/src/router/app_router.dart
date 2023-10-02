import 'package:go_router/go_router.dart';
import 'package:plant_market/src/features/auth/auth_gate.dart';
import 'package:plant_market/src/features/dash_board/page/dash_board_page.dart';
import 'package:plant_market/src/features/home/pages/home_page.dart';
import 'package:plant_market/src/features/shake_animation/page/shake_animation_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const DashBoardPage(),
        routes: [
          GoRoute(
            path: 'home_page',
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: 'login',
            builder: (context, state) => const AuthGate(),
          ),
          GoRoute(
            path: 'shake_animation_page',
            builder: (context, state) => const ShakeAnimationPage(),
          ),
        ],
      ),
    ],
  );
}
