import 'dart:math';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:just_audio/just_audio.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_back_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_button.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/shake_animation/presentation/bloc/shake_animation_bloc.dart';
import 'package:plant_market/src/features/shake_animation/presentation/widgets/count_down.dart';
import 'package:plant_market/src/features/shake_animation/presentation/widgets/music_title.dart';
import 'package:plant_market/src/features/shake_animation/presentation/widgets/tree_shake_animation.dart';
import 'package:plant_market/src/theme/color_theme.dart';

part 'shake_animation_page.dart';
