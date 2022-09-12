import 'dart:convert';

class Restaurant {
  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  final String id;
  final String name;
  final String description;
  final String pictureId;
  final String city;
  final double rating;
  final Menus menus;

  Restaurant copyWith({
    required String id,
    required String name,
    required String description,
    required String pictureId,
    required String city,
    required double rating,
    required Menus menus,
  }) =>
      Restaurant(
        id: id,
        name: name,
        description: description,
        pictureId: pictureId,
        city: city,
        rating: rating,
        menus: menus,
      );

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        pictureId: json["pictureId"],
        city: json["city"],
        rating: json["rating"].toDouble(),
        menus: Menus.fromJson(json["menus"]),
      );
}

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });

  final List<MenuItems> foods;
  final List<MenuItems> drinks;

  Menus copyWith({
    required List<MenuItems> foods,
    required List<MenuItems> drinks,
  }) => Menus(
        foods: foods,
        drinks: drinks,
      );

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
        foods:
            List<MenuItems>.from(json["foods"].map((x) => MenuItems.fromJson(x))),
        drinks:
            List<MenuItems>.from(json["drinks"].map((x) => MenuItems.fromJson(x))),
      );
}

class MenuItems {
  MenuItems({
    required this.name,
  });

  final String name;

  MenuItems copyWith({
    required String name,
  }) =>
      MenuItems(
        name: name,
      );

  factory MenuItems.fromJson(Map<String, dynamic> json) => MenuItems(
        name: json["name"],
      );
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }

  final Map parsedJson = jsonDecode(json);
  List parsed = parsedJson['restaurants'];
  return parsed.map((json) => Restaurant.fromJson(json)).toList();
}
