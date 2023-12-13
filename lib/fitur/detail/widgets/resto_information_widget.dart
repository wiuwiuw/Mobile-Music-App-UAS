import 'package:flutter/material.dart';
import 'package:musickuy_app/constant/constant_color.dart';
import 'package:musickuy_app/constant/constant_text_style.dart';
import 'package:musickuy_app/fitur/models/playlist_model.dart';
import 'package:musickuy_app/fitur/detail/controller/detail_controller.dart';

class RestoInformationWidget extends StatelessWidget {
  const RestoInformationWidget({
super.key, required this.playlistModel, required this.detailController
  });

  final PlaylistModel playlistModel;
  final DetailController detailController;
  

  @override
Widget build(BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 35),
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: cardColor,
    ),
    child: Row(
      children: [
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
             "test",   //detailController.playlistModel.value.namaPlaylist,
                style: ConstantTextStyle.stylePoppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 10,
              ),

            ],
          ),
        ),
      ],
    ),
  );
}

}
