
import 'package:flutter/material.dart';
import 'package:indorestaurant/provider/review_provider.dart';
import 'package:provider/provider.dart';

class RestaurantReviewPage extends StatelessWidget {
  const RestaurantReviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewProvider>(
      builder: (context, state, _) {
        if (state.state == ResultState.loading) {
          return const Center(child: CircularProgressIndicator(
            color: Color(0xFFE07465),
          ));
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${state.state} menambahkan review',
              ),
              duration: const Duration(seconds: 1),
            ),
          );
          Navigator.pop(context);
          return const Material(child: Text(''));
        }
      },
    );
  }

}
