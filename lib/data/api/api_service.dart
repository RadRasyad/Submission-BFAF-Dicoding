
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:indorestaurant/data/model/detail_restaurant.dart';
import 'package:indorestaurant/data/model/restaurant.dart';

class ApiService {
  static const String _baseUrl = 'https://restaurant-api.dicoding.dev/';
  static const String _rList = 'list';
  static const String _rDetail = 'detail';
  static const String _rSearch = 'search?q=';
  static const String _rReview = 'review';

  Future<RestaurantResult> getListRestaurant() async {
    final response = await http.get(Uri.parse("$_baseUrl$_rList"));
    if (response.statusCode == 200) {
      return RestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<DetailRestaurantResult> getDetailRestaurant(String id) async {
    final response = await http.get(Uri.parse("$_baseUrl$_rDetail/$id"));
    if (response.statusCode == 200) {
      return DetailRestaurantResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }

  // Future<SearchRestaurantResult> searchRestaurant(String name) async {
  //   final response = await http.get(Uri.parse("$_baseUrl$_search$name"));
  //   if (response.statusCode == 200) {
  //     return SearchRestaurantResult.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to load data');
  //   }
  // }
  //
  // Future<ReviewResult> addReview(Map<dynamic, dynamic> data) async {
  //   final response =
  //       await http.post(Uri.parse("$_baseUrl$_review"), body: data);
  //   if (response.statusCode == 200) {
  //     return ReviewResult.fromJson(json.decode(response.body));
  //   } else {
  //     throw Exception('Failed to post data');
  //   }
  // }

}
