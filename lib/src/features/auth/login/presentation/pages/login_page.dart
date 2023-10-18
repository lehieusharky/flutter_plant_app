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
  final phoneNumberController = TextEditingController();
  final keyForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BaseWidget(
      child: BlocProvider(
        create: (context) => LoginBloc(),
        child: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              context.read<LoginBloc>().add(LoginGetUserInfomation());
            }
            if (state is LoginGetUserInfomationSuccess) {
              final userModel = state.userModel;
              BlocProvider.of<MyAppBloc>(context)
                  .add(MyAppGetUserInformation(userModel: userModel));

              context.go(RouterPath.dashBoard);
            }
            if (state is LoginWithGoogleFailure) {
              Logger().e(state.message);
            }
            if (state is LoginSentOtpFailure) {
              Logger().e('sendd otp failure');
            }
          },
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
                        keyForm: keyForm,
                        phoneNumberController: phoneNumberController,
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
                if (state is LoginLoading) ...[super.loadingWidget()]
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.exit();
    super.dispose();
  }
}
