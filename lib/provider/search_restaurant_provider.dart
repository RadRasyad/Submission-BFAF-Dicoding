
import 'package:flutter/material.dart';
import 'package:indorestaurant/data/api/api_service.dart';
import 'package:indorestaurant/data/model/search_restaurant.dart';
import 'package:indorestaurant/utils/result_state.dart';

class SearchRestaurantProvider extends ChangeNotifier {
  final ApiService apiService;

  SearchRestaurantProvider({required this.apiService}) {
    _fetchAllSearchRestaurant();
  }

  late SearchRestaurantResult _searchRestaurantResult;
  late ResultState _state;
  String _message = '';
  String _searchQuery = '';

  String get message => _message;

  SearchRestaurantResult get result => _searchRestaurantResult;

  ResultState get state => _state;

  Future<dynamic> _fetchAllSearchRestaurant() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final searchRestaurant = await apiService.searchRestaurant(_searchQuery);
      if (searchRestaurant.error == true && searchRestaurant.founded == 0) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _searchRestaurantResult = searchRestaurant;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = e.toString();
    }
  }

  void changeSearchString(String searchString) {
    _searchQuery = searchString;
    notifyListeners();
    _fetchAllSearchRestaurant();
  }

}
