
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:indorestaurant/ui/detail_page.dart';
import 'package:indorestaurant/ui/favorite_page.dart';
import 'package:indorestaurant/ui/home_page.dart';
import 'package:indorestaurant/ui/review_page.dart';
import 'package:indorestaurant/ui/search_page.dart';
import 'package:indorestaurant/ui/setting_page.dart';
import 'package:indorestaurant/ui/splash_screen.dart';
import 'package:indorestaurant/common/style.dart';
import 'package:indorestaurant/utils/background_service.dart';
import 'package:indorestaurant/utils/notification_helper.dart';


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final NotificationHelper notificationHelper = NotificationHelper();
  final BackgroundService service = BackgroundService();
  service.initializeIsolate();

  await AndroidAlarmManager.initialize();

  await notificationHelper.initNotifications(flutterLocalNotificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> {
  final NotificationHelper _notificationHelper = NotificationHelper();

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
        SettingPage.routeName: (context) => const SettingPage()
      },
    );
  }

  @override
  void initState() {
    super.initState();
    _notificationHelper
        .configureSelectNotificationSubject(context ,DetailPage.routeName);
  }

  @override
  void dispose() {
    super.dispose();
    selectNotificationSubject.close();
  }
}
