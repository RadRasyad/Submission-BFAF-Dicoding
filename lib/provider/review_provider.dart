

import 'package:flutter/material.dart';
import 'package:indorestaurant/data/api/api_service.dart';
import 'package:indorestaurant/data/model/review.dart';

enum ResultState { loading, success, error }

class ReviewProvider extends ChangeNotifier {
  final ApiService apiService;

  ReviewProvider({required this.apiService});
  late ReviewResult _reviewResult;
  late ResultState _state;
  late Map<dynamic, dynamic> _dataReview;

  String _rId = '';
  String _rName = '';
  String _rReview = '';

  ReviewResult get result => _reviewResult;

  ResultState get state => _state;

  Future<dynamic> addReview() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final review = await apiService.addReview(_dataReview);
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

  void changeId(String id) {
    _rId = id;
    notifyListeners();
  }

  void changeName(String name) {
    _rName = name;
    notifyListeners();
  }

  void changeReview(String review) {
    _rReview = review;
    notifyListeners();
  }

  void createData() {
    _dataReview = {
      'id': _rId,
      'name': _rName,
      'review': _rReview,
    };
    notifyListeners();
  }
}
