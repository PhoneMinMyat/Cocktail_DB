import 'package:cocktail_db/constants/dimens.dart';
import 'package:cocktail_db/constants/strings.dart';
import 'package:cocktail_db/widgets/cocktail_list_item.dart';
import 'package:flutter/material.dart';

class CocktailPage extends StatelessWidget {
  const CocktailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_2x, vertical: MARGIN_MEDIUM),
          child: SearchView(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MARGIN_MEDIUM_2x, vertical: MARGIN_MEDIUM),
          child: RecommendedCocktailsView(),
        ),
        CocktailListView()
      ],
    );
  }
}

class CocktailListView extends StatelessWidget {
  const CocktailListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: MARGIN_MEDIUM_2x, vertical: MARGIN_MEDIUM),
            child: CocktailListItem(),
          );
        },
      ),
    );
  }
}

class RecommendedCocktailsView extends StatelessWidget {
  const RecommendedCocktailsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: RECOMMENDED_COCKTAIL_VIEW_SIZE,
      height: RECOMMENDED_COCKTAIL_VIEW_SIZE,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(MARGIN_MEDIUM)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
        child: Stack(children: [
          Image.network(
              "https://www.thecocktaildb.com/images/media/drink/rrtssw1472668972.jpg"),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.black54,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: MARGIN_MEDIUM, vertical: MARGIN_MEDIUM_2x),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Cocktail name',
                      style: TextStyle(
                          color: Colors.white, fontSize: TEXT_REGULAR_3x),
                    ),
                    const SizedBox(
                      height: MARGIN_MEDIUM,
                    ),
                    Text(
                      'Cocktail Category',
                      style: TextStyle(
                          color: Colors.white, fontSize: TEXT_REGULAR),
                    ),
                  ],
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM_2x)),
      child: TextField(
        onSubmitted: (value) {},
        decoration: const InputDecoration(
            hintText: SEARCH,
            hintStyle: TextStyle(color: Colors.black38),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black38,
            ),
            border: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
