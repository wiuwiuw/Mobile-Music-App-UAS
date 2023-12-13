//import 'package:music_app/pages/onboarding_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:musickuy_app/route/route_name.dart';
import 'package:musickuy_app/route/route_pages.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:music_app/pages/home_page.dart';
//import 'package:music_app/first_page.dart';
import 'package:musickuy_app/firebase_options.dart';
//import 'package:music_app/features/splash/splash_screen.dart';

   
//kalo mau pake features ganti alamat /route menjadi /route2 dan 


late FirebaseApp app;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: RoutePages().routes,
      initialRoute: RouteName.splashScreen,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 18, 115, 115)),
        useMaterial3: true,
        textTheme: GoogleFonts.nunitoTextTheme(),
      ),
     // home: SignInScreen()
    //  home: firstPage()
    );
  }
}
