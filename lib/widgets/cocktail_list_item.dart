import 'package:cocktail_db/constants/dimens.dart';
import 'package:flutter/material.dart';

class CocktailListItem extends StatelessWidget {
  const CocktailListItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: COCKTAIL_LIST_ITEM_HEIGHT,
      decoration: BoxDecoration(
          color: Colors.yellow.shade200,
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2x)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2x),
        child: Row(
          children: [
            Image.network(
              "https://www.thecocktaildb.com/images/media/drink/rrtssw1472668972.jpg",
            ),
            const SizedBox(
              width: MARGIN_MEDIUM,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Cocktail name',
                  style:
                      TextStyle(color: Colors.black, fontSize: TEXT_REGULAR_3x),
                ),
                const SizedBox(
                  height: MARGIN_MEDIUM,
                ),
                Text(
                  'Cocktail Category',
                  style:
                      TextStyle(color: Colors.black45, fontSize: TEXT_REGULAR),
                ),
              ],
            ),
            const Spacer(),
            Icon(Icons.favorite_border),
            const SizedBox(
              width: MARGIN_MEDIUM_2x,
            ),
          ],
        ),
      ),
    );
  }
}
