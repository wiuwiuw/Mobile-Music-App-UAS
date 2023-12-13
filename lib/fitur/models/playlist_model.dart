import 'package:musickuy_app/fitur/models/penyanyi_model.dart';

enum Type { foryou, popular, playlist, penyanyi,musik, other }

class PlaylistModel {
  final String namaPlaylist;
  final String listens;
  final double rating;
  final String playlistImage;
  final String playlistId;
  final Type type;

  PlaylistModel({
    required this.listens,
    required this.playlistId,
    required this.playlistImage,
    required this.namaPlaylist,
    required this.type,
    required this.rating,
  });

  factory PlaylistModel.fromJson(Map<String, dynamic> json) {
    return PlaylistModel(
        listens: json["listens"],
        playlistId: json["playlist_id"],
        playlistImage: json["playlist_image"],
        namaPlaylist: json["nama_playlist"],
        type: Type.values.firstWhere(
            (element) => element.toString() == json["type"],
            orElse: () => Type.playlist),
        rating: json["rating"]);

  }

  Map<String, dynamic> toJson() {
    return {
      "listens": listens,
      "playlist_id": playlistId,
      "nama_playlist": namaPlaylist,
      "playlist_image": playlistImage,
      "rating": rating,
      "page_type": type.toString(),
    };
  }
}
