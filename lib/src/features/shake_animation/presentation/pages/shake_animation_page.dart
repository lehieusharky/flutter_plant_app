import 'dart:math';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:logger/logger.dart';
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
import 'package:plant_market/src/theme/color_theme.dart';

class ShakeAnimationPage extends BaseWidget {
  const ShakeAnimationPage({super.key});

  @override
  BaseWidgetState createState() => _ShakeAnimationPageState();
}

class _ShakeAnimationPageState extends BaseWidgetState {
  final _hourScrollController = FixedExtentScrollController(initialItem: 0);
  final _minuteScrollController = FixedExtentScrollController(initialItem: 5);
  final _countDownController = CountDownController();
  final player = AudioPlayer();
  bool _isStart = false;
  String _musicName = '';

  Future<void> _setMusicUrl({required String musicUrl}) async {
    try {
      await player.setUrl(musicUrl);
      player.play();
    } catch (e) {
      throw Exception(e);
    }
  }

  int minuteCount = 5;

  String _getMusicNameFromUrl({required Uri musicUrl}) {
    return musicUrl.pathSegments.last.split('/').last.split('.').first;
  }

  int _getRandomIndexMusicUrl({required List<String> musicPlayList}) {
    return Random().nextInt(musicPlayList.length);
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
              final indexMusic =
                  _getRandomIndexMusicUrl(musicPlayList: state.musicPlayList);
              Uri musicUrl = Uri.parse(state.musicPlayList[indexMusic]);
              setState(() {
                _musicName = _getMusicNameFromUrl(musicUrl: musicUrl);
              });
              // _setMusicUrl(musicUrl: state.musicPlayList[indexMusic]);
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
                    context.sizedBox(height: 60),
                    TreeShakeAnimation(
                      countDownController: _countDownController,
                    ),
                    context.sizedBox(height: 20),
                    CountDownWidget(
                      hourScrollController: _hourScrollController,
                      minuteScrollController: _minuteScrollController,
                      onMinuteSelected: (minute) {
                        setState(() {
                          minuteCount = minute;
                        });
                      },
                    ),
                    context.sizedBox(height: 10),
                    _buildSendButton(),
                    context.sizedBox(height: 10),
                    _isStart
                        ? const SizedBox()
                        : Padding(
                            padding: context.padding(horizontal: 50),
                            child: Text(
                              translate(context).relaxWithMusic,
                              textAlign: TextAlign.center,
                              style: theme(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: theme(context)
                                          .textTheme
                                          .titleMedium!
                                          .color!
                                          .withOpacity(0.6)),
                            ),
                          ),
                  ],
                ),
                Padding(
                  padding: context.padding(top: 60, horizontal: 12),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _isStart
                              ? const SizedBox()
                              : CustomBackButton(
                                  color: theme(context)
                                      .textTheme
                                      .titleMedium!
                                      .color,
                                ),
                        ],
                      ),
                      _isStart
                          ? const SizedBox()
                          : Text(
                              _musicName,
                              style: theme(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: theme(context)
                                          .textTheme
                                          .titleLarge!
                                          .color!
                                          .withOpacity(0.8)),
                            )
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
    if (_hourScrollController.selectedItem != 0 ||
        _minuteScrollController.selectedItem != 0) {
      Future.delayed(const Duration(seconds: 1), () {
        _minuteScrollController.animateToItem(
          _minuteScrollController.selectedItem - 1,
          duration: const Duration(seconds: 1),
          curve: Curves.easeInOut,
        );

        if (minuteCount != 1) {
          _countDownHourMinute();
        } else {
          if (_hourScrollController.selectedItem != 0) {
            Future.delayed(const Duration(seconds: 1), () {
              _hourScrollController.animateToItem(
                _hourScrollController.selectedItem - 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            });
            Future.delayed(const Duration(seconds: 1), () {
              _minuteScrollController.animateToItem(
                _minuteScrollController.selectedItem - 1,
                duration: const Duration(seconds: 1),
                curve: Curves.easeInOut,
              );
            });
            if (_hourScrollController.selectedItem != 0) {
              _countDownHourMinute();
            }
          }
        }
      });
    }
  }

  Widget _buildSendButton() {
    return CustomButton.send(
      context: context,
      title: _isStart ? 'Bỏ cuộc' : translate(context).start,
      width: context.sizeWidth(200),
      onPressed: () => _startButtonEvent(),
      backgroundColor: _isStart ? colorTheme.get6A6F7D : colorTheme.get2DDA93,
    );
  }

  void _giveUp() {
    _minuteScrollController
        .animateToItem(
      0,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    )
        .then((value) {
      _hourScrollController.animateToItem(
        0,
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOut,
      );
    });

    Logger().d('give up');
  }

  void _startButtonEvent() {
    if (_isStart) {
      _giveUp();
    } else {
      _countDown();
    }
    setState(() {
      _isStart = !_isStart;
    });
  }

  @override
  void dispose() {
    super.dispose();
    player.stop();
    player.dispose();
  }
}
