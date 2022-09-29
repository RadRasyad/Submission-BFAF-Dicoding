
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:indorestaurant/data/preferences/preferences_helper.dart';
import 'package:indorestaurant/provider/preferences_provider.dart';
import 'package:indorestaurant/provider/scheduling_provider.dart';
import 'package:indorestaurant/ui/restaurant_setting_page.dart';
import 'package:indorestaurant/ui/detail_page.dart';
import 'package:indorestaurant/utils/notification_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingPage extends StatefulWidget {
  static const routeName = '/setting_page';

  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  final NotificationHelper _notificationHelper = NotificationHelper();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SchedulingProvider()),
        ChangeNotifierProvider(
          create: (_) => PreferencesProvider(
            preferencesHelper: PreferencesHelper(
                sharedPreferences: SharedPreferences.getInstance()),
          ),
        ),
      ],
      child: const RestaurantSettingPage(),
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