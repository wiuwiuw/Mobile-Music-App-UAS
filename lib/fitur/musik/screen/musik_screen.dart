import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musickuy_app/constant/constant_color.dart';
import 'package:musickuy_app/constant/constant_text_style.dart';
import 'package:musickuy_app/fitur/promo/controller/musik_controller.dart';
import 'package:musickuy_app/fitur/promo/widgets/only_for_you_card.dart';
import 'package:musickuy_app/fitur/promo/widgets/fast_track_card.dart';
import 'package:musickuy_app/route/route_name.dart';
import 'package:musickuy_app/fitur/models/musik_model2.dart';

class PromoScreen extends StatelessWidget {
  PromoScreen({super.key});

  final PromoController promoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(horizontal: 36),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Banyak musik yang bikin kamu good mood!',
                      style: ConstantTextStyle.stylePoppins(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      height: 3,
                      width: 100,
                      color: tealColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Only For You',
                          style: ConstantTextStyle.stylePoppins(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              'See All',
                              style: ConstantTextStyle.stylePoppins(
                                fontWeight: FontWeight.w600,
                                color: tealColor,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            const Icon(
                              Icons.chevron_right,
                              size: 24,
                              color: tealColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: promoController.musikList.length,
                      itemBuilder: (context, index) {
                        final data = promoController.musikList[index];
                        return InkWell(
                          onTap: () {
                            Get.toNamed(RouteName.playScreen, arguments: {
                              'id_musik': data.musikId,
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: OnlyForYouCard(
                              imageUrl: data.musikImage,
                              judul: data.judul,
                              penyanyi: data.penyanyi,
                              durasi: data.durasi.toString(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Fast Track',
                          style: ConstantTextStyle.stylePoppins(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          children: [
                            Text(
                              'See All',
                              style: ConstantTextStyle.stylePoppins(
                                fontWeight: FontWeight.w600,
                                color: tealColor,
                              ),
                            ),
                            const SizedBox(
                              width: 2,
                            ),
                            const Icon(
                              Icons.chevron_right,
                              size: 24,
                              color: tealColor,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 325,
                    child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, // Jumlah kolom yang diinginkan
                        crossAxisSpacing: 10.0, // Jarak antar kolom
                      ),
                      itemCount: promoController.musikFT.length,
                      itemBuilder: (context, index) {
                        final data = promoController.musikFT[index];
                        return InkWell(
                          onTap: () {
                            Get.toNamed(RouteName.playScreen, arguments: {
                              'id_musik': data.musikId,
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: FastTrackCard(
                              imageUrl: data.musikImage,
                              judul: data.judul,
                              penyanyi: data.penyanyi,
                              durasi: data.durasi.toString(),
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
