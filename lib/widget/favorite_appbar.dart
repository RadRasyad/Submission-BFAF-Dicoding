
import 'package:flutter/material.dart';
import 'package:indorestaurant/ui/search_page.dart';

class FavoriteAppbar extends StatelessWidget {
  final Widget body;

  const FavoriteAppbar({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
      ),
      body: body
    );
  }

}