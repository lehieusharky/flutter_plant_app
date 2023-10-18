import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:plant_market/src/features/auth/login/presentation/pages/part_login_page.dart';
import 'package:plant_market/src/features/dash_board/presentation/page/part_dash_board_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const DashBoardPage();
        }
        return const LoginPage();
      },
    );
  }
}
