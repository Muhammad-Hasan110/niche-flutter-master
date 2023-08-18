class SubCategory {
  int? subCategoryId;
  String? subCategoryName;
  int? parentId;
  String? subCategoryImage;

  SubCategory(
      {this.subCategoryId,
      this.subCategoryName,
      this.parentId,
      this.subCategoryImage});

  SubCategory.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['subCategory_id'];
    subCategoryName = json['subCategory_name'];
    parentId = json['parent_id'];
    subCategoryImage = json['subCategory_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subCategory_id'] = this.subCategoryId;
    data['subCategory_name'] = this.subCategoryName;
    data['parent_id'] = this.parentId;
    data['subCategory_image'] = this.subCategoryImage;
    return data;
  }
}
