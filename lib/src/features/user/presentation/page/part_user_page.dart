import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:plant_market/src/core/data/datasource/local/share_preference_datasource.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/background_container.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_modal.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/auth/login/presentation/widgets/not_logged_in_button.dart';
import 'package:plant_market/src/features/user/data/mock/mock_user.dart';
import 'package:plant_market/src/features/user/presentation/bloc/user_bloc.dart';
import 'package:plant_market/src/features/user/presentation/widgets/create_post_button.dart';
import 'package:plant_market/src/features/user/presentation/widgets/create_post_modal.dart';
import 'package:plant_market/src/features/user/presentation/widgets/separator.dart';
import 'package:plant_market/src/features/user/presentation/widgets/time_line_item.dart';

part 'user_page.dart';
