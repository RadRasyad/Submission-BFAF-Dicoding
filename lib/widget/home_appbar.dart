
import 'package:flutter/material.dart';
import 'package:indorestaurant/ui/favorite_page.dart';
import 'package:indorestaurant/ui/search_page.dart';
import 'package:indorestaurant/ui/setting_page.dart';

class HomeAppbar extends StatelessWidget {
  final Widget body;

  const HomeAppbar({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Column(
            children: [
              _buildCustomAppBar(context),
              Expanded(
                child: body,
              ),
            ],
          ),
    );
  }

}

Card _buildCustomAppBar(BuildContext context) {
  return Card(
    color: const Color(0xFFEE7465),
    margin: const EdgeInsets.all(0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 8.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "IndoRestaurant",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SearchPage.routeName);
                      },
                      icon: const Icon(Icons.search),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, FavoritePage.routeName);
                      },
                      icon: const Icon(Icons.favorite),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, SettingPage.routeName);
                      },
                      icon: const Icon(Icons.settings),
                    ),
                  ],
                ),

              ],
            ),
          ],
        ),
      ),
    ),
  );
}