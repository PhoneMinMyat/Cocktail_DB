import 'package:cocktail_db/blocs/cocktail_bloc.dart';
import 'package:cocktail_db/constants/dimens.dart';
import 'package:cocktail_db/constants/strings.dart';
import 'package:cocktail_db/data/vos/cocktail_vo.dart';
import 'package:cocktail_db/pages/cocktail_detail_page.dart';
import 'package:cocktail_db/pages/result_page.dart';
import 'package:cocktail_db/widgets/cocktail_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CocktailPage extends StatelessWidget {
  const CocktailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CocktailBloc(),
      child: const Column(
        children: [
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
      ),
    );
  }
}

class CocktailListView extends StatelessWidget {
  const CocktailListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<CocktailBloc>(
      builder: (context, bloc, child) => (bloc.savedCocktailList == null)
          ? const Expanded(
              child: Center(
                child: CircularProgressIndicator(color: Colors.orangeAccent),
              ),
            )
          : Expanded(
              child: ListView.builder(
                itemCount: bloc.savedCocktailList?.length ?? 0,
                itemBuilder: (context, index) {
                  CocktailVO cocktailVO =
                      bloc.savedCocktailList?[index] ?? CocktailVO();
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: MARGIN_MEDIUM_2x, vertical: MARGIN_MEDIUM),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CocktailDetailPage(
                                cocktailVO: bloc.savedCocktailList?[index] ??
                                    CocktailVO())));
                      },
                      child: CocktailListItem(
                        cocktailVO: cocktailVO,
                        onTapFavourite: () {
                          bloc.makeCocktailFavourite(
                              id: cocktailVO.idDrink ?? '',
                              isFavourite: !(cocktailVO.isFavourite ?? false));
                        },
                      ),
                    ),
                  );
                },
              ),
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
    return Consumer<CocktailBloc>(
      builder: (context, bloc, child) => GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (context) => CocktailDetailPage(
                      cocktailVO: bloc.randomCocktail ?? CocktailVO())))
              .then((value) {
            bloc.getDataFromPersistence();
          });
        },
        child: Container(
          width: RECOMMENDED_COCKTAIL_VIEW_SIZE,
          height: RECOMMENDED_COCKTAIL_VIEW_SIZE,
          decoration:
              BoxDecoration(borderRadius: BorderRadius.circular(MARGIN_MEDIUM)),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
            child: (bloc.randomCocktail == null)
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orangeAccent,
                    ),
                  )
                : Stack(children: [
                    Image.network(bloc.randomCocktail?.strDrinkThumb ?? ''),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.black54,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: MARGIN_MEDIUM,
                              vertical: MARGIN_MEDIUM_2x),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                bloc.randomCocktail?.strDrink ?? '',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: TEXT_REGULAR_3x),
                              ),
                              const SizedBox(
                                height: MARGIN_MEDIUM,
                              ),
                              Text(
                                bloc.randomCocktail?.strCategory ?? '',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: TEXT_REGULAR),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ]),
          ),
        ),
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
        onSubmitted: (value) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  ResultPage(searchKey: value, resultPath: ResultPath.search)));
        },
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
