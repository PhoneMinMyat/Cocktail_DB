import 'package:cocktail_db/blocs/favourite_bloc.dart';
import 'package:cocktail_db/constants/dimens.dart';
import 'package:cocktail_db/constants/strings.dart';
import 'package:cocktail_db/data/vos/cocktail_vo.dart';
import 'package:cocktail_db/widgets/cocktail_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FavouriteBloc(),
      child: Consumer<FavouriteBloc>(
        builder: (context, bloc, child) => Column(
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
              child: bloc.favouriteCocktailList == null
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.orangeAccent,
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: MARGIN_MEDIUM_2x),
                      itemCount: bloc.favouriteCocktailList!.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.only(bottom: MARGIN_MEDIUM),
                        child: CocktailListItem(
                          cocktailVO: bloc.favouriteCocktailList![index],
                          onTapFavourite: () {
                            bloc.makeCocktailFavourite(
                                id: bloc.favouriteCocktailList![index]
                                        .idDrink ??
                                    '',
                                isFavourite: !(bloc
                                        .favouriteCocktailList![index]
                                        .isFavourite ??
                                    false));
                          },
                        ),
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
