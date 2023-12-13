import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musickuy_app/constant/constant_color.dart';
import 'package:musickuy_app/constant/constant_text_style.dart';
import 'package:musickuy_app/fitur/favourite/controller/artis_controller.dart';
import 'package:musickuy_app/fitur/favourite/widgets/grid_card.dart';
import 'package:musickuy_app/fitur/favourite/widgets/list_card.dart';

class FavouriteScreen extends StatelessWidget {
  FavouriteScreen({super.key});

  final FavoriteController _penyanyiController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 36), // Tambahkan padding di sini
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20), // Tambahkan padding di sini
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Artis',
                                style: ConstantTextStyle.stylePoppins(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                width: 90,
                                height: 3,
                                color: tealColor,
                              ),
                            ],
                          ),
                          Obx(() => IconButton(
                              onPressed: () => _penyanyiController.toggleIsGrid(),
                              icon: Icon(
                                _penyanyiController.isGrid.isFalse
                                    ? Icons.grid_view
                                    : Icons.list,
                                size: 32,
                                color: whiteColor,
                              )))
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                    ],
                  ),
                ),
              ),
              Obx(() {
                if (_penyanyiController.isGrid.isTrue) {
                  return SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.85,
                      crossAxisSpacing: 14,
                      mainAxisSpacing: 14,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final data = _penyanyiController.penyanyi[index];
                        return GridCard(
                          nama: data.nama,
                          imagePenyanyi: data.imagePenyanyi,
                        );
                      },
                      childCount: _penyanyiController.penyanyi.length,
                    ),
                  );
                }
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final data = _penyanyiController.penyanyi[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListCard(
                          nama: data.nama,
                          imagePenyanyi: data.imagePenyanyi,
                        ),
                      );
                    },
                    childCount: _penyanyiController.penyanyi.length,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}


