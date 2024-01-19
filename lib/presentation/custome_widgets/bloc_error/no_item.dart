import 'package:flutter/material.dart';
import 'package:test_app/common/config/color/colors_app.dart';
import 'package:test_app/common/config/font_size/font_size.dart';
import 'package:test_app/common/config/text_style/text_style.dart';


class NoItem extends StatelessWidget {
  final Function clickActionFunction;
  final String? svgImage;
  final String? errorTitle;
  const NoItem(
      {Key? key, required this.clickActionFunction, required this.svgImage, this.errorTitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => clickActionFunction(),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // if (svgImage != null) ShowSvg(svgImage!),
            // const Sh8(),
            Text(
              "No items found",
              textAlign: TextAlign.center,
              style: FontTextStyle.regular(
                  fontSize: FontSize.medium, color: ColorsApp.mainColorsApp.natural.shade700),
            ),
            // ClipRRect(
            //   borderRadius: BorderRadius.circular(120),
            //   child: InkWell(
            //     onTap: () {
            //       clickActionFunction();
            //     },
            //     child: Container(
            //       width: MediaQuery.of(context).size.width,
            //       child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Row(
            //           mainAxisSize: MainAxisSize.min,
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.center,
            //           children: [
            //             const SW8(),
            //             Text(
            //               AppLocalizations.of(context)!.press_to_refresh,
            //               style: FontTextStyle.regular(
            //                   fontSize: FontSize.medium, color: ColorsApp.mainColorsApp.primary),
            //             ),
            //             const SW8(),
            //           ],
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            // const Sh40(),
          ],
        ),
      ),
    );
  }
}
