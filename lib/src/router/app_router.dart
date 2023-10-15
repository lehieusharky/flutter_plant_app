import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/features/auth/login/presentation/pages/login_page.dart';
import 'package:plant_market/src/features/auth/otp/presentation/page/otp_page.dart';
import 'package:plant_market/src/features/dash_board/page/dash_board_page.dart';
import 'package:plant_market/src/features/search/presentation/pages/search_page.dart';
import 'package:plant_market/src/features/shake_animation/presentation/pages/shake_animation_page.dart';

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
                path: 'search_page',
                builder: (context, state) => const SearchPage(),
              ),
              GoRoute(
                path: 'shake_animation_page',
                builder: (context, state) => const ShakeAnimationPage(),
              ),
            ],
          ),
          GoRoute(
            path: 'login_page',
            builder: (context, state) => const LoginPage(),
            routes: [
              GoRoute(
                path: 'otp_page',
                builder: (context, state) {
                  final params = state.extra! as Map<String, String>;
                  final verificationid =
                      params[AppConstant.verificationID] ?? 'empty';
                  return OTPPage(
                    verificationId: verificationid,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
