import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:plant_market/src/core/extension/responsive.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_catched_network_image.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_divider.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_seperator.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_shimmer.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_snack_bar.dart';
import 'package:plant_market/src/core/presentation/custom_widgets/custom_text_button.dart';
import 'package:plant_market/src/features/home/presentation/bloc/home_page_bloc.dart';
import 'package:plant_market/src/features/user/presentation/widgets/create_timeline_button.dart';
import 'package:plant_market/src/theme/color_theme.dart';

class GalleryModal extends StatefulWidget {
  const GalleryModal({super.key});

  @override
  State<GalleryModal> createState() => _GalleryModalState();
}

class _GalleryModalState extends State<GalleryModal> {
  File? _imageFile;
  List<String> _gallery = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => HomePageBloc()..add(HomePageGetImageFromGallery()),
        child: BlocConsumer<HomePageBloc, HomePageState>(
            listener: (context, state) {
          if (state is HomePageGetImageFromGallerySuccess) {
            _gallery = state.gallery;
          }
          if (state is HomePagePickImageFromCameraSuccess) {
            _imageFile = state.imageFile;
            CustomSnakBar.showSnackbar(
              context: context,
              message: "Pick image from camera success",
              backgroundColor: colorTheme.get2DDA93,
            );
          }
          if (state is HomePagePostImageToPublicGallerySuccess) {
            CustomSnakBar.showSnackbar(
              context: context,
              message: "Post image success",
              backgroundColor: colorTheme.get2DDA93,
            );
          }
          if (state is HomePagePickImageFailed) {
            CustomSnakBar.showSnackbar(
              context: context,
              message: state.message,
              backgroundColor: colorTheme.getFF6262,
            );
          }
        }, builder: (context, state) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CustomTextButton.cancel(context),
                  const CustomSeperator(),
                  CustomTextButton.save(
                    context: context,
                    onPressed: () => _postImageToPublicGallery(context),
                    saveText: 'Post',
                  )
                ],
              ),
              const CustomDivider(),
              context.sizedBox(height: 5),
              _gallery.isEmpty
                  ? const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CustomShimmer(),
                        CustomShimmer(),
                        CustomShimmer(),
                        CustomShimmer(),
                      ],
                    )
                  : AnimationLimiter(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomTextButton.cancel(context),
                              const CustomSeperator(),
                              CustomTextButton.save(
                                context: context,
                                onPressed: () =>
                                    _postImageToPublicGallery(context),
                                saveText: 'Post',
                              )
                            ],
                          ),
                          const CustomDivider(),
                          context.sizedBox(height: 5),
                          Padding(
                            padding: context.padding(vertical: 20),
                            child: CreateTimelineButton.fullWidth(
                              context: context,
                              onPressed: () => _pickImageFromCamera(context),
                              title: 'Post beautiful nature pictures now',
                            ),
                          ),
                          if (state is HomePagePickImageFromCameraSuccess)
                            Padding(
                              padding: context.padding(all: 3),
                              child: Image.file(
                                state.imageFile,
                                width: context.width,
                                fit: BoxFit.cover,
                                height: context.sizeHeight(200),
                              ),
                            ),
                          Expanded(
                            child: GridView.count(
                              physics: const BouncingScrollPhysics(
                                  parent: AlwaysScrollableScrollPhysics()),
                              padding: EdgeInsets.all(context.width / 60),
                              crossAxisCount: 3,
                              children: List.generate(
                                _gallery.length,
                                (int index) {
                                  return AnimationConfiguration.staggeredGrid(
                                    position: index,
                                    duration: const Duration(milliseconds: 500),
                                    columnCount: 3,
                                    child: ScaleAnimation(
                                      duration:
                                          const Duration(milliseconds: 900),
                                      curve: Curves.fastLinearToSlowEaseIn,
                                      child: FadeInAnimation(
                                        child: Padding(
                                            padding: context.padding(all: 3),
                                            child: CustomCatchedNetWorkImage(
                                                imageUrl: _gallery[index])),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
            ],
          );
        }),
      ),
    );
  }

  void _postImageToPublicGallery(BuildContext context) {
    context
        .read<HomePageBloc>()
        .add(HomePagePostImageToPublicGallery(imageFile: _imageFile!));
  }

  void _pickImageFromCamera(BuildContext context) {
    context.read<HomePageBloc>().add(HomePagePickImageFromCamera());
  }
}
