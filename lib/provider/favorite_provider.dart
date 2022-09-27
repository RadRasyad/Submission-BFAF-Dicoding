
import 'package:flutter/cupertino.dart';
import 'package:indorestaurant/data/db/database_helper.dart';
import 'package:indorestaurant/data/model/restaurant.dart';
import 'package:indorestaurant/utils/result_state.dart';

class FavoriteProvider extends ChangeNotifier {
  final DatabaseHelper dbHelper;

  FavoriteProvider({required this.dbHelper}) {
    _getFavorite();
  }

  late ResultState _state;
  ResultState get state => _state;

  String _message = '';
  String get message => _message;

  List<Restaurant> _favRestaurant = [];
  List<Restaurant> get favRestaurant => _favRestaurant;

  void _getFavorite() async {
    _state = ResultState.loading;
    _favRestaurant = await dbHelper.getFavorites();
    if (_favRestaurant.isNotEmpty) {
      _state = ResultState.hasData;
    } else {
      _state = ResultState.noData;
      _message = 'Empty Data';
    }
    notifyListeners();
  }

  void addFavorite(Restaurant restaurant) async {
    try {
      await dbHelper.insertFavorite(restaurant);
      _getFavorite();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

  Future<bool> isFavorited(String id) async {
    final favoritedRestaurant = await dbHelper.getFavoriteById(id);
    return favoritedRestaurant.isNotEmpty;
  }

  void removeFavorite(String id) async {
    try {
      await dbHelper.removeFavorite(id);
      _getFavorite();
    } catch (e) {
      _state = ResultState.error;
      _message = 'Error: $e';
      notifyListeners();
    }
  }

}