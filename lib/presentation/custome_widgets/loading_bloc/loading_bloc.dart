import 'package:flutter/material.dart';
import 'package:test_app/common/config/color/colors_app.dart';

class LoadingBloc extends StatelessWidget {
  const LoadingBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      backgroundColor: ColorsApp.mainColorsApp.primary,
      strokeWidth: 2,
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.white70),
    ));
  }
}
