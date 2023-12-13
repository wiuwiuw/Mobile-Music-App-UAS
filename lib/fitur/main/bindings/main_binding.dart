import 'package:get/get.dart';
import 'package:musickuy_app/fitur/favourite/controller/artis_controller.dart';
import 'package:musickuy_app/fitur/main/controller/main_controller.dart';
import 'package:musickuy_app/fitur/profile/controller/profile_controller.dart';
import 'package:musickuy_app/fitur/promo/controller/musik_controller.dart';

class MainBainding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    Get.put(PromoController());
    Get.put(FavoriteController());
    Get.put(MainController());
  }
}
