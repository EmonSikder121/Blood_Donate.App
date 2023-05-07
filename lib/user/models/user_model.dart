import 'package:blood_donate_app/admin/model/area_catagory_model.dart';
import 'package:blood_donate_app/admin/model/blood_catagory_model.dart';
const String donarCollection = 'Donar';
const String donarFieldid = 'donarId';
const String donarFieldname = 'name';
const String donarFieldNumber = 'number';
const String donarFieldemail = 'email';
const String donarFieldbloodgroup = 'donarblood';
const String donorFieldarealist = 'area';
const String donarFieldBloodgrouplist = 'bloodGrouplist';
const String donarFieldimage = 'image';
const String donarFieldAvelable = 'avelable';




class DonarModel {
  String? donorId;
  String donorName;
  AreaCategoryModel areaCategory;
  BloodCategoryModel bloodCategory;
  String bloodGroup;
  String thumbnailImageUrl;
  num number;
  String email;
  bool available;

  DonarModel({
      this.donorId,
      required this.donorName,
      required this.areaCategory,
      required this.bloodCategory,
      required this.bloodGroup,
      required this.thumbnailImageUrl,
      required this.number,
      required this.email,
      this.available= true
  });

  Map<String, dynamic> toMap() {
    return <String,dynamic>{
      donarFieldid:donorId,
      donarFieldname:donorName,
      donarFieldNumber:number,
      donarFieldemail:email,
      donarFieldbloodgroup:bloodGroup,
      donarFieldimage:thumbnailImageUrl,
      donorFieldarealist:areaCategory.toMap(),
      donarFieldBloodgrouplist:bloodCategory.toMap(),
      donarFieldAvelable:available

    };
  }

  factory DonarModel.fromMap(Map<String,dynamic> map) => DonarModel(
    donorId: map[donarFieldid],
    donorName: map[donarFieldname],
    number: map[donarFieldNumber],
    email: map[donarFieldemail],
    thumbnailImageUrl: map[donarFieldimage],
    areaCategory:AreaCategoryModel.fromMap(map[donorFieldarealist]) ,
    bloodCategory:BloodCategoryModel.fromMap( map[donarFieldBloodgrouplist]),
    bloodGroup: map[donarFieldbloodgroup],
    available: map[donarFieldAvelable]
  );

}
