import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musickuy_app/constant/constant_color.dart';
import 'package:musickuy_app/fitur/home/widgets/header_widget.dart';
import 'package:musickuy_app/fitur/profile/controller/profile_controller.dart';
import 'package:musickuy_app/fitur/profile/widgets/account_card.dart';
import 'package:musickuy_app/fitur/profile/widgets/saldo_card.dart';

class PersonScreen extends StatelessWidget {
  PersonScreen({super.key});

  final ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              HeaderWidget(userModel: profileController.userModel),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Stack(
                  children: [
                    AccountCard(profileController: profileController),
                    const SaldoCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
