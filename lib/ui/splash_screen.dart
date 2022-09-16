import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:indorestaurant/ui/home_page.dart';

class SplashScreenPage extends StatelessWidget {
  static const routeName = '/splash_screen_page';

  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset('assets/img/ic_restaurant.png'),
      backgroundColor: Colors.white,
      navigator: const HomePage(),
      durationInSeconds: 1,
      showLoader: false,
    );
  }
}