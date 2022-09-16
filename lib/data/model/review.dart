
import 'package:indorestaurant/data/model/detail_restaurant.dart';

class ReviewResult {
  ReviewResult({
    required this.error,
    required this.message,
    required this.customerReviews,
  });

  final bool error;
  final String message;
  final List<CustomerReview> customerReviews;

  ReviewResult copyWith({
    required bool error,
    required String message,
    required List<CustomerReview> customerReviews,
  }) =>
      ReviewResult(
        error: error,
        message: message,
        customerReviews: customerReviews,
      );

  factory ReviewResult.fromJson(Map<String, dynamic> json) => ReviewResult(
        error: json["error"],
        message: json["message"],
        customerReviews: List<CustomerReview>.from(
            json["customerReviews"].map((x) => CustomerReview.fromJson(x))),
      );
}
