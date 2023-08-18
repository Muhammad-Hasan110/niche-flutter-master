class User {
  int userId;
  String username;
  String email;
  String firstName;
  String lastName;
  String bio;
  String profilePicture;
  DateTime registrationDate;
  String role;
  String userPhone;
  String userAddress;
  String userCity;
  String userState;
  String userCountry;
  String userZipcode;

  User({
    required this.userId,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.bio,
    required this.profilePicture,
    required this.registrationDate,
    required this.role,
    required this.userPhone,
    required this.userAddress,
    required this.userCity,
    required this.userState,
    required this.userCountry,
    required this.userZipcode,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userId: json['user_id'],
      username: json['username'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      bio: json['bio'],
      profilePicture: json['profile_picture'],
      registrationDate: DateTime.parse(json['registration_date']),
      role: json['role'],
      userPhone: json['user_phone'],
      userAddress: json['user_address'],
      userCity: json['user_city'],
      userState: json['user_state'],
      userCountry: json['user_country'],
      userZipcode: json['user_zipcode'],
    );
  }
}
