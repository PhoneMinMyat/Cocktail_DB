import 'package:cocktail_db/constants/dimens.dart';
import 'package:cocktail_db/constants/strings.dart';
import 'package:cocktail_db/widgets/cocktail_list_item.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: MARGIN_MEDIUM_2x,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
          child: Text(
            FAVOURITE,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: TEXT_BIG,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
            itemCount: 10,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(bottom: MARGIN_MEDIUM),
              child: CocktailListItem(),
            ),
          ),
        )
      ],
    );
  }
}
