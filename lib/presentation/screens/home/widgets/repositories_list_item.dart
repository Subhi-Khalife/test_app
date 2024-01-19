import 'package:flutter/material.dart';
import 'package:test_app/domain/Entities/home/repository.dart';
import 'package:test_app/presentation/custome_widgets/cached_network_image.dart';

class RepostioriesListItem extends StatelessWidget {
  final Repository repository;
  const RepostioriesListItem({super.key, required this.repository});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.22,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: CachedNetworkImageView(
                    url: repository.owner.avatarUrl,
                    width: MediaQuery.of(context).size.width * 0.22,
                    height: 90,
                  )),
            ),
            const SizedBox(width: 12),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name : ${repository.fullName}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "is private : ${repository.private == false ? "Yes" : "No"}",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
