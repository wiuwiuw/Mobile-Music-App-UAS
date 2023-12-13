import 'package:musickuy_app/fitur/models/penyanyi_model.dart';

class MusikModel {
  final String judul;
  final PenyanyiModel restoModel;
  final double imageMusik;

  MusikModel({
    required this.judul,
    required this.restoModel,
    required this.imageMusik,
  });

  factory MusikModel.fromJson(Map<String, dynamic> json) {
    return MusikModel(
        judul: json["judul"],
        restoModel: PenyanyiModel.fromJson(json["resto"]),
        imageMusik: json["image_musik"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "judul": judul,
       "resto": restoModel.toJson(),
      "image_musik": imageMusik,
    };
  }
}
