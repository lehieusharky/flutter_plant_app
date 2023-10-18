import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_title.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/features/my_app/presentation/bloc/my_app_bloc.dart';
import 'package:plant_market/src/features/setting/presentation/bloc/setting_bloc.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/delete_account_button.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/log_out_button.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/privacy_button.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/share_friend_button.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/theme_language_button.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/user_info_button.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/version_text.dart';
import 'package:plant_market/src/features/setting/presentation/widgets/setting_page_not_logged_in.dart';
import 'package:plant_market/src/router/router_path.dart';


part 'setting_page.dart';