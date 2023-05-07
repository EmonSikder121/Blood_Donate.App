import 'dart:io';
import 'package:blood_donate_app/user/models/user_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

import '../admin/model/area_catagory_model.dart';
import '../admin/model/blood_catagory_model.dart';
import '../dbHelper/Dbhelper.dart';


class AdminProvider extends ChangeNotifier {
  List<AreaCategoryModel> AreaCategoryList = [];
  List<BloodCategoryModel> BloodCategoryList = [];
  List<DonarModel> DonorList = [];

  Future<void> addNewCategory(String category) {
    final areacategoryModel = AreaCategoryModel(areacategoryName: category);
    return DbHelper.addCategory(areacategoryModel);
  }

  Future<void> addNewbloodCategory(String category) {
    final bloodcategory = BloodCategoryModel(bloodcategoryName: category);
    return DbHelper.addbloodCategory(bloodcategory);
  }

  getAllAreaCategories() {
    DbHelper.getAllAreaCategories().listen((snapshot) {
      AreaCategoryList = List.generate(snapshot.docs.length,
              (index) => AreaCategoryModel.fromMap(snapshot.docs[index].data()));

    });
  }

  getAllBloodCategories() {
    DbHelper.getAllBloodCategories().listen((snapshot) {
      BloodCategoryList = List.generate(snapshot.docs.length,
              (index) => BloodCategoryModel.fromMap(snapshot.docs[index].data()));

    });
  }


  List<AreaCategoryModel> getAreaListForFiltering() {
    return [AreaCategoryModel(areacategoryName: "All"), ...AreaCategoryList];
  }


  List<BloodCategoryModel> getBloodListForFiltering() {
    return [BloodCategoryModel(bloodcategoryName: "All"), ...BloodCategoryList];
  }



  getAllDonorByBloodCategory(BloodCategoryModel bloodCategoryModel) {
    DbHelper.getAllDonorByBloodCategory(bloodCategoryModel).listen((snapshot) {
      DonorList = List.generate(snapshot.docs.length,
              (index) =>DonarModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }

  getAllDonorByAreaCategory(AreaCategoryModel areaCategoryModel) {
    DbHelper.getAllDonorByAreaCategory(areaCategoryModel).listen((snapshot) {
      DonorList = List.generate(snapshot.docs.length,
              (index) =>DonarModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }


  getAllDonor() {
    DbHelper.getAllDonor().listen((snapshot) {
      DonorList = List.generate(snapshot.docs.length,
              (index) => DonarModel.fromMap(snapshot.docs[index].data()));
      notifyListeners();
    });
  }


  Future<String> uploadImage(String thumbnailImageLocalPath) async {
    final photoRef = FirebaseStorage.instance
        .ref()
        .child('DonorImage/${DateTime.now().millisecondsSinceEpoch}');
    final uploadTask = photoRef.putFile(File(thumbnailImageLocalPath));
    final snapshot = await uploadTask.whenComplete(() => null);
    return snapshot.ref.getDownloadURL();
  }

  Future<void> addUser(DonarModel donarModel) {
    return DbHelper.addUser(donarModel);
  }

}

