const String bloodCategory = 'Blood List';

const String bloodcategoryFieldId = 'bloodcategoryId';
const String bloodcategoryFieldName = 'bloodcategoryName';


class BloodCategoryModel {
  String? bloodcategoryId;
  String bloodcategoryName;


  BloodCategoryModel({
    this.bloodcategoryId,
    required this.bloodcategoryName,

  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      bloodcategoryFieldId: bloodcategoryId,
      bloodcategoryFieldName: bloodcategoryName,

    };
  }

  factory BloodCategoryModel.fromMap(Map<String, dynamic> map) => BloodCategoryModel(
    bloodcategoryId: map[bloodcategoryFieldId],
    bloodcategoryName: map[bloodcategoryFieldName],

  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is BloodCategoryModel &&
              runtimeType == other.runtimeType &&
              bloodcategoryId == other.bloodcategoryId;

  @override
  int get hashCode => bloodcategoryId.hashCode;
}
