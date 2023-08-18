class ServiceData {
  final int subcategoryId;
  final String serviceTitle;
  final String serviceDescription;
  final double servicePrice;
  final int duration;
  final String imagePath; // Path to the image file

  ServiceData({
    required this.subcategoryId,
    required this.serviceTitle,
    required this.serviceDescription,
    required this.servicePrice,
    required this.duration,
    required this.imagePath,
  });
}
