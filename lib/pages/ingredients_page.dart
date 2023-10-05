import 'package:cocktail_db/blocs/ingredient_bloc.dart';
import 'package:cocktail_db/constants/dimens.dart';
import 'package:cocktail_db/constants/strings.dart';
import 'package:cocktail_db/pages/result_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IngredientsPage extends StatelessWidget {
  const IngredientsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> dummyIngredientsList = [
      'Cocktails 1',
      'Cocktails 2',
      'Cocktails 3',
      'Cocktails 4',
      'Cocktails 5',
      'Cocktails 6',
      'Cocktails 7',
      'Cocktails 8',
      'Cocktails 9',
      'Cocktails 10',
      'Cocktails 11',
      'Cocktails 12',
      'Cocktails 13',
      'Cocktails 14',
    ];
    return ChangeNotifierProvider(
      create: (context) => IngredientBloc(),
      child: Consumer<IngredientBloc>(
        builder: (context, bloc, child) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: MARGIN_MEDIUM_2x,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
              child: Text(
                INGREDIENTS,
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: TEXT_BIG,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: MARGIN_LARGE,
            ),
            Expanded(
              child: (bloc.ingredientList == null)
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.orangeAccent,
                      ),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: MARGIN_MEDIUM_2x),
                      itemCount: bloc.ingredientList?.length ?? 0,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ResultPage(
                                  searchKey:
                                      bloc.ingredientList?[index].ingredient ??
                                          '',
                                  resultPath: ResultPath.ingredient)));
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: MARGIN_MEDIUM),
                          padding: const EdgeInsets.symmetric(
                              horizontal: MARGIN_MEDIUM_2x,
                              vertical: MARGIN_MEDIUM),
                          height: MARGIN_XXLARGE,
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius:
                                  BorderRadius.circular(MARGIN_MEDIUM)),
                          child: Center(
                              child: Text(
                                  bloc.ingredientList?[index].ingredient ??
                                      '')),
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
