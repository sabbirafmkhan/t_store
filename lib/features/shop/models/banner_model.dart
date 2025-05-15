class BannerModel {
  final String id; // Add the required 'id' parameter
  final String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.id, // Mark 'id' as required
    required this.imageUrl,
    required this.targetScreen,
    required this.active,
  });
}