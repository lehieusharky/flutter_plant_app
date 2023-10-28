import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/defines/constants/image_constant.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/background_container.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_modal.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_snack_bar.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_tab_bar.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_tab_bar_child.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/dash_board/presentation/bloc/dash_board_bloc.dart';
import 'package:plant_market/src/features/dash_board/presentation/page/part_dash_board_page.dart';
import 'package:plant_market/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:plant_market/src/features/user/presentation/widgets/create_timeline_modal.dart';
import 'package:plant_market/src/features/user/presentation/widgets/leaf_plus_button.dart';
import 'package:plant_market/src/features/user/presentation/widgets/plant_name.dart';
import 'package:plant_market/src/features/user/presentation/widgets/reminder_section.dart';
import 'package:plant_market/src/features/user/presentation/widgets/timeline_section.dart';
import 'package:plant_market/src/features/user/presentation/widgets/user_page_not_logged_in.dart';
import 'package:plant_market/src/features/user/presentation/widgets/zoom_out_button.dart';

import 'package:plant_market/src/theme/color_theme.dart';
part 'user_page.dart';
