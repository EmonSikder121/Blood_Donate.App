import 'package:flutter/material.dart';

import '../pages/area_category.dart';
import '../pages/blood_category.dart';

class DashboardModel {
  final String title;
  final IconData iconData;
  final String routeName;

  const DashboardModel({
    required this.title,
    required this.iconData,
    required this.routeName,
  });
}

const List<DashboardModel> dashboardModelList = [
  DashboardModel(
      title: 'Add Blood Group',
      iconData: Icons.add,
      routeName: BloodCategoryPage.routeName,
  ),
  DashboardModel(
      title: 'Add Area',
      iconData: Icons.add,
      routeName: AreacategoryPage.routeName),

];
