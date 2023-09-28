import 'package:cocktail_db/blocs/category_bloc.dart';
import 'package:cocktail_db/constants/dimens.dart';
import 'package:cocktail_db/constants/strings.dart';
import 'package:cocktail_db/data/vos/category_vo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CategoryBloc(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: MARGIN_MEDIUM_2x,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
            child: Text(
              CATEGORY,
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
            child: Consumer<CategoryBloc>(
              builder: (context, bloc, child) => (bloc.categoryList == null)
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.orangeAccent,
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: MARGIN_MEDIUM_2x),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: MARGIN_MEDIUM,
                              mainAxisSpacing: MARGIN_MEDIUM,
                              childAspectRatio: 4 / 2),
                      itemCount: bloc.categoryList?.length ?? 0,
                      itemBuilder: (context, index) {
                        CategoryVO temp = bloc.categoryList![index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: MARGIN_MEDIUM),
                          padding: const EdgeInsets.symmetric(
                              horizontal: MARGIN_MEDIUM_2x,
                              vertical: MARGIN_MEDIUM),
                          height: MARGIN_XXLARGE,
                          decoration: BoxDecoration(
                              color: Colors.orangeAccent,
                              borderRadius:
                                  BorderRadius.circular(MARGIN_MEDIUM)),
                          child: Center(child: Text(temp.category ?? '')),
                        );
                      },
                    ),
            ),
          )
        ],
      ),
    );
  }
}
