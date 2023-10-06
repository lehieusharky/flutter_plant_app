import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/core/data/defines/constants/app_constant.dart';
import 'package:plant_market/src/features/my_app/presentation/bloc/my_app_bloc.dart';

class ToggleLanguageButton extends StatefulWidget {
  const ToggleLanguageButton({super.key});

  @override
  State<ToggleLanguageButton> createState() => _ToggleLanguageButtonState();
}

class _ToggleLanguageButtonState extends State<ToggleLanguageButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {
            context
                .read<MyAppBloc>()
                .add(const MyAppToggleLanguage(languageCode: AppConstant.vi));
          },
          child: const Text('vi'),
        ),
        TextButton(
          onPressed: () {
            context
                .read<MyAppBloc>()
                .add(const MyAppToggleLanguage(languageCode: AppConstant.en));
          },
          child: const Text('en'),
        ),
      ],
    );
  }
}
