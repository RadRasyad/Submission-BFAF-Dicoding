
import 'package:flutter/material.dart';
import 'package:indorestaurant/ui/detail_page.dart';
import 'package:indorestaurant/ui/favorite_page.dart';
import 'package:indorestaurant/ui/home_page.dart';
import 'package:indorestaurant/ui/review_page.dart';
import 'package:indorestaurant/ui/search_page.dart';
import 'package:indorestaurant/ui/splash_screen.dart';
import 'package:indorestaurant/values/style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IndoRestaurant',
      theme: ThemeData(
        textTheme: textTheme,
        colorScheme:
            ThemeData().colorScheme.copyWith(primary: const Color(0xFFE07465)),
      ),
      initialRoute: SplashScreenPage.routeName,
      routes: {
        SplashScreenPage.routeName: (context) => const SplashScreenPage(),
        HomePage.routeName: (context) => const HomePage(),
        DetailPage.routeName: (context) => DetailPage(
              id:
                  ModalRoute.of(context)?.settings.arguments as String
            ),
        SearchPage.routeName: (context) => const SearchPage(),
        ReviewPage.routeName: (context) => ReviewPage(
            id: ModalRoute.of(context)?.settings.arguments as String
        ),
        FavoritePage.routeName: (context) => const FavoritePage(),
      },
    );
  }
}
