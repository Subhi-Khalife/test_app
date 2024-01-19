import 'package:flutter/material.dart';


class ServerError extends StatelessWidget {
  final Function clickActionFunction;
  final String? svgImage;
  final String? errorTitle;
  const ServerError(
      {Key? key, required this.clickActionFunction,  this.svgImage, this.errorTitle})
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
                "$errorTitle \nPlease click to refresh",
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
