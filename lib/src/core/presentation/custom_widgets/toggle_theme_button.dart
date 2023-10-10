import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant_market/src/features/my_app/presentation/bloc/my_app_bloc.dart';

class ToggleThemeButton extends StatefulWidget {
  const ToggleThemeButton({super.key});

  @override
  State<ToggleThemeButton> createState() => _ToggleThemeButtonState();
}

class _ToggleThemeButtonState extends State<ToggleThemeButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextButton(
          onPressed: () {
            context
                .read<MyAppBloc>()
                .add(const MyAppToogleTheme(themeMode: ThemeMode.light));
          },
          child: const Text('LIGHT'),
        ),
        TextButton(
          onPressed: () {
            context
                .read<MyAppBloc>()
                .add(const MyAppToogleTheme(themeMode: ThemeMode.dark));
          },
          child: const Text('DARK'),
        ),
      ],
    );
  }
}
