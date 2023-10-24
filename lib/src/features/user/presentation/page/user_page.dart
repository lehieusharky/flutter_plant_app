part of 'part_user_page.dart';

class UserPage extends BaseWidget {
  const UserPage({super.key});

  @override
  BaseWidgetState createState() => _UserPageState();
}

class _UserPageState extends BaseWidgetState
    with AutomaticKeepAliveClientMixin {
  late final TabController _tabController;
  bool _pinned = true;
  bool _snap = false;
  bool _floating = false;

  final _nestedController = FixedExtentScrollController();
  double _buttonOpacity = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _nestedController.addListener(() {
      double offset = _nestedController.offset;
      setOpacity(offset: offset);
    });
  }

  void setOpacity({required double offset}) {
    setState(() {
      _buttonOpacity = (offset / 600).clamp(0.0, 1.0);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<TimeLineModel> _listTimeLineModel = [];

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
              if (state is UserGetListTimeLineSuccess) {
                _listTimeLineModel = state.listTimeLine;
              }
            },
            builder: (context, state) {
              return NestedScrollView(
                controller: _nestedController,
                headerSliverBuilder: (context, value) {
                  return [
                    SliverAppBar(
                      pinned: _pinned,
                      snap: _snap,
                      floating: _floating,
                      expandedHeight: 160.0,
                      flexibleSpace: const FlexibleSpaceBar(
                        title: Text('Hoa hong'),
                        background: FlutterLogo(),
                      ),
                      actions: [
                        Padding(
                          padding: context.padding(horizontal: 20),
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.abc,
                              size: 50,
                              color: Colors.black.withOpacity(_buttonOpacity),
                            ),
                          ),
                        )
                      ],
                    ),
                    SliverToBoxAdapter(
                      child: CustomTabBar(
                        tabController: _tabController,
                        tabs: [
                          CustomTabChild(title: translate(context).timeLine),
                          CustomTabChild(title: translate(context).reminder),
                        ],
                      ),
                    ),
                    SliverList.list(children: [
                      CreatePostButton(
                          onPressed: () => _showCreatePostModal(context)),
                    ])
                  ];
                },
                body: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: _tabController,
                  children: const [
                    TimeLineSection(),
                    ReminderSection(),
                  ],
                ),
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

  Widget _headerAppBar() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Your garden have 5 plants',
          style: theme(context).textTheme.titleMedium,
        ),
        Text(
          'Hoa hong',
          style: theme(context).textTheme.titleMedium,
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}

/*
 SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return TimeLineItem(
                          image: _listTimeLineModel[0].image,
                          title: _listTimeLineModel[0].description,
                          description: _listTimeLineModel[0].createAt,
                        );
                      },
                      childCount: 10,
                    ),
                  )
*/

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
