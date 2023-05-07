import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/admin_provider.dart';
import '../admin_auth/admin_auth.dart';
import '../customwidgets/dashboardItemview.dart';
import '../model/dashboard_model.dart';
import 'launcharpage.dart';

class DashboardPage extends StatefulWidget {
  static const String routeName = '/dashboard';
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<AdminProvider>(context,listen: false).getAllAreaCategories();
    Provider.of<AdminProvider>(context,listen: false).getAllBloodCategories();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        actions: [
          IconButton(
            onPressed: () {
              AuthService.logout().then((value) =>
                  Navigator.pushReplacementNamed(
                      context, LauncherPage.routeName));
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),

      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: .80,
        ),
        itemCount: dashboardModelList.length,
        itemBuilder: (context, index) {
          final model = dashboardModelList[index];
          return DashboardItemView(
            model: dashboardModelList[index],
          );
        },
      ),
    );
  }
}
