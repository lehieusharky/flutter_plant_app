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
    return BaseWidget(
      child: BlocProvider(
        create: (context) => SettingBloc(),
        child: BlocListener<SettingBloc, SettingState>(
          listener: (context, state) {
            if (state is SettingLogOutSuccess) {
              log('log out state succes');
              context.go(RouterPath.loginPage);
            }
          },
          child: BlocBuilder<MyAppBloc, MyAppState>(
            builder: (context, state) {
              if (state is MyAppGetUserInformationSuccess) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTitle(title: translate(context).system),
                    context.sizedBox(height: 12),
                    const ThemeLanguageButton(),
                    context.sizedBox(height: 25),
                    CustomTitle(title: translate(context).account),
                    context.sizedBox(height: 12),
                    const UserInfomationButton(),
                    context.sizedBox(height: 8),
                    const DeleteAccountButton(),
                    context.sizedBox(height: 25),
                    CustomTitle(title: translate(context).about),
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
                );
              } else {
                return const SettingPageNotLoggedIn();
              }
            },
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
