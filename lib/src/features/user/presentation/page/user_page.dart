import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_modal.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/user/data/mock/mock_user.dart';
import 'package:plant_market/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:plant_market/src/features/user/presentation/widgets/create_post_modal.dart';
import 'package:plant_market/src/features/user/presentation/widgets/separator.dart';
import 'package:plant_market/src/features/user/presentation/widgets/time_line_item.dart';

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
    return BaseWidget(
      child: BlocProvider(
        create: (context) => UserBloc(),
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is UserPickImageFromCameraSuccess) {
              Logger().f(state.image!.path);
            }
          },
          builder: (context, state) {
            return Column(
              children: [
                CustomButton.send(
                  title: 'Add post',
                  context: context,
                  onPressed: () => _showCreatePostModal(context),
                ),
                if (state is UserPickImageFromCameraSuccess)
                  Image.file(state.image!),
                Expanded(
                  child: ListView.separated(
                    itemCount: MockUser.timeLineArray.length,
                    itemBuilder: (context, index) {
                      return TimeLineItem(
                        image: MockUser.timeLineArray[index].image,
                        title: MockUser.timeLineArray[index].title,
                        description: MockUser.timeLineArray[index].description,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: context.padding(horizontal: 40, vertical: 8),
                        child: const MySeparator(),
                      );
                    },
                  ),
                ),
              ],
            );
          },
        ),
      ),
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
