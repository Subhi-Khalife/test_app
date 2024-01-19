import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedNetworkImageView extends StatelessWidget {
  const CachedNetworkImageView({
    required this.url,
    this.onTap,
    this.boxFit,
    this.errorWidget = const SizedBox(),
    this.width,
    this.height,
    this.color,
    Key? key,
  }) : super(key: key);
  final Color ?color;
  final String url;
  final Function()? onTap;
  final BoxFit? boxFit;
  final Widget errorWidget;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: url.isEmpty
          ? Container(color: Colors.grey)
          : CachedNetworkImage(
              imageUrl: url,
              fit: boxFit ?? BoxFit.cover,
              width: width,
              height: height,
              color: color,
              placeholder: (context, imageUrl) => Container(
                color: Colors.grey,
              ),
              errorWidget: (context, imageUrl, error) => errorWidget,
            ),
    );
  }
}
