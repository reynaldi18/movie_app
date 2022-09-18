import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../shared/colors.dart';
import '../shared/styles.dart';
import '../shared/ui_helpers.dart';

class ItemMovie extends StatelessWidget {
  const ItemMovie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 28.0,
        left: 21.0,
        right: 21.0,
      ),
      child: SizedBox(
        height: 167.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 117.0,
              height: 167.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: BaseColors.grey,
              ),
            ),
            horizontalSpace(12.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title Movie',
                          style: whiteBoldTextStyle.copyWith(fontSize: 20.0),
                        ),
                        verticalSpace(12.0),
                        RatingBar.builder(
                          initialRating: 3,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 14.0,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 1.4),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          ignoreGestures: true,
                          onRatingUpdate: (rating) {},
                        ),
                        verticalSpace(12.0),
                        Text(
                          'P-G 13+',
                          style: whiteBoldTextStyle.copyWith(
                            fontSize: 12.0,
                            color: BaseColors.white.withOpacity(0.6),
                          ),
                        ),
                        verticalSpace(4.0),
                        Text(
                          'Action, Sci-fi',
                          style: whiteRegularTextStyle.copyWith(
                            fontSize: 12.0,
                            color: BaseColors.white.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.0),
                      color: BaseColors.primary,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14.0,
                        vertical: 8.0,
                      ),
                      child: Text(
                        'View Detail',
                        style: whiteSemiBoldTextStyle.copyWith(
                          fontSize: 12.0,
                        ),
                      ),
                    ),
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
