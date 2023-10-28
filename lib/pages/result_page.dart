import 'package:cocktail_db/blocs/result_bloc.dart';
import 'package:cocktail_db/constants/dimens.dart';
import 'package:cocktail_db/constants/strings.dart';
import 'package:cocktail_db/pages/cocktail_detail_page.dart';
import 'package:cocktail_db/widgets/cocktail_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum ResultPath { search, ingredient, category }

class ResultPage extends StatelessWidget {
  final String searchKey;
  final ResultPath resultPath;
  const ResultPage(
      {super.key, required this.searchKey, required this.resultPath});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ResultBloc(searchKey: searchKey, path: resultPath),
      child: Consumer<ResultBloc>(
        builder: (context, bloc, child) => Scaffold(
          appBar: AppBar(
            title: const Text(RESULT),
            backgroundColor: Colors.orangeAccent,
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: MARGIN_MEDIUM_2x),
            child: bloc.resultList == null
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.orangeAccent,
                    ),
                  )
                : ListView.builder(
                    itemCount: bloc.resultList?.length ?? 0,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.symmetric(vertical: MARGIN_MEDIUM),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CocktailDetailPage(
                                      cocktailVO: bloc.resultList![index],
                                    )));
                          },
                          child: CocktailListItem(
                            cocktailVO: bloc.resultList![index],
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ),
      ),
    );
  }
}
