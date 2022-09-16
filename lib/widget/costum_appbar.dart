
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final Widget body;

  const CustomAppbar({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Column(
            children: [
              _buildCustomAppBar(context),
              Expanded(
                child: body,
              ),
            ],
          ),
    );
  }
}

Card _buildCustomAppBar(BuildContext context) {
  return Card(
    color: const Color(0xFFEE7465),
    margin: const EdgeInsets.all(0),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.zero,
    ),
    child: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 8.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "IndoRestaurant",
                  style: Theme.of(context).textTheme.headline6,
                ),
                IconButton(
                  onPressed: () {
                    //Navigator.pushNamed(context, SearchPage.routeName);
                  },
                  icon: const Icon(Icons.search),
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}