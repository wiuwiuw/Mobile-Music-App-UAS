import 'package:flutter/material.dart';
import 'package:musickuy_app/constant/constant_color.dart';
import 'package:musickuy_app/constant/constant_text_style.dart';

class OnlyForYouCard extends StatelessWidget {
  const OnlyForYouCard({
    super.key,
    required this.judul,
    required this.penyanyi,
    required this.imageUrl,
    required this.durasi,
  });

  final String judul;
  final String penyanyi;
  final String imageUrl;
  final String durasi;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      height: 120,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Text(
                  judul,
                  style: ConstantTextStyle.stylePoppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  penyanyi, // Tambahkan teks penyanyi di sini
                  style: ConstantTextStyle.stylePoppins(
                    fontWeight: FontWeight.w300,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
