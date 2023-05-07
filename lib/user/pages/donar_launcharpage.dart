import 'package:flutter/material.dart';

import 'donar_loginpage.dart';


class DonarLauncherPage extends StatelessWidget {
  static const String routeName = '/Donarlauncher';
  const DonarLauncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () {
      // if (AuthService.currentUser != null) {
      //   Navigator.pushReplacementNamed(
      //     context,
      //     DashboardPage.routeName,
      //   );
      // } else {
        Navigator.pushReplacementNamed(context, DonarLoginPage.routeName);
      // }
    });
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
