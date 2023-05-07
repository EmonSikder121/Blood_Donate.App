import 'package:blood_donate_app/admin/pages/area_category.dart';
import 'package:blood_donate_app/admin/pages/developer.dart';
import 'package:blood_donate_app/admin/pages/launcharpage.dart';
import 'package:blood_donate_app/provider/admin_provider.dart';
import 'package:blood_donate_app/provider/donar_provider.dart';
import 'package:blood_donate_app/user/pages/donar_launcharpage.dart';
import 'package:blood_donate_app/user/pages/donar_loginpage.dart';
import 'package:blood_donate_app/user/pages/donor_details.dart';
import 'package:blood_donate_app/user/pages/donor_list.dart';
import 'package:blood_donate_app/user/pages/donor_profile.dart';
import 'package:blood_donate_app/user/pages/donor_registration%20page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'admin/pages/blood_category.dart';
import 'admin/pages/dashboardpage.dart';
import 'admin/pages/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create:(_)=> AdminProvider()),
    ChangeNotifierProvider(create:(_)=> UserProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.teal
      ),
      builder: EasyLoading.init(),
      initialRoute: ViewDonorList.routeName,
      routes:{
        ViewDonorList.routeName:(_) =>const ViewDonorList(),
        DonorLoginPage.routeName:(_) =>const DonorLoginPage(),
        Profile.routeName:(_) =>const Profile(),
        Developer.routeName:(_) =>const Developer(),
        DonarLauncherPage.routeName:(_) =>const DonarLauncherPage(),
        LoginPage.routeName:(_) =>const LoginPage(),
        DonarDetailsPage.routeName:(_) =>const DonarDetailsPage(),
        LauncherPage.routeName:(_) =>const LauncherPage(),
        RegistrationPage.routeName: (_) => const RegistrationPage(),
        DashboardPage.routeName: (_) => const DashboardPage(),
        BloodcategoryPage.routeName: (_) => const BloodcategoryPage(),
        AreacategoryPage.routeName: (_) => const AreacategoryPage(),
      }
    );
  }
}

