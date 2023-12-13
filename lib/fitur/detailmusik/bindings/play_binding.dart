import 'package:get/get.dart';
import 'package:musickuy_app/fitur/detailmusik/controller/play_controller.dart';

class PlayBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PlayController());
  }
}
