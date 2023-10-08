import 'package:go_router/go_router.dart';
import 'package:plant_market/src/features/auth/login/presentation/pages/login_page.dart';
import 'package:plant_market/src/features/auth/otp/presentation/page/otp_page.dart';
import 'package:plant_market/src/features/dash_board/page/dash_board_page.dart';
import 'package:plant_market/src/features/home/presentation/pages/home_page.dart';

class AppRouter {
  static final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const DashBoardPage(),
        routes: [
          GoRoute(
            path: 'dash_board',
            builder: (context, state) => const DashBoardPage(),
            routes: [
              GoRoute(
                path: 'home_page',
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          GoRoute(
            path: 'login_page',
            builder: (context, state) => const LoginPage(),
            routes: [
              GoRoute(
                path: 'otp_page',
                builder: (context, state) => const OTPPage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
