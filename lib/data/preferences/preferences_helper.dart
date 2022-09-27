
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesHelper {

  static const dailyAlert = 'DAILY_ALERT';

  final Future<SharedPreferences> sharedPreferences;

  PreferencesHelper({required this.sharedPreferences});

  Future<bool> get isDailyAlertActive async {
    final prefs = await sharedPreferences;
    return prefs.getBool(dailyAlert) ?? false;
  }

  void setDailyAlert(bool value) async {
    final prefs = await sharedPreferences;
    prefs.setBool(dailyAlert, value);
  }
}