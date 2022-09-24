
import 'package:flutter/material.dart';
import 'package:indorestaurant/data/api/api_service.dart';
import 'package:indorestaurant/data/db/database_helper.dart';
import 'package:indorestaurant/provider/favorite_provider.dart';
import 'package:indorestaurant/ui/restaurant_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:indorestaurant/provider/detail_restaurant_provider.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';
  final String id;

  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
        ChangeNotifierProvider<DetailRestaurantProvider>(
          create: (_) =>
              DetailRestaurantProvider(id: id, apiService: ApiService()),
        ),
        ChangeNotifierProvider<FavoriteProvider>(
          create: (_) => FavoriteProvider(dbHelper: DatabaseHelper()),
        ),
      ],
      child: const RestaurantDetailPage(),
    );
  }

}