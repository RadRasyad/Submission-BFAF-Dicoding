import 'package:flutter/material.dart';
import 'package:indorestaurant/data/api/api_service.dart';
import 'package:indorestaurant/widget/review_form_page_view.dart';
import 'package:provider/provider.dart';
import 'package:indorestaurant/provider/review_provider.dart';

class ReviewPage extends StatelessWidget {
  static const routeName = '/review_page';
  final String id;

  const ReviewPage({Key? key, required this.id}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ReviewProvider>(
      create: (_) => ReviewProvider(apiService: ApiService()),
      child: ReviewFormPageView(id: id),
    );
  }
}
