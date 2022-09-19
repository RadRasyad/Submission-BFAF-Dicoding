
import 'package:flutter/cupertino.dart';

class DetailRestaurantResult extends ChangeNotifier {
  DetailRestaurantResult({
    required this.error,
    required this.message,
    required this.restaurant,
  });

  final bool error;
  final String message;
  final DetailRestaurant restaurant;

  DetailRestaurantResult copyWith({
    required bool error,
    required String message,
    required DetailRestaurant restaurant,
  }) =>
      DetailRestaurantResult(
        error: error,
        message: message,
        restaurant: restaurant,
      );

  factory DetailRestaurantResult.fromJson(Map<String, dynamic> json) =>
      DetailRestaurantResult(
        error: json["error"],
        message: json["message"],
        restaurant: DetailRestaurant.fromJson(json["restaurant"]),
      );
}

class DetailRestaurant {
  DetailRestaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.address,
    required this.pictureId,
    required this.categories,
    required this.menus,
    required this.rating,
    required this.customerReviews,
  });

  final String id;
  final String name;
  final String description;
  final String city;
  final String address;
  final String pictureId;
  final List<Category> categories;
  final Menus menus;
  final double rating;
  final List<CustomerReview> customerReviews;

  DetailRestaurant copyWith({
    required String id,
    required String name,
    required String description,
    required String city,
    required String address,
    required String pictureId,
    required List<Category> categories,
    required Menus menus,
    required double rating,
    required List<CustomerReview> customerReviews,
  }) =>
      DetailRestaurant(
        id: id,
        name: name,
        description: description,
        city: city,
        address: address,
        pictureId: pictureId,
        categories: categories,
        menus: menus,
        rating: rating,
        customerReviews: customerReviews,
      );

  factory DetailRestaurant.fromJson(Map<String, dynamic> json) =>
      DetailRestaurant(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        city: json["city"],
        address: json["address"],
        pictureId: json["pictureId"],
        categories: List<Category>.from(
            json["categories"].map((x) => Category.fromJson(x))),
        menus: Menus.fromJson(json["menus"]),
        rating: json["rating"].toDouble(),
        customerReviews: List<CustomerReview>.from(
            json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
      );
}

class Category {
  Category({
    required this.name,
  });

  final String name;

  Category copyWith({
    required String name,
  }) =>
      Category(
        name: name,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

class CustomerReview {
  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  final String name;
  final String review;
  final String date;

  CustomerReview copyWith({
    required String name,
    required String review,
    required String date,
  }) =>
      CustomerReview(
        name: name,
        review: review,
        date: date,
      );

  factory CustomerReview.fromJson(Map<String, dynamic> json) => CustomerReview(
    name: json["name"],
    review: json["review"],
    date: json["date"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "review": review,
    "date": date,
  };
}

class Menus {
  Menus({
    required this.foods,
    required this.drinks,
  });

  final List<Category> foods;
  final List<Category> drinks;

  Menus copyWith({
    required List<Category> foods,
    required List<Category> drinks,
  }) =>
      Menus(
        foods: foods,
        drinks: drinks,
      );

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    foods:
    List<Category>.from(json["foods"].map((x) => Category.fromJson(x))),
    drinks: List<Category>.from(
        json["drinks"].map((x) => Category.fromJson(x))),
  );
}