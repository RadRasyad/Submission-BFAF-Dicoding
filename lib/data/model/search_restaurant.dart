
import 'package:indorestaurant/data/model/restaurant.dart';

class SearchRestaurantResult {
  SearchRestaurantResult({
    required this.error,
    required this.founded,
    required this.restaurants,
  });

  final bool error;
  final int founded;
  final List<Restaurant> restaurants;

  SearchRestaurantResult copyWith({
    required bool error,
    required int founded,
    required List<Restaurant> restaurants,
  }) =>
      SearchRestaurantResult(
        error: error,
        founded: founded,
        restaurants: restaurants,
      );

  factory SearchRestaurantResult.fromJson(Map<String, dynamic> json) =>
      SearchRestaurantResult(
        error: json["error"],
        founded: json["founded"],
        restaurants: List<Restaurant>.from(
            json["restaurants"].map((x) => Restaurant.fromJson(x))),
      );
}
