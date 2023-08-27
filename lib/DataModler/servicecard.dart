class Service {
  int? serviceId;
  int? sellerId;
  String? firstName;
  String? lastName;
  String? serviceImage;
  String? servicePrice;
  String? serviceTitle;
  String? serviceDescription;
  int? duration;
  String? profilePicture;
  String? averageRating;
  int? totalProjectsCompleted;
  String? bio;
  String? userAddress;
  String? userCity;
  String? userCountry;
  int? categoryId;
  String? categoryName;
  int? subCategoryId;
  String? subCategoryName;

  Service(
      {this.serviceId,
      this.sellerId,
      this.firstName,
      this.lastName,
      this.serviceImage,
      this.servicePrice,
      this.serviceTitle,
      this.serviceDescription,
      this.duration,
      this.profilePicture,
      this.averageRating,
      this.totalProjectsCompleted,
      this.bio,
      this.userAddress,
      this.userCity,
      this.userCountry,
      this.categoryId,
      this.categoryName,
      this.subCategoryId,
      this.subCategoryName});

  Service.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    sellerId = json['seller_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    serviceImage = json['service_image'];
    servicePrice = json['service_price'];
    serviceTitle = json['service_title'];
    serviceDescription = json['service_description'];
    duration = json['duration'];
    profilePicture = json['profile_picture'];
    averageRating = json['average_rating'];
    totalProjectsCompleted = json['total_projects_completed'];
    bio = json['bio'];
    userAddress = json['user_address'];
    userCity = json['user_city'];
    userCountry = json['user_country'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    subCategoryId = json['subCategory_id'];
    subCategoryName = json['subCategory_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['seller_id'] = this.sellerId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['service_image'] = this.serviceImage;
    data['service_price'] = this.servicePrice;
    data['service_title'] = this.serviceTitle;
    data['service_description'] = this.serviceDescription;
    data['duration'] = this.duration;
    data['profile_picture'] = this.profilePicture;
    data['average_rating'] = this.averageRating;
    data['total_projects_completed'] = this.totalProjectsCompleted;
    data['bio'] = this.bio;
    data['user_address'] = this.userAddress;
    data['user_city'] = this.userCity;
    data['user_country'] = this.userCountry;
    data['category_id'] = this.categoryId;
    data['category_name'] = this.categoryName;
    data['subCategory_id'] = this.subCategoryId;
    data['subCategory_name'] = this.subCategoryName;
    return data;
  }
}
