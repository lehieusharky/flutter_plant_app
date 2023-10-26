part of 'part_user_page.dart';

class UserPage extends BaseWidget {
  const UserPage({super.key});

  @override
  BaseWidgetState createState() => _UserPageState();
}

class _UserPageState extends BaseWidgetState
    with AutomaticKeepAliveClientMixin {
  late final TabController _tabController;

  final _nestedController = FixedExtentScrollController();
  double _zoomOutCreateTimelineButtonOpacity = 0;
  double _appbarBackgroundOpacity = 0;
  Color? _colorLeadingAppBar;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _nestedController.addListener(() {
      double offset = _nestedController.offset;
      _setOpacityWhenScroll(offset: offset);
    });
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
                CustomSnakBar.showSnackbar(
                  context: context,
                  message: 'Create new plant success',
                  backgroundColor: colorTheme.get2DDA93,
                );
                Navigator.of(context).pop();
              }
            },
            builder: (context, state) {
              return Stack(
                children: [
                  const BackGroundContainer(),
                  NestedScrollView(
                    controller: _nestedController,
                    headerSliverBuilder: (context, value) {
                      return [
                        _buildAppBar(),
                        _buildTabBar(),
                      ];
                    },
                    body: _buildTabBarView(),
                  ),
                ],
              );
            },
          ),
        ),
      );
    }
  }

  Widget _buildTabBarView() {
    return TabBarView(
      physics: const NeverScrollableScrollPhysics(),
      controller: _tabController,
      children: [
        TimeLineSection(
          onPressed: () => _showCreatePostModal(context),
        ),
        const ReminderSection(),
      ],
    );
  }

  Widget _buildTabBar() {
    return SliverToBoxAdapter(
      child: CustomTabBar(
        tabController: _tabController,
        tabs: [
          CustomTabChild(title: translate(context).timeLine),
          CustomTabChild(title: translate(context).reminder),
        ],
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      pinned: true,
      snap: true,
      leadingWidth: context.sizeWidth(80),
      floating: true,
      backgroundColor: Theme.of(context)
          .scaffoldBackgroundColor
          .withOpacity(_appbarBackgroundOpacity),
      expandedHeight: 90,
      leading: LeafPlusButton(
        color: _colorLeadingAppBar,
      ),
      flexibleSpace: const FlexibleSpaceBar(
        title: PlantName(plantName: 'Rosé'),
      ),
      actions: [
        ZoomOutCreateTimelineButton(
          opacity: _zoomOutCreateTimelineButtonOpacity,
          onPressed: () => _showCreatePostModal(context),
        ),
      ],
    );
  }

  void _showCreatePostModal(BuildContext context) {
    CustomModal.baseModal(
      context: context,
      height: context.height * 0.9,
      child: const CreateTimelineModal(),
    );
  }

  void _setOpacityWhenScroll({required double offset}) {
    setState(() {
      _zoomOutCreateTimelineButtonOpacity = (offset / 200).clamp(0.0, 1.0);

      _appbarBackgroundOpacity = offset.clamp(0.0, 1.0);

      _setColorLeadingAppBar(offset: offset);
    });
  }

  void _setColorLeadingAppBar({required double offset}) {
    double triggerOffset = 50.0;
    if (offset > triggerOffset) {
      _colorLeadingAppBar = colorTheme.get2DDA93;
    } else {
      _colorLeadingAppBar = theme(context).textTheme.titleMedium!.color!;
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
