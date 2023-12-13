import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musickuy_app/constant/constant_color.dart';
import 'package:musickuy_app/constant/constant_text_style.dart';
import 'package:musickuy_app/fitur/detail/controller/detail_controller.dart';
import 'package:musickuy_app/fitur/models/playlist_model.dart';

class HeaderDetailWidget extends StatelessWidget {
  const HeaderDetailWidget({
    Key? key,
    required this.playlistModel,
    required this.detailController,
  }) : super(key: key);

  final PlaylistModel playlistModel;
  final DetailController detailController;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: bgColor, // Ganti dengan warna latar belakang utama
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(18),
              bottomRight: Radius.circular(18),
            ),
          ),
          child: Center(
            child: Container(
              height: 150, // Sesuaikan tinggi kotak gambar
              width: 150, // Sesuaikan lebar kotak gambar
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  image: NetworkImage(playlistModel.playlistImage),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 45,
          left: 25,
          right: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Get.back(),
                child: const Icon(
                  Icons.arrow_back,
                  color: whiteColor,
                  size: 36,
                ),
              ),
              Obx(() => detailController.isLoadingFavorite.isTrue
                  ? const SizedBox()
                  : InkWell(
                      onTap: () => detailController
                          .handleFavorite(playlistModel.playlistId),
                      child: Icon(
                        detailController.userModel!.productFavorite
                                .contains(playlistModel.playlistId)
                            ? Icons.favorite
                            : Icons.favorite_outline,
                        color: Colors.red,
                        size: 30,
                      ),
                    )),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          left: 15,
          right: 15,
          child: Container(
            padding: const EdgeInsets.all(2),
            color: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  playlistModel.namaPlaylist,
                  style: ConstantTextStyle.stylePoppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: whiteColor,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          playlistModel.listens,
                          style: ConstantTextStyle.stylePoppins(
                            fontSize:
                                12, // Sesuaikan dengan ukuran yang diinginkan
                            fontWeight: FontWeight.w500,
                            color: whiteColor,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          "juta didengarkan",
                          style: ConstantTextStyle.stylePoppins(
                            fontSize:
                                12, // Sesuaikan dengan ukuran yang diinginkan
                            color: whiteColor,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 24,
                          color: Colors.yellow.shade800,
                        ),
                        const SizedBox(
                          width: 3,
                        ),
                        Text(
                          playlistModel.rating.toString(),
                          style: ConstantTextStyle.stylePoppins(
                            fontWeight: FontWeight.w600,
                            color: whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
