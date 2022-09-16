
import 'package:flutter/material.dart';
import 'package:indorestaurant/data/model/restaurant.dart';
import 'package:indorestaurant/ui/restaurant_detail_page.dart';

class RestaurantItemRow extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantItemRow({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        contentPadding:
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        leading: Hero(
          tag: restaurant.pictureId,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15.0),
            child: Image.network(
              restaurant.pictureId,
              width: 100,
              fit: BoxFit.cover,
            ),
          ),
        ),
        title: Text(restaurant.name,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline6),
        subtitle:
        Text(restaurant.city, style: Theme.of(context).textTheme.bodyText2),
        trailing: Column(
          children: [
            const Icon(Icons.star, color: Colors.orangeAccent),
            Text(
              restaurant.rating.toString(),
            )
          ],
        ),
        // onTap: () {
        //   Navigator.pushNamed(context, RestaurantDetailPage.routeName,
        //       arguments: restaurant);
        // },
      ),
    );
  }

}