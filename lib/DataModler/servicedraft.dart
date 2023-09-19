class Draft {
  int? serviceId;
  int? sellerId;
  int? subCategoryId;
  String? serviceTitle;
  String? serviceDescription;
  String? servicePrice;
  int? duration;
  String? serviceImage;
  int? isDraft;
  int? isFeatured;
  int? totalProjectsCompleted;
  int? totalRating;

  Draft(
      {this.serviceId,
      this.sellerId,
      this.subCategoryId,
      this.serviceTitle,
      this.serviceDescription,
      this.servicePrice,
      this.duration,
      this.serviceImage,
      this.isDraft,
      this.isFeatured,
      this.totalProjectsCompleted,
      this.totalRating});

  Draft.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    sellerId = json['seller_id'];
    subCategoryId = json['subCategory_id'];
    serviceTitle = json['service_title'];
    serviceDescription = json['service_description'];
    servicePrice = json['service_price'];
    duration = json['duration'];
    serviceImage = json['service_image'];
    isDraft = json['is_draft'];
    isFeatured = json['is_featured'];
    totalProjectsCompleted = json['total_projects_completed'];
    totalRating = json['total_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['seller_id'] = this.sellerId;
    data['subCategory_id'] = this.subCategoryId;
    data['service_title'] = this.serviceTitle;
    data['service_description'] = this.serviceDescription;
    data['service_price'] = this.servicePrice;
    data['duration'] = this.duration;
    data['service_image'] = this.serviceImage;
    data['is_draft'] = this.isDraft;
    data['is_featured'] = this.isFeatured;
    data['total_projects_completed'] = this.totalProjectsCompleted;
    data['total_rating'] = this.totalRating;
    return data;
  }
}