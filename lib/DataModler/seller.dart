class Seller {
  String? username;
  String? firstName;
  String? lastName;
  String? bio;
  String? profilePicture;
  String? userCity;
  String? userState;
  String? userCountry;
  String? averageRating;
  int? totalProjectsCompleted;

  Seller(
      {this.username,
      this.firstName,
      this.lastName,
      this.bio,
      this.profilePicture,
      this.userCity,
      this.userState,
      this.userCountry,
      this.averageRating,
      this.totalProjectsCompleted});

  Seller.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    bio = json['bio'];
    profilePicture = json['profile_picture'];
    userCity = json['user_city'];
    userState = json['user_state'];
    userCountry = json['user_country'];
    averageRating = json['average_rating'];
    totalProjectsCompleted = json['total_projects_completed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['bio'] = this.bio;
    data['profile_picture'] = this.profilePicture;
    data['user_city'] = this.userCity;
    data['user_state'] = this.userState;
    data['user_country'] = this.userCountry;
    data['average_rating'] = this.averageRating;
    data['total_projects_completed'] = this.totalProjectsCompleted;
    return data;
  }
}
