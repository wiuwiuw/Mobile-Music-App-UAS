import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musickuy_app/constant/constant_color.dart';
import 'package:musickuy_app/fitur/detailmusik/controller/play_controller.dart';
import 'package:musickuy_app/fitur/detailmusik/widgets/play_musik.dart';
import 'package:musickuy_app/route/route_name.dart';

class PlayScreen extends StatelessWidget {
  PlayScreen({
    super.key,
  });

  final PlayController playController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Obx(
        () {
          if (playController.isLoading.isTrue) {
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
                 PlayCard(
                    playController: playController,
                    musikModel: playController.musikModel.value
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
