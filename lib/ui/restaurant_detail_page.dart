
import 'package:flutter/material.dart';
import 'package:indorestaurant/provider/detail_restaurant_provider.dart';
import 'package:indorestaurant/widget/detail_page_view.dart';
import 'package:indorestaurant/widget/error_state.dart';
import 'package:provider/provider.dart';

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({Key? key}) : super(key: key);

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
              child: ErrorState(
                  errorMsg: 'Tidak Dapat Tersambung Dengan Internet'
              ),
            ),
          );
        }
        return const Center(
          child: Material(
            child: ErrorState(
                errorMsg: 'Data Restoran Tidak Ditemukan'
            ),
          ),
        );
      } else {
        return const Material(child: Text(''));
      }
    });
  }
}