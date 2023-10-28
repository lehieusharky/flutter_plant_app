import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_back_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_loading.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_snack_bar.dart';
import 'package:plant_market/src/core/presentation/page/base_page.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_header_auth.dart';
import 'package:plant_market/src/features/auth/login/presentation/bloc/login_bloc.dart';
import 'package:plant_market/src/features/auth/login/presentation/widgets/row_brand_login_button.dart';
import 'package:plant_market/src/features/auth/login/presentation/widgets/login_form.dart';
import 'package:plant_market/src/features/dash_board/presentation/bloc/dash_board_bloc.dart';
import 'package:plant_market/src/router/router_path.dart';
import 'package:plant_market/src/theme/color_theme.dart';

part 'login_page.dart';
