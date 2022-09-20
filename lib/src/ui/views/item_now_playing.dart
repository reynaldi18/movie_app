import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../constant/config.dart';
import '../../models/movie.dart';
import '../shared/styles.dart';
import '../shared/ui_helpers.dart';

class ItemNowPlaying extends StatelessWidget {
  final Movie movie;

  const ItemNowPlaying({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 147.0,
          height: 210.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.network(
              '${Config.baseImageUrl}${movie.posterPath}',
              fit: BoxFit.cover,
              loadingBuilder: (
                BuildContext context,
                Widget child,
                ImageChunkEvent? loadingProgress,
              ) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              },
            ),
          ),
        ),
        verticalSpace(11.0),
        SizedBox(
          width: 147.0,
          child: Text(
            movie.title ?? '',
            style: whiteSemiBoldTextStyle.copyWith(
              fontSize: 14.0,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        verticalSpace(6.0),
        RatingBar.builder(
          initialRating: (movie.voteAverage ?? 0.0) / 2,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemSize: 14.0,
          itemPadding: const EdgeInsets.symmetric(horizontal: 1.4),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          ignoreGestures: true,
          onRatingUpdate: (rating) {},
        ),
      ],
    );
  }
}
