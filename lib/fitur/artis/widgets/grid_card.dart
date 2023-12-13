import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:musickuy_app/constant/constant_color.dart';
import 'package:musickuy_app/constant/constant_text_style.dart';
import 'package:musickuy_app/fitur/favourite/controller/artis_controller.dart';

class GridCard extends StatelessWidget {
  const GridCard(
      {super.key,
      required this.imagePenyanyi,
      required this.nama,});


  final String nama;
  final String imagePenyanyi;

  @override
  Widget build(BuildContext context) {
    
    return Container(
            child: Container(
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                      image: NetworkImage(imagePenyanyi), fit: BoxFit.cover)),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                    ),
                    child: Text(
                      nama,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          );
  }
}
