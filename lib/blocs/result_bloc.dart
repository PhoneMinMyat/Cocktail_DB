import 'package:cocktail_db/data/models/cocktail_model.dart';
import 'package:cocktail_db/data/models/cocktail_model_impl.dart';
import 'package:cocktail_db/data/vos/category_vo.dart';
import 'package:cocktail_db/data/vos/cocktail_vo.dart';
import 'package:cocktail_db/pages/result_page.dart';
import 'package:flutter/foundation.dart';

class ResultBloc extends ChangeNotifier {
  final CocktailModel _model = CocktailModelImpl();
  bool isDisposed = false;
  List<CocktailVO>? resultList;

  ResultBloc({required String searchKey, required ResultPath path}) {
    switch (path) {
      case ResultPath.search:
        searchByName(searchKey);
        break;

      case ResultPath.ingredient:
        searchByIngredient(searchKey);
        break;

      case ResultPath.category:
        searchByCategory(searchKey);
        break;
    }
  }

  void searchByCategory(String key) async {
    await _model.getCocktailListByCategory(key).then((cocktailList) {
      resultList = cocktailList;
      safeNotifyListeners();
    });
  }

  void searchByIngredient(String key) async {
    await _model.getCocktailListByIngredient(key).then((cocktailList) {
      resultList = cocktailList;
      safeNotifyListeners();
    });
  }

  void searchByName(String key) {
    //TODO make search by name
  }

  void safeNotifyListeners() {
    if (!isDisposed) {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    isDisposed = true;
    super.dispose();
  }
}
