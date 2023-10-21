part of 'part_user_page.dart';

class UserPage extends BaseWidget {
  const UserPage({super.key});

  @override
  BaseWidgetState createState() => _UserPageState();
}

class _UserPageState extends BaseWidgetState
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (super.isNotLoggedIn()) {
      return const UserPageNotLoggedIn();
    } else {
      return Scaffold(
        body: BlocProvider(
          create: (context) => UserBloc(),
          child: BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserGetListTimeLineSuccess) {
                Logger()
                    .d('list time lilne length: ${state.listTimeLine.length}');
              }

              if (state is UserGetListTimeLineSuccess) {
                Logger().d(
                    'lengthhhhh list time line: ${state.listTimeLine.length}');
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  const BackGroundContainer(),
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Column(
                        children: [
                          context.sizedBox(height: 50),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomTitle(
                                title: 'Hoa hong',
                              ),
                            ],
                          ),
                        ],
                      ),
                      CreatePostButton(
                        onPressed: () => _showCreatePostModal(context),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      );
    }
  }

  void _showCreatePostModal(BuildContext context) {
    CustomModal.baseModal(
      context: context,
      height: context.height * 0.9,
      child: const CreatePostModal(),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
