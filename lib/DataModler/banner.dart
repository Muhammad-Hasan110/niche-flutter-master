class Banners {
  String? bannerImage;
  int? bannerId;

  Banners({this.bannerImage, this.bannerId});

  Banners.fromJson(Map<String, dynamic> json) {
    bannerImage = json['banner_image'];
    bannerId = json['banner_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['banner_image'] = this.bannerImage;
    data['banner_id'] = this.bannerId;
    return data;
  }
}
