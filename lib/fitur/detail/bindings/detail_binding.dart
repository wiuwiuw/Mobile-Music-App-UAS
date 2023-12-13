import 'package:get/get.dart';
import 'package:musickuy_app/fitur/detail/controller/detail_controller.dart';

class DetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DetailController());
  }
}
