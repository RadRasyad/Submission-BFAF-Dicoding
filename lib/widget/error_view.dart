
import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String errorMsg;

  const ErrorView({Key? key, required this.errorMsg})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(Icons.error_outline, size: 40),
        const SizedBox(height: 16.0),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            errorMsg,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}