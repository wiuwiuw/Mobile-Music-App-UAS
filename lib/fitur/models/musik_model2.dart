enum PageTypee { onlyForYou,fastTrack,musik, other }

class MusikModel2 {

  final String musikId;  
  final String judul;
  final String penyanyi;
  final String musikImage;
  final double durasi;
  final PageTypee pageTypee;

  MusikModel2({

    required this.musikId,
    required this.judul,
    required this.penyanyi,
    required this.musikImage,
    required this.durasi,
    required this.pageTypee,
  });

  factory MusikModel2.fromJson(Map<String, dynamic> json) {
    return MusikModel2(
        judul: json["judul"],
        musikId: json["id_musik"],
        penyanyi: json["penyanyi"],
        musikImage: json["musik_image"],
        durasi: json["durasi"],
        pageTypee: PageTypee.values.firstWhere(
            (element) => element.toString() == json["page_type"],
            orElse: () => PageTypee.musik),);
  }

  Map<String, dynamic> toJson() {
    return {
      "judul": judul,
      "musik_id": musikId,
      "penyanyi": penyanyi,
      "musik_image": musikImage,
      "durasi": durasi,
      "page_type": pageTypee.toString()
    };
  }
}
