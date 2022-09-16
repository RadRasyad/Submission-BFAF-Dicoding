
import 'package:flutter/material.dart';
import 'package:indorestaurant/data/model/detail_restaurant.dart';

class ReviewItemRow extends StatelessWidget {
  final CustomerReview review;

  const ReviewItemRow({Key? key, required this.review}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Card(
        child: ListTile(
          contentPadding: const EdgeInsets.all(8),
          leading: const Icon(Icons.people_alt_outlined, size: 40),
          title: Text(
            review.name,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(
            '"${review.review}" \n${review.date}',
            style: Theme.of(context).textTheme.bodyText2,
          ),
          isThreeLine: true,
        ),
      ),
    );
  }
}
