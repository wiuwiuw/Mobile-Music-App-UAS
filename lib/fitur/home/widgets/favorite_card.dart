import 'package:flutter/material.dart';
import 'package:musickuy_app/constant/constant_color.dart';
import 'package:musickuy_app/constant/constant_text_style.dart';

class FavoriteCard extends StatelessWidget {
  const FavoriteCard(
      {super.key,
      required this.label,
      required this.imageUrl,
      required this.listens,
      required this.rating});

  final String label;
  final String imageUrl;
  final String listens;
  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: bgColor,
      ),
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
                  label,
                  style: ConstantTextStyle.stylePoppins(
                    fontWeight: FontWeight.w500,
                     fontSize: 12, 
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
