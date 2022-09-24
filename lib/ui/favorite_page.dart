

import 'package:flutter/material.dart';
import 'package:indorestaurant/data/db/database_helper.dart';
import 'package:indorestaurant/provider/favorite_provider.dart';
import 'package:indorestaurant/ui/restaurant_favorite_page.dart';
import 'package:indorestaurant/widget/favorite_appbar.dart';
import 'package:provider/provider.dart';

class FavoritePage extends StatelessWidget {
  static const routeName = '/favorite_page';

  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FavoriteProvider>(
      create: (_) => FavoriteProvider(dbHelper: DatabaseHelper()),
      child: const FavoriteAppbar(body: FavoriteListPage()),
    );
  }

}