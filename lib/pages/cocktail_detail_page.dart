import 'package:cocktail_db/blocs/detail_bloc.dart';
import 'package:cocktail_db/constants/dimens.dart';
import 'package:cocktail_db/constants/strings.dart';
import 'package:cocktail_db/data/vos/cocktail_vo.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

class CocktailDetailPage extends StatelessWidget {
  final CocktailVO cocktailVO;
  const CocktailDetailPage({super.key, required this.cocktailVO});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DetailBloc(cocktailVO),
      child: Consumer<DetailBloc>(
        builder: (context, bloc, child) => Scaffold(
          backgroundColor: Colors.orangeAccent.shade100,
          appBar: AppBar(
            backgroundColor: Colors.orangeAccent,
          ),
          body: bloc.resultCocktail == null
              ? const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orangeAccent,
                  ),
                )
              : Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: MARGIN_MEDIUM_2x,
                          vertical: MARGIN_MEDIUM),
                      child: ImageNameAndCategorySection(
                          cocktailVO: bloc.resultCocktail),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: MARGIN_MEDIUM_2x,
                          vertical: MARGIN_MEDIUM),
                      child:
                          DescriptionSection(cocktailVO: bloc.resultCocktail),
                    )
                  ],
                ),
        ),
      ),
    );
  }
}

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({
    super.key,
    required this.cocktailVO,
  });

  final CocktailVO? cocktailVO;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InfoTextView(
          title: GLASS,
          text: cocktailVO?.strGlass ?? '',
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        InfoTextView(
          title: IS_ALCHOLIC,
          text: cocktailVO?.strAlcoholic ?? '',
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_3x,
        ),
        const Text(
          INGREDIENTS,
          style:
              TextStyle(fontWeight: FontWeight.w600, fontSize: TEXT_REGULAR_2x),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: cocktailVO?.getIngredientAndMeasureList().length ?? 0,
          itemBuilder: (context, index) {
            Map<String?, String?> ingredient =
                cocktailVO?.getIngredientAndMeasureList() ?? {};
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: MARGIN_SMALL),
              child: InfoTextView(
                  title: ingredient.keys.toList()[index] ?? '',
                  text: ingredient.values.toList()[index] ?? ''),
            );
          },
        ),
        const SizedBox(
          height: MARGIN_MEDIUM_3x,
        ),
        const Text(
          INSTRUCTIONS,
          style:
              TextStyle(fontWeight: FontWeight.w600, fontSize: TEXT_REGULAR_2x),
        ),
        const SizedBox(
          height: MARGIN_MEDIUM,
        ),
        Text(
          cocktailVO?.strInstructions ?? '',
          style: const TextStyle(fontSize: TEXT_REGULAR_2x),
        ),
      ],
    );
  }
}

class InfoTextView extends StatelessWidget {
  final String title;
  final String text;
  const InfoTextView({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontWeight: FontWeight.w600, fontSize: TEXT_REGULAR_2x),
        ),
        const Spacer(),
        Text(
          text,
          style: const TextStyle(fontSize: TEXT_REGULAR_2x),
        )
      ],
    );
  }
}

class ImageNameAndCategorySection extends StatelessWidget {
  const ImageNameAndCategorySection({
    super.key,
    required this.cocktailVO,
  });

  final CocktailVO? cocktailVO;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
          child: Image.network(
            cocktailVO?.strDrinkThumb ?? '',
            width: COCKTAIL_IMAGE_SIZE_IN_DETAIL_PAGE,
            height: COCKTAIL_IMAGE_SIZE_IN_DETAIL_PAGE,
          ),
        ),
        // Container(
        //   width: COCKTAIL_IMAGE_SIZE_IN_DETAIL_PAGE,
        //   height: COCKTAIL_IMAGE_SIZE_IN_DETAIL_PAGE,
        //   decoration: BoxDecoration(
        //       color: Colors.white,
        //       borderRadius: BorderRadius.circular(MARGIN_MEDIUM),
        //       image: DecorationImage(
        //           image: NetworkImage(cocktailVO?.strDrinkThumb ?? ''))),
        // ),

        const SizedBox(
          width: MARGIN_MEDIUM_2x,
        ),
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                cocktailVO?.strDrink ?? '',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: TEXT_BIG,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                cocktailVO?.strCategory ?? '',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: TEXT_REGULAR_3x,
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        )
      ],
    );
  }
}
