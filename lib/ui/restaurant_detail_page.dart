import 'package:flutter/material.dart';
import 'package:indorestaurant/model/restaurant.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/article_detail';

  final Restaurant restaurant;

  const RestaurantDetailPage({Key? key, required this.restaurant})
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
                    restaurant.pictureId,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SafeArea(
                  child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                    const Icon(Icons.place_outlined),
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
                      'Description',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    const SizedBox(height: 4.0),
                    Text(restaurant.description,
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodyText2)
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
                    _BuildMenuItems(menuItem: restaurant.menus.foods),
                    const SizedBox(height: 8.0),
                    const Text(
                      'Drinks',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    _BuildMenuItems(menuItem: restaurant.menus.drinks),
                    const SizedBox(height: 8.0),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class _BuildMenuItems extends StatelessWidget {
  final List<MenuItems> menuItem;

  const _BuildMenuItems({Key? key, required this.menuItem}) : super(key: key);

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
