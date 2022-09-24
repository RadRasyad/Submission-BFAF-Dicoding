
import 'package:flutter/material.dart';
import 'package:indorestaurant/provider/favorite_provider.dart';
import 'package:indorestaurant/utils/result_state.dart';
import 'package:indorestaurant/widget/empty_state.dart';
import 'package:indorestaurant/widget/restaurant_item_row.dart';
import 'package:provider/provider.dart';

class FavoriteListPage extends StatelessWidget {
  const FavoriteListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteProvider>
      (builder: (context, provider, child) {
      if(provider.state == ResultState.hasData) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: provider.favRestaurant.length,
            itemBuilder: (context, index) {
              var restaurant = provider.favRestaurant[index];
              return RestaurantItemRow(restaurant: restaurant);
            });
      } else {
        return const Center(
          child: Material(
            child: EmptyState(emptyMsg: 'Wew, its empty here',),
          ),
        );
      }
    });
  }

}