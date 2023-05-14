import 'dart:io';

import 'package:blood_donate_app/user/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import '../admin/admin_auth/admin_auth.dart';
import '../dbHelper/Dbhelper.dart';


class UserProvider extends ChangeNotifier {
  DonarModel? donarModel;

  Future<void> addUser(DonarModel donarModel) {
    return DbHelper.addUser(donarModel);
  }


  getUserInfo() {
    DbHelper.getUserInfo(AuthService.currentUser!.uid).listen((snapshot) {
      if (snapshot.exists) {
        donarModel = DonarModel.fromMap(snapshot.data()!);
        notifyListeners();
      }
    });
  }

  Future<String> uploadImage(String thumbnailImageLocalPath) async {
    final photoRef = FirebaseStorage.instance
        .ref()
        .child('ProductImages/${DateTime.now().millisecondsSinceEpoch}');
    final uploadTask = photoRef.putFile(File(thumbnailImageLocalPath));
    final snapshot = await uploadTask.whenComplete(() => null);
    return snapshot.ref.getDownloadURL();
  }

  // Future<void> updateUserProfileField(String field, dynamic value) =>
  //     DbHelper.updateUserProfileField(
  //         AuthService.currentUser!.uid, {field: value});
  //
  // Future<bool> doesUserExist(String uid) => DbHelper.doesUserExist(uid);
}
