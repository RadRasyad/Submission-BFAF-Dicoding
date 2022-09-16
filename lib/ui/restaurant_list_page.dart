
import 'package:flutter/material.dart';
import 'package:indorestaurant/widget/error_view.dart';
import 'package:provider/provider.dart';
import 'package:indorestaurant/data/api/api_service.dart';
import 'package:indorestaurant/provider/restaurant_provider.dart';
import 'package:indorestaurant/ui/restaurant_detail_page.dart';
import 'package:indorestaurant/data/model/restaurant.dart';
import 'package:indorestaurant/widget/restaurant_item_row.dart';
import 'package:lottie/lottie.dart';

class RestaurantListPage extends StatelessWidget {
  const RestaurantListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<RestaurantProvider>
      (builder: (context, state, _) {
      if (state.state == ResultState.loading) {
        return const Center(child: CircularProgressIndicator());
      } else if (state.state == ResultState.hasData) {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: state.result.restaurants.length,
            itemBuilder: (context, index) {
              var restaurant = state.result.restaurants[index];
              return RestaurantItemRow(restaurant: restaurant);
            });
      } else if (state.state == ResultState.noData) {
        return Center(
          child: Material(
            child: _buildEmptyData(context),
          ),
        );
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
        return const Center(
          child: Material(
            child: Text(''),
          ),
        );
      }
    });
  }

  Widget _buildEmptyData(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/lottie/lottie_empty.json", height: 200.0),
          const SizedBox(
            height: 16.0,
          ),
          Text(
            'Oops! \n Data Not Found',
            style: Theme.of(context).textTheme.headline5,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

}
