
import 'package:flutter/material.dart';
import 'package:indorestaurant/data/preferences/preferences_helper.dart';

class PreferencesProvider extends ChangeNotifier {
  PreferencesHelper preferencesHelper;

  PreferencesProvider({required this.preferencesHelper}) {
    _getDailyAlertPreferences();
  }


  bool _isDailyAlertActive = false;
  bool get isDailyAlertActive => _isDailyAlertActive;

  void _getDailyAlertPreferences() async {
    _isDailyAlertActive = await preferencesHelper.isDailyAlertActive;
    notifyListeners();
  }

  void enableDailyAlert(bool value) {
    preferencesHelper.setDailyAlert(value);
    _getDailyAlertPreferences();
  }

}