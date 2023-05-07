import 'package:blood_donate_app/user/pages/donar_loginpage.dart';
import 'package:blood_donate_app/user/pages/donor_profile.dart';
import 'package:flutter/material.dart';
import '../user_auth/user_auth_service.dart';

class DonarLauncherPage extends StatelessWidget {
  static const String routeName = '/donarlauncher';
  const DonarLauncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      if (AuthService.currentUser != null) {
        Navigator.pushReplacementNamed(
          context,
          Profile.routeName,
        );
      } else {
        Navigator.pushReplacementNamed(context, DonorLoginPage.routeName);
      }
    });
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
