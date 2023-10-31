part of 'part_setting_page.dart';

class SettingPage extends BaseWidget {
  const SettingPage({super.key});

  @override
  BaseWidgetState createState() => _SettingPageState();
}

class _SettingPageState extends BaseWidgetState
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (super.isNotLoggedIn()) {
      return const SettingPageNotLoggedIn();
    } else {
      return BaseWidget(
        child: BlocProvider(
          create: (context) => SettingBloc(),
          child: BlocConsumer<SettingBloc, SettingState>(
            listener: (context, state) {
              if (state is SettingLogOutSuccess) {
                CustomSnakBar.showSnackbar(
                  context: context,
                  message: 'Logged out',
                  backgroundColor: colorTheme.get2DDA93,
                  onVisible: () => context.go(RouterPath.loginPage,
                      extra: {AppConstant.isFromDashBoardRouter: false}),
                );
              }

              if (state is SettingDeleteAccountSuccess) {
                CustomSnakBar.showSnackbar(
                  context: context,
                  message: 'Delete account success',
                  backgroundColor: colorTheme.get2DDA93,
                  onVisible: () => context.go(RouterPath.loginPage,
                      extra: {AppConstant.isFromDashBoardRouter: false}),
                );
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleSettingField(title: translate(context).system),
                      context.sizedBox(height: 12),
                      const ThemeLanguageButton(),
                      context.sizedBox(height: 25),
                      TitleSettingField(title: translate(context).account),
                      context.sizedBox(height: 12),
                      const UserInfomationButton(),
                      context.sizedBox(height: 8),
                      const DeleteAccountButton(),
                      context.sizedBox(height: 25),
                      TitleSettingField(title: translate(context).about),
                      context.sizedBox(height: 12),
                      const PrivacyPolicyButton(),
                      const Expanded(child: SizedBox()),
                      Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const ShareFriendButton(),
                            context.sizedBox(height: 5),
                            const LogoutButton(),
                            const VersionText(),
                            context.sizedBox(height: 5),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (state is SettingLoading) const CustomLoading(),
                ],
              );
            },
          ),
        ),
      );
    }
  }

  @override
  bool get wantKeepAlive => true;
}
