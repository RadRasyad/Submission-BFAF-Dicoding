

import 'package:flutter/material.dart';
import 'package:indorestaurant/data/api/api_service.dart';
import 'package:indorestaurant/data/model/review.dart';

enum ResultState { loading, success, error }

class ReviewProvider extends ChangeNotifier {
  final ApiService apiService;

  ReviewProvider({required this.apiService});
  late ReviewResult _reviewResult;
  late ResultState _state;
  late Map<dynamic, dynamic> _data;

  String _id = '';
  String _name = '';
  String _review = '';

  ReviewResult get result => _reviewResult;

  ResultState get state => _state;

  Future<dynamic> addReview() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final review = await apiService.addReview(_data);
      if (review.error == false) {
        notifyListeners();
        return _state = ResultState.error;
      } else {
        notifyListeners();
        return _state = ResultState.success;
      }
    } catch (e) {
      notifyListeners();
      return _state = ResultState.error;
    }
  }

  void changeName(String name) {
    _name = name;
    notifyListeners();
  }

  void changeReview(String review) {
    _review = review;
    notifyListeners();
  }

  void changeId(String id) {
    _id = id;
    notifyListeners();
  }

  void createData() {
    _data = {
      'id': _id,
      'name': _name,
      'review': _review,
    };
    notifyListeners();
  }
}
