import 'package:flutter/material.dart';
import 'package:musickuy_app/constant/constant_color.dart';
import 'package:musickuy_app/constant/constant_text_style.dart';

class CardSlider extends StatelessWidget {
  const CardSlider({
    super.key,
    required this.imageUrl,
    required this.contentWidget,
   // this.isCenter = false,
  });

  final String imageUrl;
  final Widget contentWidget;
 // final bool? isCenter;

  @override
 Widget build(BuildContext context) {
  return Container(
    child: SizedBox(
      child: Card(
        color: tealColor,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            contentWidget,
              Image.asset(
                imageUrl,
                width: 140,
                height: 140, // Mengatur lebar dari gambar
              )
            ],
          ),
        ),
      ),
    ),
  );
}
}




 

