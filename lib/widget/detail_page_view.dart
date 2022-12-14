
import 'package:flutter/material.dart';
import 'package:indorestaurant/data/model/detail_restaurant.dart';
import 'package:indorestaurant/data/model/restaurant.dart';
import 'package:indorestaurant/provider/favorite_provider.dart';
import 'package:indorestaurant/ui/review_page.dart';
import 'package:indorestaurant/widget/review_item_row.dart';
import 'package:provider/provider.dart';
class DetailPageView extends StatelessWidget {

  final DetailRestaurant restaurant;

  const DetailPageView({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(alignment: AlignmentDirectional.topCenter, children: <Widget>[
              Hero(
                tag: restaurant.pictureId,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(35.0)),
                  child: Image.network(
                    'https://restaurant-api.dicoding.dev/images/large/${restaurant.pictureId}',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.black38,
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        Consumer<FavoriteProvider>(
                            builder: (context, provider, child){
                              return FutureBuilder<bool>(
                                  future: provider.isFavorited(restaurant.id),
                                  builder: (context, snapshot) {
                                    var isFav = snapshot.data ?? false;
                                    return CircleAvatar(
                                      backgroundColor: Colors.black38,
                                      child: isFav
                                      ? IconButton(
                                        icon: const Icon(
                                          Icons.favorite,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          provider.removeFavorite(restaurant.id);
                                        },
                                      ) : IconButton(
                                        icon: const Icon(
                                          Icons.favorite_outline,
                                          color: Colors.white,
                                        ),
                                        onPressed: () {
                                          provider.addFavorite(
                                              Restaurant(
                                              id: restaurant.id,
                                              name: restaurant.name,
                                              description: restaurant.description,
                                              pictureId: restaurant.pictureId,
                                              city: restaurant.city,
                                              rating: restaurant.rating));
                                        },
                                      )
                                    );
                                  }
                              );
                            })
                      ],
                    ),
                  ))
            ]),
            Container(
                margin:
                const EdgeInsets.only(left: 16.0, right: 8.0, top: 16.0),
                child: Text(restaurant.name,
                    textAlign: TextAlign.start,
                    style: Theme.of(context).textTheme.headline4)),
            Container(
              margin: const EdgeInsets.only(left: 16.0, right: 8.0, top: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        const Icon(Icons.location_city_outlined),
                        Text(
                          restaurant.city,
                          textAlign: TextAlign.start,
                        ),
                      ]),
                      const SizedBox(width: 32.0),
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        const Icon(Icons.star, color: Colors.orangeAccent),
                        Text(
                          restaurant.rating.toString(),
                          textAlign: TextAlign.start,
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ]),
                    ],
                  ),
                  const SizedBox(height: 8.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                        const Icon(Icons.place_outlined),
                        Text(
                          restaurant.address,
                          textAlign: TextAlign.start,
                        ),
                      ]),
                    ],
                  ),
                ],
              )
            ),
            Container(
              margin: const EdgeInsets.all(4.0),
              child: const Divider(
                color: Colors.black,
                thickness: 1.2,
              ),
            ),
            Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Category',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 8.0),
                    _BuildChipsItems(menuItem: restaurant.categories),
                    const SizedBox(height: 8.0),
                    Text(
                      'Description',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 4.0),
                    Text(restaurant.description,
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodyText2),

                  ],
                )),
            Container(
              margin: const EdgeInsets.all(4.0),
              child: const Divider(
                color: Colors.black,
                thickness: 1.2,
              ),
            ),
            Container(
                margin: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Menus', style: Theme.of(context).textTheme.headline6),
                    const SizedBox(height: 4.0),
                    const Text(
                      'Foods',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    _BuildChipsItems(menuItem: restaurant.menus.foods),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Drinks',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    _BuildChipsItems(menuItem: restaurant.menus.drinks),
                    const SizedBox(height: 8.0),
                  ],
                )),
            Container(
              margin: const EdgeInsets.all(4.0),
              child: const Divider(
                color: Colors.black,
                thickness: 1.2,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Review',
                  style: Theme.of(context).textTheme.headline6
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: restaurant.customerReviews.length,
                      itemBuilder: (BuildContext context, int index) {
                        var review = restaurant.customerReviews[index];
                        return ReviewItemRow(review: review);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              margin: const EdgeInsets.symmetric(
                  horizontal: 16.0
              ),
              child: TextButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(
                        context,
                        ReviewPage.routeName,
                        arguments: restaurant.id
                    );
                  },
                  style: const ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Color(0xFF2B1706)),
                    overlayColor: MaterialStatePropertyAll(Color(0xFFE07465)),
                  ),
                  icon: const Icon(Icons.create),
                  label: const Text(
                      'Tulis Ulasan'
                  )
              ),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}

class _BuildChipsItems extends StatelessWidget {
  final List<Category> menuItem;

  const _BuildChipsItems({Key? key, required this.menuItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: menuItem.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            shape: const RoundedRectangleBorder(
              side: BorderSide(
                width: 1.5,
                color: Color(0xFFEE7465),
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 3.0),
            child: Container(
              margin: const EdgeInsets.all(6.0),
              alignment: Alignment.center,
              child: Text(
                menuItem[index].name,
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          );
        },
      ),
    );
  }
}
