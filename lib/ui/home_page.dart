
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:indorestaurant/data/api/api_service.dart';
import 'package:indorestaurant/provider/restaurant_provider.dart';
import 'package:indorestaurant/widget/home_appbar.dart';
import 'package:indorestaurant/ui/restaurant_list_page.dart';

class HomePage extends StatefulWidget {
  static const routeName = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RestaurantProvider>(
      create: (_) => RestaurantProvider(apiService: ApiService()),
      child: const HomeAppbar(body: RestaurantListPage()),
    );
  }

}

