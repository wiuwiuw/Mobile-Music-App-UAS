import 'package:flutter/material.dart';
import 'package:musickuy_app/constant/constant_color.dart';
import 'package:musickuy_app/constant/constant_text_style.dart';

class MusikCard extends StatelessWidget {
  const MusikCard(
      {super.key,
      required this.judul,
      required this.penyanyi,
      required this.imageUrl,
      required this.durasi});

  final String judul;
  final String penyanyi;
  final String imageUrl;
  final String durasi;

 @override
Widget build(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 2, horizontal: 18),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
    child: Row(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(imageUrl),
            ),
          ),
        ),
        const SizedBox(
          width: 10, // Jarak antara gambar dan teks
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                judul,
                style: ConstantTextStyle.stylePoppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Text(
                    penyanyi,
                    style: ConstantTextStyle.stylePoppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const Text(
                    ' • ',
                    style: TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    durasi,
                    style: ConstantTextStyle.stylePoppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        IconButton(
          padding: const EdgeInsets.only(left: 25),
          onPressed: () {
            // Tambahkan aksi yang ingin dilakukan saat ikon titik tiga diklik
          },
          icon: Icon(
            Icons.more_vert,
            color: Colors.white,
            size: 15,
          ),
        ),
      ],
    ),
  );
}


}
