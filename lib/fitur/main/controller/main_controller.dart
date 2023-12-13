import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musickuy_app/constant/constant_color.dart';
import 'package:musickuy_app/constant/constant_text_style.dart';
import 'package:musickuy_app/fitur/favourite/screen/artis_screen.dart';
import 'package:musickuy_app/fitur/home/screen/home_screen.dart';
import 'package:musickuy_app/fitur/profile/screen/profile_screen.dart';
import 'package:musickuy_app/fitur/promo/screen/musik_screen.dart';

class MainController extends GetxController {
  final RxInt _indexBottomNavbar = 0.obs;
  RxInt get indexBottomNavbar => _indexBottomNavbar;

  void changeIndex(int val) {
    _indexBottomNavbar.value = val;
  }

final List<BottomNavigationBarItem> listBottomNav = [
    BottomNavigationBarItem(
      backgroundColor: bgColor,
      label: '',
      activeIcon: Container(
        height: 25,
        margin: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            ClipOval(
              child: Container(
                width: 6,
                height: 6,
                color: whiteColor,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              'Home',
              style: ConstantTextStyle.stylePoppins(
                fontSize: 15,
                color: whiteColor,
              ),
            )
          ],
        ),
      ),
      icon: Container(
        margin: const EdgeInsets.only(top: 7),
        width: 25,
        height: 25,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/home_icon.png'),
          ),
        ),
      ),
    ),
    BottomNavigationBarItem(
      label: '',
      activeIcon: Container(
        height: 25,
        margin: const EdgeInsets.only(top: 15),
        child: Column(
          children: [
            ClipOval(
              child: Container(
                width: 6,
                height: 6,
                color: whiteColor,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              'Musik',
              style: ConstantTextStyle.stylePoppins(
                fontSize: 15,
                color: whiteColor,
              ),
            )
          ],
        ),
      ),
      icon: Container(
        margin: const EdgeInsets.only(top: 7),
        width: 25,
        height: 25,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/music.png'),
          ),
        ),
      ),
    ),
    BottomNavigationBarItem(
      label: '',
      activeIcon: Container(
        height: 25,
        margin: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            ClipOval(
              child: Container(
                width: 6,
                height: 6,
                color: whiteColor,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              'Artis',
              style: ConstantTextStyle.stylePoppins(
                fontSize: 15,
                color: whiteColor,
              ),
            )
          ],
        ),
      ),
      icon: Container(
        margin: const EdgeInsets.only(top: 5),
        width: 25,
        height: 25,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/artist.png'),
          ),
        ),
      ),
    ),
    BottomNavigationBarItem(
      label: '',
      activeIcon: Container(
        height: 25,
        margin: const EdgeInsets.only(top: 5),
        child: Column(
          children: [
            ClipOval(
              child: Container(
                width: 6,
                height: 6,
                color: whiteColor,
              ),
            ),
            const SizedBox(
              height: 3,
            ),
            Text(
              'Profil',
              style: ConstantTextStyle.stylePoppins(
                fontSize: 15,
                color: whiteColor,
              ),
            )
          ],
        ),
      ),
      icon: Container(
        margin: const EdgeInsets.only(top: 5),
        width: 25,
        height: 25,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/icons/person_icon.png'),
          ),
        ),
      ),
    ),
  ];

  final List<Widget> bodyMain = [
    HomeScreen(),
    PromoScreen(),
    FavouriteScreen(),
    PersonScreen(),
  ];

}
