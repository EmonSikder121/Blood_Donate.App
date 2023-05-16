import 'dart:io';

import 'package:blood_donate_app/admin/model/area_catagory_model.dart';
import 'package:blood_donate_app/admin/model/blood_catagory_model.dart';
import 'package:blood_donate_app/user/pages/donar_launcharpage.dart';
import 'package:blood_donate_app/user/pages/donor_profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../provider/admin_provider.dart';
import '../../provider/donar_provider.dart';

import '../models/user_model.dart';

import '../user_auth/user_auth_service.dart';


class RegistrationPage extends StatefulWidget {
  static const String routeName = '/registrationPage';

  const RegistrationPage({Key? key}) : super(key: key);





  @override
  State<RegistrationPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  late UserProvider _userProvider;
  late AdminProvider _adminProvider;
  late DonarModel donarModel;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _namedController = TextEditingController();
  final _numberController = TextEditingController();
  final _bloodController = TextEditingController();
  String? thumbnailImageLocalPath;
  AreaCategoryModel? areaCategoryModel;
  BloodCategoryModel? bloodCategoryModel;
  String _errMsg = '';
  late UserProvider userProvider;

  @override
  void didChangeDependencies() {
    userProvider = Provider.of<UserProvider>(context, listen: false);
    _userProvider = UserProvider();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(24),
            shrinkWrap: true,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        child: thumbnailImageLocalPath == null
                            ? const Icon(
                          Icons.photo,
                          size: 100,
                        )
                            : Image.file(
                          File(thumbnailImageLocalPath!),
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          TextButton.icon(
                            onPressed: () {
                              _getImage(ImageSource.camera);
                            },
                            icon: const Icon(Icons.camera),
                            label: const Text('Open Camera'),
                          ),
                          TextButton.icon(
                            onPressed: () {
                              _getImage(ImageSource.gallery);
                            },
                            icon: const Icon(Icons.photo_album),
                            label: const Text('Open Gallery'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Consumer<AdminProvider>(
                builder: (context, provider, child) =>
                    DropdownButtonFormField<AreaCategoryModel>(
                      hint: const Text('Select Location'),
                      value: areaCategoryModel,
                      isExpanded: true,
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a category';
                        }
                        return null;
                      },
                      items: provider.AreaCategoryList
                          .map((catModel) => DropdownMenuItem<AreaCategoryModel>(
                        value: catModel,
                        child: Text(catModel.areacategoryName),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          areaCategoryModel = value;
                        });
                      },
                    ),
              ),
              Consumer<AdminProvider>(
                builder: (context, provider, child) =>
                    DropdownButtonFormField<BloodCategoryModel>(
                      hint: const Text('Select Blood Group'),
                      value: bloodCategoryModel,
                      isExpanded: true,
                      validator: (value) {
                        if (value == null) {
                          return 'Please select a category';
                        }
                        return null;
                      },
                      items: provider.BloodCategoryList
                          .map((catModel) => DropdownMenuItem<BloodCategoryModel>(
                        value: catModel,
                        child: Text(catModel.bloodcategoryName),
                      ))
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          bloodCategoryModel = value;
                        });
                      },
                    ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  controller: _namedController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Enter Your Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your Nanme';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  controller: _numberController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.phone),
                      labelText: 'Enter Your Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your Number';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email Address'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Provide a valid email address';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  controller: _bloodController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.bloodtype),
                      labelText: 'Enter Your Blood Group'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter Your Blood Group';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: TextFormField(
                  controller: _passwordController,
                  //obscureText: true,
                  decoration: const InputDecoration(
                      filled: true,
                      prefixIcon: Icon(Icons.lock),
                      labelText: 'Password(at least 6 characters)'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Provide a valid password';
                    }
                    return null;
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _authenticate(false);
                },
                child: const Text('Register'),
              ),
              const Center(child: Text('OR', style: TextStyle(fontSize: 20),),),
              TextButton.icon(
                icon: const Icon(
                  Icons.g_mobiledata,
                  size: 30,
                ),
                onPressed: _signInWithGoogle,
                label: const Text('Sign In with Google'),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  _errMsg,
                  style: const TextStyle(fontSize: 18, color: Colors.red),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _getImage(ImageSource imageSource) async {
    final pickedImage = await ImagePicker().pickImage(
      source: imageSource,
      imageQuality: 70,
    );
    if (pickedImage != null) {
      setState(() {
        thumbnailImageLocalPath = pickedImage.path;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _namedController.dispose();
    _numberController.dispose();
    _bloodController.dispose();
    super.dispose();
  }

  void _authenticate(bool tag) async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Please wait', dismissOnTap: false);
      final email = _emailController.text;
      final password = _passwordController.text;
      UserCredential userCredential;
      String? downloadUrl;
      try {

        if(tag) {
          userCredential = await AuthService.login(email, password);
        } else {
          userCredential = await AuthService.register(email, password);
        }

        downloadUrl = await _userProvider.uploadImage(thumbnailImageLocalPath!);
        if(!tag) {

          final donorModel = DonarModel(
            donorId: userCredential.user!.uid,
            email: userCredential.user!.email!,
            donorName: _namedController.text,
            areaCategory: areaCategoryModel!,
            bloodCategory: bloodCategoryModel!,
            bloodGroup: _bloodController.text,
            thumbnailImageUrl: downloadUrl,
            number: _numberController.hashCode,

          );
          await userProvider.addUser(donorModel);
        }
        EasyLoading.dismiss();
        Navigator.pushReplacementNamed(context, DonarLauncherPage.routeName);

      } on FirebaseAuthException catch (error) {
        EasyLoading.dismiss();
        setState(() {
          _errMsg = error.message!;
        });
      }
    }
  }
  }

  void _signInWithGoogle() async {

  }



