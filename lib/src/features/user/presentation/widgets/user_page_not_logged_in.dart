import 'package:flutter/widgets.dart';
import 'package:plant_market/src/features/auth/login/presentation/widgets/not_logged_in_button.dart';

class UserPageNotLoggedIn extends StatelessWidget {
  const UserPageNotLoggedIn({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        // BackGroundContainer(),
        NotLoggedInButton(),
      ],
    );
  }
}
