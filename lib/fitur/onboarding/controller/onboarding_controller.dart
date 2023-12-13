import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:musickuy_app/route/route_name.dart';
//import 'package:musickuy_app/services/location_service.dart';

class OnboardingController extends GetxController {
  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  final imagesOnboarding = [
    'assets/images/onboarding_1.png',
    'assets/images/onboarding_2.png',
    'assets/images/onboarding_3.png',
  ];

  RxInt indexImage = 0.obs;

  void handleGetStared() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoading.value = true;
    Get.offAllNamed(RouteName.signUpScreen);
    prefs.setBool("hasOnboard", true);
  }
}
