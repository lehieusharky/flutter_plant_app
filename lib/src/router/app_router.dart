import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/features/auth/login/presentation/pages/part_login_page.dart';
import 'package:plant_market/src/features/auth/otp/presentation/page/otp_page.dart';
import 'package:plant_market/src/features/community_search/presentation/pages/community_search_page.dart';
import 'package:plant_market/src/features/dash_board/presentation/page/part_dash_board_page.dart';
import 'package:plant_market/src/features/popular_topic/presentation/page/popular_topic_page.dart';
import 'package:plant_market/src/features/shake_animation/presentation/pages/part_shake_animation_page.dart';
import 'package:plant_market/src/router/router_transition.dart';

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
            builder: (context, state) {
              return const DashBoardPage();
            },
            routes: [
              GoRoute(
                path: 'search_page',
                builder: (context, state) => const CommunitySearchPage(),
              ),
              GoRoute(
                path: 'popular_topic_page',
                builder: (context, state) {
                  final plantTopic =
                      _params(state)[AppConstant.plantTopicRouter] ??
                          translate(context).plant;
                  return PopularTopicPage(
                    plantTopic: plantTopic,
                  );
                },
              ),
              GoRoute(
                  path: 'shake_animation_page',
                  pageBuilder: (context, state) {
                    return RouterTransition.slideTransition(
                      state: state,
                      page: const ShakeAnimationPage(),
                    );
                  }),
            ],
          ),
          GoRoute(
            path: 'login_page',
            builder: (context, state) {
              final isFromDashBoardRouter =
                  _params(state)[AppConstant.isFromDashBoardRouter] ?? false;
              return LoginPage(isFromDashBoardRouter: isFromDashBoardRouter);
            },
            routes: [
              GoRoute(
                path: 'otp_page',
                pageBuilder: (context, state) {
                  final verificationid =
                      _params(state)[AppConstant.verificationID] ?? 'empty';
                  return RouterTransition.slideTransition(
                    state: state,
                    page: OTPPage(
                      verificationId: verificationid,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
  );

  static get animation => null;

  static Map<String, dynamic> _params(GoRouterState state) {
    return state.extra! as Map<String, dynamic>;
  }
}
