import 'package:cocktail_db/data/models/cocktail_model.dart';
import 'package:cocktail_db/data/models/cocktail_model_impl.dart';
import 'package:cocktail_db/data/vos/category_vo.dart';
import 'package:flutter/foundation.dart';

class CategoryBloc extends ChangeNotifier {
  final CocktailModel _model = CocktailModelImpl();

  bool isDisposed = false;

  List<CategoryVO>? categoryList;

  CategoryBloc() {
    _model.getCategoryListFromNetwork().then((list) {
      categoryList = list ?? [];
      safeNotifyListeners();
    });
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
