

class UserModel {
  final String id;
  final String uid;
  final String accessToken;
  final String token;
  final String fullName;
  final String userName;
  final String email;
  final String password;
  final String photoUrl;
  final DateTime createdAt;
  final List<dynamic> productFavorite;
    final List<dynamic> playlistFavorite;

  UserModel({
    required this.id,
    required this.uid,
    required this.accessToken,
    required this.token,
    required this.fullName,
    required this.userName,
    required this.email,
    required this.password,
    required this.createdAt,
    required this.productFavorite,
    required this.playlistFavorite,
    required this.photoUrl,
  });

  UserModel copyWith({
    String? id,
    String? uid,
    String? accessToken,
    String? token,
    String? fullName,
    String? userName,
    String? email,
    String? password,
    String? photoUrl,
    DateTime? createdAt,
    List<dynamic>? productFavorite,
  }) {
    return UserModel(
        id: id ?? this.id,
        uid: uid ?? this.uid,
        accessToken: accessToken ?? this.accessToken,
        token: token ?? this.token,
        fullName: fullName ?? this.fullName,
        userName: userName ?? this.userName,
        email: email ?? this.email,
        password: password ?? this.password,
        createdAt: createdAt ?? this.createdAt,
        productFavorite: productFavorite ?? this.productFavorite,
        playlistFavorite: playlistFavorite ?? this.playlistFavorite,
        photoUrl: photoUrl ?? this.photoUrl);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json['id'],
        uid: json['uid'],
        accessToken: json['accessToken'],
        token: json['token'],
        fullName: json['fullName'],
        userName: json['userName'],
        createdAt: DateTime.parse(json['createdAt']),
        email: json['email'],
        password: json['password'],
        photoUrl: json['photoUrl'],
        productFavorite: json['productFavorite'],
        playlistFavorite: json['playlistFavorite']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uid': uid,
      'fullName': fullName,
      'userName': userName,
      'token': token,
      'accessToken': accessToken,
      'createdAt': createdAt.toIso8601String(),
      'email': email,
      'password': password,
      'photoUrl': photoUrl,
      'productFavorite': productFavorite,
      'playlistFavorite': productFavorite,
    };
  }
}
