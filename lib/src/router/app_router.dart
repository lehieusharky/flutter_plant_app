import 'package:go_router/go_router.dart';
import 'package:plant_market/src/modules/auth/auth_gate.dart';
import 'package:plant_market/src/modules/auth/login/pages/login_page.dart';
import 'package:plant_market/src/modules/home_page/pages/home_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
          path: '/',
          builder: (context, state) => const LoginPage(),
          routes: [
            GoRoute(
              path: 'home',
              builder: (context, state) => const HomePage(),
            ),
            GoRoute(
              path: 'login',
              builder: (context, state) => const AuthGate(),
            ),
          ]),
    ],
  );
}
