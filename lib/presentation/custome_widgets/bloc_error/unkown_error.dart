import 'package:flutter/material.dart';

class UnKownError extends StatelessWidget {
  final Function clickActionFunction;
  final String title;
  const UnKownError({Key? key, required this.clickActionFunction, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => clickActionFunction(),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "$title \nPlease click to refresh",
                textAlign: TextAlign.center,

              ),
            ],
          ),
        ),
      ),
    );
  }
}
