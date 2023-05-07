import 'package:flutter/material.dart';

import '../user_auth/user_auth_service.dart';
import 'donar_launcharpage.dart';

class Profile extends StatelessWidget {
  static const String routeName = '/viewDonorprofile';
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              AuthService.logout().then((value) =>
                  Navigator.pushReplacementNamed(
                      context, DonarLauncherPage.routeName));
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
    );
  }
}
