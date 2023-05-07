import 'package:blood_donate_app/admin/model/area_catagory_model.dart';
import 'package:blood_donate_app/admin/model/blood_catagory_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../user/models/user_model.dart';


class DbHelper {
  static const String collectionAdmin = 'Admins';

  static final _db = FirebaseFirestore.instance;

  static Future<bool> isAdmin(String uid) async {
    final snapshot = await _db.collection(collectionAdmin).doc(uid).get();
    return snapshot.exists;
  }

  static Future<void> addCategory(AreaCategoryModel areaCategoryModel) {
    final doc = _db.collection(areaCategory).doc();
    areaCategoryModel.areacategoryId=doc.id;
    return doc.set(areaCategoryModel.toMap());
  }

  static Future<void> addbloodCategory(BloodCategoryModel bloodCategoryModel) {
    final doc = _db.collection(bloodCategory).doc();
    bloodCategoryModel.bloodcategoryId= doc.id;
    return doc.set(bloodCategoryModel.toMap());
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllDonor() =>
      _db.collection(donarCollection)
          .snapshots();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllDonorByBloodCategory(
      BloodCategoryModel bloodCategoryModel) =>
      _db
          .collection(areaCategory)
          .where(bloodcategoryFieldName,
          isEqualTo: bloodCategoryModel.bloodcategoryId)
          // .where(productFieldAvailable, isEqualTo: true)
          .snapshots();


  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllDonorByAreaCategory(
      AreaCategoryModel areaCategoryModel) =>
      _db
          .collection(areaCategory)
          .where(areacategoryFieldName,
          isEqualTo: areaCategoryModel.areacategoryId)
      // .where(productFieldAvailable, isEqualTo: true)
          .snapshots();


  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllAreaCategories() =>
      _db.collection(areaCategory).snapshots();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllBloodCategories() =>
      _db.collection(bloodCategory).snapshots();

}