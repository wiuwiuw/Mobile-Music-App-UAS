import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musickuy_app/constant/constant_color.dart';
import 'package:musickuy_app/constant/constant_text_style.dart';
import 'package:musickuy_app/fitur/detail/controller/detail_controller.dart';
import 'package:musickuy_app/fitur/detail/widgets/chip_resto_widget.dart';
import 'package:musickuy_app/fitur/detail/widgets/musik_card.dart';
import 'package:musickuy_app/fitur/detail/widgets/header_detail_widget.dart';
import 'package:musickuy_app/fitur/detail/widgets/resto_information_widget.dart';
import 'package:musickuy_app/route/route_name.dart';

class DetailScreen extends StatelessWidget {
  DetailScreen({
    super.key,
  });

  final DetailController detailController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Obx(
        () {
          if (detailController.isLoading.isTrue) {
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }
          return SingleChildScrollView(
            child: Column(
              children: [
                HeaderDetailWidget(
                    detailController: detailController,
                    playlistModel: detailController.playlistModel.value),
                SizedBox(
                  height: 500,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical, // Ubah ke Axis.vertical
                    itemCount: detailController.musikList.length,
                    itemBuilder: (context, index) {
                      final data = detailController.musikList[index];
                      return InkWell(
                        onTap: () {
                          Get.toNamed(RouteName.playScreen, arguments: {
                            'id_musik': data.musikId,
                          });
                        },
                        child: MusikCard(
                          imageUrl: data.musikImage,
                          judul: data.judul,
                          penyanyi: data.penyanyi,
                          durasi: data.durasi.toString(),
                          
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
