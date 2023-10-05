import 'package:cocktail_db/constants/dimens.dart';
import 'package:cocktail_db/data/vos/cocktail_vo.dart';
import 'package:flutter/material.dart';

class CocktailListItem extends StatelessWidget {
  final CocktailVO cocktailVO;
  const CocktailListItem({
    super.key,
    required this.cocktailVO,
  });

  @override
  Widget build(BuildContext context) {
    return cocktailVO.strDrink == null
        ? const SizedBox.shrink()
        : Container(
            height: COCKTAIL_LIST_ITEM_HEIGHT,
            decoration: BoxDecoration(
                color: Colors.yellow.shade200,
                borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2x)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2x),
              child: Row(
                children: [
                  Image.network(
                    cocktailVO.strDrinkThumb ?? '',
                    loadingBuilder: (context, child, loadingProgress) {
                      return (loadingProgress != null)
                          ? const Center(child: CircularProgressIndicator())
                          : child;
                    },
                    height: COCKTAIL_LIST_ITEM_HEIGHT,
                    width: COCKTAIL_LIST_ITEM_HEIGHT,
                  ),
                  const SizedBox(
                    width: MARGIN_MEDIUM,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cocktailVO.strDrink ?? '',
                          maxLines: 2,
                          style: const TextStyle(
                              color: Colors.black, fontSize: TEXT_REGULAR_3x),
                        ),
                        const SizedBox(
                          height: MARGIN_MEDIUM,
                        ),
                        Text(
                          cocktailVO.strCategory ?? '',
                          style: const TextStyle(
                              color: Colors.black45, fontSize: TEXT_REGULAR),
                        ),
                      ],
                    ),
                  ),
                  // const Spacer(),
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
