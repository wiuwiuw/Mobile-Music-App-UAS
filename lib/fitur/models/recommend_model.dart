class PlaylistModel {
  final String label;
  final String rating;
  final String imageUrl;
  final String price;
  final String tag;

  PlaylistModel({
    required this.imageUrl,
    required this.label,
    required this.price,
    required this.rating,
    required this.tag,
  });

  factory PlaylistModel.fromJson(Map<String, dynamic> json) => PlaylistModel(
      imageUrl: json['imageUrl'],
      label: json['label'],
      price: json['price'],
      rating: json['rating'],
      tag: json['tag']);

  Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'label': label,
      'price': price,
      'rating': rating,
      'tag': tag,
    };
  }

  PlaylistModel copyWith({
    String? imageUrl,
    String? label,
    String? price,
    String? rating,
    String? tag,
  }) {
    return PlaylistModel(
        imageUrl: imageUrl ?? this.imageUrl,
        label: label ?? this.label,
        price: price ?? this.price,
        rating: rating ?? this.rating,
        tag: tag ?? this.tag);
  }
}
