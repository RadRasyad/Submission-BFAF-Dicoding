
import 'package:flutter/material.dart';
import 'package:indorestaurant/data/api/api_service.dart';
import 'package:indorestaurant/provider/search_restaurant_provider.dart';
import 'package:indorestaurant/ui/restaurant_search_page.dart';
import 'package:indorestaurant/widget/search_appbar.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  static const routeName = '/search_page';

  const SearchPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchRestaurantProvider>(
      create: (_) => SearchRestaurantProvider( apiService: ApiService()),
      child: const SearchAppbar(body: RestaurantSearchPage()),
    );
  }

}