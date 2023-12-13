import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musickuy_app/constant/constant_color.dart';
import 'package:musickuy_app/constant/constant_text_style.dart';
import 'package:musickuy_app/controller/auth_controller.dart';
import 'package:musickuy_app/route/route_name.dart';
import 'package:musickuy_app/widgets/custom_button_widget.dart';
import 'package:musickuy_app/widgets/text_form_field_widget.dart';

class SignUpScreen extends StatelessWidget {
  final authC = Get.put(AuthController());

  SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Temukan Musik Favorit Kamu.\nDimulai Dari Sini!',
                  style: ConstantTextStyle.stylePoppins(
                      fontSize: 21, fontWeight: FontWeight.w700, height: 1.5),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  height: 30,
                  width: Get.size.width,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: 81,
                          height: 15,
                          color: tealColor,
                        ),
                      ),
                      Positioned(
                        bottom: 5,
                        left: 2,
                        child: Text(
                          'Sign Up',
                          style: ConstantTextStyle.stylePoppins(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                 const SizedBox(
                  height: 20,
                ),
                TextFormFieldWidget(
                  textEditingController: authC.fullNameController,
                  hintText: 'Nama Lengkap Kamu',
                  label: 'Nama Lengkap',
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldWidget(
                  textEditingController: authC.userNameController,
                  hintText: 'Your Name',
                  label: 'Username',
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldWidget(
                  textEditingController: authC.emailController,
                  hintText: 'Your Email',
                  label: 'Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldWidget(
                  textEditingController: authC.passwordController,
                  hintText: 'Your Password',
                  label: 'Password',
                  isPassword: true,
                ),
                RichText(
                  text: TextSpan(
                    style: ConstantTextStyle.stylePoppins(color: tealColor),
                    children: [
                      const TextSpan(text: 'Have an Account? '),
                      TextSpan(
                        text: 'Sign In',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(RouteName.signInScreen);
                          },
                        style: ConstantTextStyle.stylePoppins(
                            fontWeight: FontWeight.w600,
                            textDecoration: TextDecoration.underline,
                            color: tealColor),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Obx(() => CustomButtonWidget(
                    label: authC.isLoading.isTrue ? 'Loading...' : 'Sign Up',
                    isFullButton: true,
                    onPressed: authC.isLoading.isTrue
                        ? null
                        : () async => await authC.signUpUser())),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Terms and Condition',
                    style: ConstantTextStyle.stylePoppins(
                      fontWeight: FontWeight.w300,
                      color: greyColor,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
