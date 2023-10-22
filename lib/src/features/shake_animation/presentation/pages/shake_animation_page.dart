import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/background_container.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_back_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/shake_animation/presentation/bloc/shake_animation_bloc.dart';
import 'package:plant_market/src/features/shake_animation/presentation/widgets/count_down.dart';
import 'package:plant_market/src/features/shake_animation/presentation/widgets/tree_shake_animation.dart';

class ShakeAnimationPage extends BaseWidget {
  const ShakeAnimationPage({super.key});

  @override
  BaseWidgetState createState() => _ShakeAnimationPageState();
}

class _ShakeAnimationPageState extends BaseWidgetState {
  final _hourScrollController = FixedExtentScrollController();
  final _minuteScrollController = FixedExtentScrollController(initialItem: 5);
  final _countDownController = CountDownController();
  final player = AudioPlayer();

  Future<void> _setMusicUrl({required String musicUrl}) async {
    try {
      await player.setUrl(musicUrl);
      player.play();
    } catch (e) {
      throw Exception(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => ShakeAnimationBloc()
          ..add(ShakeAnimationGetMusicPlayList(audioPlayer: player)),
        child: BlocConsumer<ShakeAnimationBloc, ShakeAnimationState>(
          listener: (context, state) {
            if (state is ShakeAnimationGetMusicPlayListSuccess) {
              _setMusicUrl(musicUrl: state.musicPlayList[0]);
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                // * shake background
                const BackGroundContainer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    context.sizedBox(height: 50),
                    TreeShakeAnimation(
                      countDownController: _countDownController,
                    ),
                    context.sizedBox(height: 20),
                    CountDownWidget(
                      hourScrollController: _hourScrollController,
                      minuteScrollController: _minuteScrollController,
                      onSelectedHourItem: (hourValue) {},
                      onSelectedMinuteItem: (minuteValue) {},
                    ),
                    context.sizedBox(height: 10),
                    _buildSendButton(),
                  ],
                ),
                Padding(
                  padding: context.padding(top: 60, horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomBackButton(
                        color: theme(context).textTheme.titleMedium!.color,
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  void _countDown() {
    _countDownCircleBackGround();
    _countDownHourMinute();
  }

  void _countDownCircleBackGround() {
    _countDownController.start();
  }

  void _countDownHourMinute() {
    Future.delayed(const Duration(seconds: 1), () {
      _minuteScrollController.animateToItem(
        _minuteScrollController.selectedItem - 1,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
      if (_minuteScrollController.selectedItem != 0) {
        _countDownHourMinute();
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          _hourScrollController.animateToItem(
            _hourScrollController.selectedItem - 1,
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
          );
          if (_hourScrollController.selectedItem != 0) {
            _countDownHourMinute();
          }
        });
      }
    });
  }

  Widget _buildSendButton() {
    return CustomButton.send(
      context: context,
      title: translate(context).start,
      width: context.sizeWidth(200),
      onPressed: () => _countDown(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _hourScrollController.dispose();
    _minuteScrollController.dispose();
  }
}
