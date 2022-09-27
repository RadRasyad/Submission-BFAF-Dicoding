
import 'package:flutter/material.dart';
import 'package:indorestaurant/provider/preferences_provider.dart';
import 'package:indorestaurant/provider/scheduling_provider.dart';
import 'package:provider/provider.dart';

class RestaurantSettingPage extends StatelessWidget {
  const RestaurantSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<PreferencesProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Settings"),
          ),
          body: ListView(
            children: [
              Material(
                child: ListTile(
                  title: const Text('Restaurant Recomendation'),
                  trailing: Consumer<SchedulingProvider>(
                    builder: (context, scheduled, _) {
                      return Switch.adaptive(
                        value: provider.isDailyAlertActive,
                        onChanged: (value) async {
                          scheduled.scheduledRestaurant(value);
                          provider.enableDailyAlert(value);
                        },
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}