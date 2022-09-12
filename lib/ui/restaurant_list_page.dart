import 'package:flutter/material.dart';
import 'package:indorestaurant/model/restaurant.dart';
import 'package:indorestaurant/ui/restaurant_detail_page.dart';
import 'package:lottie/lottie.dart';

class RestaurantListPage extends StatelessWidget {
  static const routeName = '/restaurant_list';

  const RestaurantListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text(
          'IndoRestaurant',
        ),
        backgroundColor: const Color(0xFFEE7465),
      ),
      body: FutureBuilder<String>(
        future: DefaultAssetBundle.of(context)
            .loadString('assets/local_restaurant.json'),
        builder: (context, snapshot) {
          try {
            final List<Restaurant> restaurant = parseRestaurant(snapshot.data);
            return ListView.builder(
              itemCount: restaurant.length,
              itemBuilder: (context, index) {
                return _buildRestaurantItem(context, restaurant[index]);
              },
            );
          } catch (e) {
            return _buildEmptyData(context);
          }
        },
      ),
    );
  }

  Widget _buildRestaurantItem(BuildContext context, Restaurant restaurant) {
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
        onTap: () {
          Navigator.pushNamed(context, RestaurantDetailPage.routeName,
              arguments: restaurant);
        },
      ),
    );
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
