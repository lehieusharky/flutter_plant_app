import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:plant_market/src/core/di/part_di.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/background_container.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_modal.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_tab_bar.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_tab_bar_child.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:plant_market/src/features/user/presentation/widgets/create_post_button.dart';
import 'package:plant_market/src/features/user/presentation/widgets/create_post_modal.dart';
import 'package:plant_market/src/features/user/presentation/widgets/reminder_section.dart';
import 'package:plant_market/src/features/user/presentation/widgets/timeline_section.dart';
import 'package:plant_market/src/features/user/presentation/widgets/user_page_not_logged_in.dart';

part 'user_page.dart';
