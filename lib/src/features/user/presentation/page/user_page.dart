part of 'part_user_page.dart';

class UserPage extends BaseWidget {
  const UserPage({super.key});

  @override
  BaseWidgetState createState() => _UserPageState();
}

class _UserPageState extends BaseWidgetState
    with AutomaticKeepAliveClientMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
              if (state is UserCreatePlantSuccess) {
                Logger().e('Create  plant success');
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  const BackGroundContainer(),
                  Stack(
                    alignment: Alignment.bottomLeft,
                    children: [
                      Padding(
                        padding: context.padding(horizontal: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            context.sizedBox(height: 50),
                            Text(
                              'Le Hieu have 5 plant',
                              style: theme(context).textTheme.titleMedium,
                            ),
                            Text(
                              'Hoa hong',
                              style: theme(context).textTheme.headlineMedium,
                            ),
                            CustomTabBar(
                              tabController: _tabController,
                              tabs: [
                                CustomTabChild(
                                    title: translate(context).timeLine),
                                CustomTabChild(
                                    title: translate(context).reminder),
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                physics: const NeverScrollableScrollPhysics(),
                                controller: _tabController,
                                children: const [
                                  TimeLineSection(),
                                  ReminderSection(),
                                ],
                              ),
                            )
                          ],
                        ),
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

  void _createPlant(BuildContext context) {
    context.read<UserBloc>().add(const UserCreatePlant(plantName: "Tree_test"));
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
