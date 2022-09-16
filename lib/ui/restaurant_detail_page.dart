
import 'package:flutter/material.dart';
import 'package:indorestaurant/provider/detail_restaurant_provider.dart';
import 'package:indorestaurant/widget/detail_page_view.dart';
import 'package:indorestaurant/widget/error_view.dart';
import 'package:provider/provider.dart';

class RestauranDetailPage extends StatelessWidget {
  const RestauranDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<DetailRestaurantProvider>(builder: (context, state, _) {
      if (state.state == ResultState.loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.hasData) {
        var restaurant = state.result.restaurant;
        return DetailPageView(restaurant: restaurant);
      } else if (state.state == ResultState.error ||
          state.state == ResultState.noData) {
        if (state.message.contains('Failed host lookup')) {
          return const Center(
            child: Material(
              child: ErrorView(
                  errorMsg: 'Tidak Dapat Tersambung Dengan Internet'
              ),
            ),
          );
        }
        return const Center(
          child: Material(
            child: ErrorView(
                errorMsg: 'Tidak Ada Data Yang Ditemukan'
            ),
          ),
        );
      } else {
        return const Material(child: Text(''));
      }
    });
  }
}