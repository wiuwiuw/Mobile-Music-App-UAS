class PenyanyiModel {
  final String nama;
  final String imagePenyanyi;
  final String idPenyanyi;

  PenyanyiModel({
    required this.nama,
    required this.imagePenyanyi,
    required this.idPenyanyi,
  });

  factory PenyanyiModel.fromJson(Map<String, dynamic> json) {
    return PenyanyiModel(
        nama: json["nama"],
        imagePenyanyi: json["image_penyanyi"], 
        idPenyanyi: json["id_penyanyi"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "nama": nama,
      "image_penyanyi": imagePenyanyi,
      "id_penyanyi": idPenyanyi,
    };
  }
}
