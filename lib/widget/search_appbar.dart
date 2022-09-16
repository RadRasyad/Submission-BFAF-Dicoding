
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:indorestaurant/provider/search_restaurant_provider.dart';

class SearchAppbar extends StatelessWidget {
  final Widget body;

  const SearchAppbar({super.key, required this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: [
              const BuildSearchAppBar(),
              Expanded(
                child: body,
              ),
            ],
          )),
    );
  }

}

class BuildSearchAppBar extends StatefulWidget {
  const BuildSearchAppBar({Key? key}) : super(key: key);

  @override
  State<BuildSearchAppBar> createState() => _BuildSearchAppBarState();
}

class _BuildSearchAppBarState extends State<BuildSearchAppBar> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          color: const Color(0xFFEE7465),
          margin: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 18.0,
              horizontal: 8.0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Search",
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child:
            Expanded(
              child: TextField(
                cursorColor: Colors.black,
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                  ),
                ),
                onSubmitted: (value) {
                  Provider.of<SearchRestaurantProvider>(context, listen: false)
                      .changeSearchString(value);
                },
              ),
            ),

        ),
      ],
    );
  }
}


