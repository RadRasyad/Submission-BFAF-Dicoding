
import 'package:flutter/material.dart';

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