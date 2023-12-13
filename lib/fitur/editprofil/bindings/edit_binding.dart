import 'package:get/get.dart';
import 'package:musickuy_app/fitur/editprofil/controller/editProfil_controller.dart';

class EditProfilBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EditProfileController());
  }
}
