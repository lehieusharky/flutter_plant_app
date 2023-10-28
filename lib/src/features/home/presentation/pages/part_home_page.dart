import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/extension/localization.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/background_container.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_modal.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_see_all_button.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_title.dart';
import 'package:plant_market/src/features/home/data/enum/topic_symbol.dart';
import 'package:plant_market/src/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:plant_market/src/features/home/presentation/widgets/app_bar_home_page.dart';
import 'package:plant_market/src/features/home/presentation/widgets/create_community_post_modal.dart';
import 'package:plant_market/src/features/home/presentation/widgets/gallery_modal.dart';
import 'package:plant_market/src/features/home/presentation/widgets/list_post_home_page.dart';
import 'package:plant_market/src/features/home/presentation/widgets/part_home_page_widget.dart';
import 'package:plant_market/src/features/home/presentation/widgets/plant_identity_modal.dart';
import 'package:plant_market/src/features/home/presentation/widgets/search_bar_button.dart';
import 'package:plant_market/src/features/home/presentation/widgets/shake_animation_home_page.dart';
import 'package:plant_market/src/features/home/presentation/widgets/row_topic_button.dart';
import 'package:plant_market/src/features/home/presentation/widgets/zoom_out_button_home_page.dart';
import 'package:plant_market/src/features/my_app/presentation/bloc/my_app_bloc.dart';
import 'package:sliver_tools/sliver_tools.dart';

part 'home_page.dart';
