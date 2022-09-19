
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:indorestaurant/provider/search_restaurant_provider.dart';
import 'package:indorestaurant/widget/empty_state.dart';
import 'package:indorestaurant/widget/error_state.dart';
import 'package:indorestaurant/widget/restaurant_item_row.dart';

class RestaurantSearchPage extends StatelessWidget {
  const RestaurantSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchRestaurantProvider>(

      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator(
            color: Color(0xFFE07465),
          ));
        } else if (state.state == ResultState.hasData) {
          if(state.result.restaurants.isNotEmpty) {
            return ListView.builder(
              itemCount: state.result.restaurants.length,
              itemBuilder: (context, index) {
                var restaurant = state.result.restaurants[index];
                return RestaurantItemRow(restaurant: restaurant);
              },
            );
          } else {
            return const EmptyState();
          }
        } else if (state.state == ResultState.error ||
            state.state == ResultState.noData) {
          if (state.message.contains('Failed host lookup')) {
            return const ErrorState(
              errorMsg: 'Tidak dapat tersambung dengan internet',
            );
          } else if(state.message.contains('Empty Data')) {
            return const EmptyState();
          }
          return const EmptyState();
        } else {
          return const Material(child: Text(''));
        }
      },
    );
  }
}