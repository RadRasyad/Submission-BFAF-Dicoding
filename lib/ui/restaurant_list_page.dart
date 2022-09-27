
import 'package:flutter/material.dart';
import 'package:indorestaurant/utils/result_state.dart';
import 'package:indorestaurant/widget/empty_state.dart';
import 'package:indorestaurant/widget/error_state.dart';
import 'package:provider/provider.dart';
import 'package:indorestaurant/provider/restaurant_provider.dart';
import 'package:indorestaurant/widget/restaurant_item_row.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>
      (builder: (context, state, _) {
      if (state.state == ResultState.loading) {
        return const Center(child: CircularProgressIndicator(
          color: Color(0xFFE07465),
        ));
      } else if (state.state == ResultState.hasData) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var restaurant = state.result.restaurants[index];
              return RestaurantItemRow(restaurant: restaurant);
            });
      } else if (state.state == ResultState.noData) {
        return const Center(
          child: Material(
            child: EmptyState(emptyMsg: 'Oops! \n Data Not Found'),
          ),
        );
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
              errorMsg: 'Tidak Ada Data Yang Ditemukan'
            ),
          ),
        );
      } else {
        return const Center(
          child: Material(
            child: Text(''),
          ),
        );
      }
    });
  }


}


