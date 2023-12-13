import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musickuy_app/constant/constant_color.dart';
import 'package:musickuy_app/constant/constant_text_style.dart';
import 'package:musickuy_app/fitur/home/controller/home_controller.dart';
import 'package:musickuy_app/fitur/home/widgets/category_widget.dart';
import 'package:musickuy_app/fitur/home/widgets/favorite_card.dart';
import 'package:musickuy_app/fitur/home/widgets/header_widget.dart';
import 'package:musickuy_app/fitur/home/widgets/search_widget.dart';
import 'package:musickuy_app/fitur/home/widgets/slider.dart';
import 'package:musickuy_app/route/route_name.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Obx(
        () {
          if (_homeController.isLoading.isTrue) {
            return SizedBox(
              height: Get.size.height,
              child: const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            );
          }
          return SingleChildScrollView(
            child: SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Obx(() {
                    if (_homeController.isLoadingGetUser.isTrue) {
                      return const SizedBox();
                    }
                    return HeaderWidget(
                      userModel: _homeController.userModel.value,
                    );
                  }),
                  const SizedBox(
                    height: 2,
                  ),
                  const SearchWidget(),
                  const SizedBox(
                    height: 10,
                  ),
                  CarouselSlider(homeController: _homeController),
                  const SizedBox(
                    height: 20,
                  ),
                  CategoryWidget(homeController: _homeController),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Playlist Terbaru!',
                          style: ConstantTextStyle.stylePoppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height:
                              400, // Sesuaikan dengan tinggi yang diinginkan
                          child: GridView.builder(
                            scrollDirection: Axis.vertical,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, // Jumlah kolom
                              crossAxisSpacing: 10.0, // Jarak antar kolom
                              mainAxisSpacing: 10.0, // Jarak antar baris
                            ),
                            itemCount:
                                _homeController.favoritePlaylistList.length,
                            itemBuilder: (context, index) {
                              final data =
                                  _homeController.favoritePlaylistList[index];
                              return InkWell(
                                onTap: () {
                                  Get.toNamed(RouteName.detailScreen,
                                      arguments: {
                                        'playlist_id': data.playlistId,
                                      });
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      right:
                                          15), // Tambahkan jarak di sebelah kanan
                                  child: FavoriteCard(
                                    imageUrl: data.playlistImage,
                                    label: data.namaPlaylist,
                                    listens: data.listens,
                                    rating: data.rating.toString(),
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
