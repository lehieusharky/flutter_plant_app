part of 'part_login_page.dart';

class LoginPage extends BaseWidget {
  final bool? isFromDashBoardRouter;
  const LoginPage({
    super.key,
    this.isFromDashBoardRouter,
  });
  @override
  BaseWidgetState createState() => _LoginPageState();
}

class _LoginPageState extends BaseWidgetState {
  final _phoneNumberController = TextEditingController();
  final _keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) => _loginStateListener(state, context),
          builder: (context, state) {
            return Stack(
              alignment: Alignment.topLeft,
              children: [
                Padding(
                  padding: context.padding(top: 45),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      context.sizedBox(height: 20),
                      //* header
                      CustomHeaderAuthentication(
                        title: translate(context).hello,
                        subTitle: translate(context).letsLearnMoreAboutPlants,
                      ),
                      context.sizedBox(height: 25),
                      //* form
                      FormLogin(
                        keyForm: _keyForm,
                        phoneNumberController: _phoneNumberController,
                      ),
                      context.sizedBox(height: 20),
                      //* brand button
                      const RowBrandLoginButton(),
                    ],
                  ),
                ),
                ((widget as LoginPage).isFromDashBoardRouter ?? false)
                    ? const CustomBackButton()
                    : const SizedBox(),
                if (state is LoginLoading) ...[
                  const CustomLoading(),
                ]
              ],
            );
          },
        ),
      ),
    );
  }

  void _loginStateListener(LoginState state, BuildContext context) {
    if (state is LoginSuccess) {
      CustomSnakBar.showSnackbar(
        context: context,
        message: translate(context).loggedIn,
        backgroundColor: colorTheme.get2DDA93,
        onVisible: () => context.go(RouterPath.dashBoard),
      );
    }

    if (state is LoginWithGoogleFailure) {
      CustomSnakBar.showSnackbar(
        context: context,
        message: translate(context).loginFailed,
        backgroundColor: colorTheme.getFF6262,
      );
    }
    if (state is LoginSentOtpFailure) {
      CustomSnakBar.showSnackbar(
        context: context,
        message: translate(context).loginFailed,
        backgroundColor: colorTheme.getFF6262,
      );
    }
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    super.dispose();
  }
}
