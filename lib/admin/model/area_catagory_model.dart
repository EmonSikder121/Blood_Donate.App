const String areaCategory = 'Area List';
const String areacategoryFieldId = 'areacategoryId';
const String areacategoryFieldName = 'areacategoryName';


class AreaCategoryModel {
  String? areacategoryId;
  String areacategoryName;


  AreaCategoryModel({
    this.areacategoryId,
    required this.areacategoryName,

  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      areacategoryFieldId: areacategoryId,
      areacategoryFieldName: areacategoryName,
    };
  }

  factory AreaCategoryModel.fromMap(Map <String, dynamic> map) => AreaCategoryModel(
    areacategoryId: map[areacategoryFieldId],
    areacategoryName: map[areacategoryFieldName],
  );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is AreaCategoryModel &&
              runtimeType == other.runtimeType &&
              areacategoryId == other.areacategoryId;

  @override
  int get hashCode => areacategoryId.hashCode;
}
