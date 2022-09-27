
import 'package:indorestaurant/data/model/detail_restaurant.dart';
import 'package:indorestaurant/data/model/search_restaurant.dart';
import 'dummy_data.dart';
import 'package:indorestaurant/data/model/restaurant.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  test('Parsing Test Restaurant List JSON', ()async {
    var result = RestaurantResult.fromJson(dummyListResult);

    expect(result.error, dummyListResult['error']);
    expect(result.message, dummyListResult['message']);
    expect(result.count, dummyListResult['count']);
    expect(result.restaurants.length, 20);

    expect(result.restaurants[0].id, 'rqdv5juczeskfw1e867');
  });
  
  test('Parsing Test Restaurant Search Data JSON', ()async {
    var result = SearchRestaurantResult.fromJson(dummySearchResult);

    expect(result.error, dummySearchResult['error']);
    expect(result.founded, dummySearchResult['founded']);

    expect(result.restaurants.length, 1);
    expect(result.restaurants[0].id, 'rqdv5juczeskfw1e867');
  });

  test('Parsing Test Detail Restaurant Data JSON', ()async {
    var result = DetailRestaurantResult.fromJson(dummyDetailResult);

    expect(result.error, dummyDetailResult['error']);
    expect(result.message, dummyDetailResult['message']);
    expect(result.message, 'success');

    expect(result.restaurant.id, 'rqdv5juczeskfw1e867');
    expect(result.restaurant.name, 'Melting Pot');
    expect(result.restaurant.city, 'Medan');
  });

}