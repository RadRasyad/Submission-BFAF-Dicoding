
import 'package:flutter/material.dart';
import 'package:indorestaurant/data/api/api_service.dart';
import 'package:indorestaurant/ui/restaurant_detail_page.dart';
import 'package:provider/provider.dart';
import 'package:indorestaurant/provider/detail_restaurant_provider.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/detail_page';
  final String id;

  const DetailPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailRestaurantProvider>(
      create: (_) => DetailRestaurantProvider(id: id, apiService: ApiService()),
      child: const RestaurantDetailPage(),
    );
  }

}