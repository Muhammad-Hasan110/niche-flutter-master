class Buyer {
  int? userId;
  String? username;
  String? email;
  String? firstName;
  String? lastName;
  String? bio;
  String? profilePicture;
  String? registrationDate;
  String? role;
  String? userPhone;
  String? userAddress;
  String? userCity;
  String? userState;
  String? userCountry;
  String? userZipcode;

  Buyer(
      {this.userId,
      this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.bio,
      this.profilePicture,
      this.registrationDate,
      this.role,
      this.userPhone,
      this.userAddress,
      this.userCity,
      this.userState,
      this.userCountry,
      this.userZipcode});

  Buyer.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    bio = json['bio'];
    profilePicture = json['profile_picture'];
    registrationDate = json['registration_date'];
    role = json['role'];
    userPhone = json['user_phone'];
    userAddress = json['user_address'];
    userCity = json['user_city'];
    userState = json['user_state'];
    userCountry = json['user_country'];
    userZipcode = json['user_zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['bio'] = this.bio;
    data['profile_picture'] = this.profilePicture;
    data['registration_date'] = this.registrationDate;
    data['role'] = this.role;
    data['user_phone'] = this.userPhone;
    data['user_address'] = this.userAddress;
    data['user_city'] = this.userCity;
    data['user_state'] = this.userState;
    data['user_country'] = this.userCountry;
    data['user_zipcode'] = this.userZipcode;
    return data;
  }
}