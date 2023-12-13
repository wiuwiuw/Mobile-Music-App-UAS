import 'package:get/get.dart';
import 'package:musickuy_app/fitur/editprofil/controller/editProfil_controller.dart';
import 'package:musickuy_app/fitur/main/controller/main_controller.dart';

class ProfilBainding extends Bindings {
  @override
  void dependencies() {
    Get.put(EditProfileController());
    Get.put(EditProfileController());
    Get.put(EditProfileController());
    Get.put(MainController());
  }
}
