import 'package:cocktail_db/constants/dimens.dart';
import 'package:cocktail_db/constants/strings.dart';
import 'package:flutter/material.dart';

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
    return Column(
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
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
            itemCount: dummyIngredientsList.length,
            itemBuilder: (context, index) => Container(
              margin: const EdgeInsets.only(bottom: MARGIN_MEDIUM),
              padding: const EdgeInsets.symmetric(
                  horizontal: MARGIN_MEDIUM_2x, vertical: MARGIN_MEDIUM),
              height: MARGIN_XXLARGE,
              decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(MARGIN_MEDIUM)),
              child: Center(child: Text(dummyIngredientsList[index])),
            ),
          ),
        )
      ],
    );
  }
}
