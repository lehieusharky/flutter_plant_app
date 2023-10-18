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
    return BlocBuilder<MyAppBloc, MyAppState>(
      builder: (context, state) {
        if (state is MyAppGetUserInformationSuccess) {
          return Scaffold(
            body: Stack(
              children: [
                const BackGroundContainer(),
                Column(
                  children: [
                    context.sizedBox(height: 50),
                    Expanded(
                      child: Padding(
                        padding: context.padding(horizontal: 12),
                        child: ListView.separated(
                          itemCount: MockUser.timeLineArray.length,
                          itemBuilder: (context, index) {
                            return TimeLineItem(
                              image: MockUser.timeLineArray[index].image,
                              title: MockUser.timeLineArray[index].title,
                              description:
                                  MockUser.timeLineArray[index].description,
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding:
                                  context.padding(horizontal: 40, vertical: 8),
                              child: const MySeparator(),
                            );
                          },
                        ),
                      ),
                    ),
                    CreatePostButton(
                      onPressed: () => _showCreatePostModal(context),
                    ),
                  ],
                ),
              ],
            ),
          );
        } else {
          return const UserPageNotLoggedIn();
        }
      },
    );
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
