import 'package:get/get.dart';
import 'package:musickuy_app/fitur/detail/bindings/detail_binding.dart';
import 'package:musickuy_app/fitur/detail/screen/detail_screen.dart';
import 'package:musickuy_app/fitur/detailmusik/bindings/play_binding.dart';
import 'package:musickuy_app/fitur/detailmusik/screen/play_screen.dart';
import 'package:musickuy_app/fitur/main/bindings/main_binding.dart';
import 'package:musickuy_app/fitur/main/screen/main_screen.dart';
import 'package:musickuy_app/fitur/models/recommend_model.dart';
import 'package:musickuy_app/fitur/onboarding/screen/onboarding_screen.dart';
import 'package:musickuy_app/fitur/signin/screen/sign_in_screen.dart';
import 'package:musickuy_app/fitur/signup/screen/sign_up_screen.dart';
import 'package:musickuy_app/fitur/editprofil/screen/editProfil_screen.dart';
import 'package:musickuy_app/fitur/editprofil/bindings/edit_binding.dart';
import 'package:musickuy_app/fitur/splash/bindings/splash_binding.dart';
import 'package:musickuy_app/fitur/splash/splash_screen.dart';
import 'package:musickuy_app/route/route_name.dart';

class RoutePages {
  List<GetPage<dynamic>> routes = [
    GetPage(
        name: RouteName.splashScreen,
        page: () => const SplashScreen(),
        binding: SplashBinding()),
    GetPage(
      name: RouteName.onboardingScreen,
      page: () => OnboardingScreen(),
    ),
    GetPage(
      name: RouteName.signUpScreen,
      page: () => SignUpScreen(),
    ),
    GetPage(
      name: RouteName.signInScreen,
      page: () => SignInScreen(),
    ),
    GetPage(
      name: RouteName.mainScreen,
      page: () => MainScreen(),
      binding: MainBainding(),
    ),
    GetPage(
      name: RouteName.detailScreen,
      binding: DetailBinding(),
      page: () {
        return DetailScreen();
      },
    ),
    GetPage(
      name: RouteName.playScreen,
      binding: PlayBinding(),
      page: () {
        return PlayScreen();
      },
    ),
    GetPage(
      name: RouteName.profileditScreen,
      binding: EditProfilBinding(),
      page: () {
        return EditProfileScreen();
      },
    ),
  
  ];
}
