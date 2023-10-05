import 'package:cocktail_db/data/models/cocktail_model.dart';
import 'package:cocktail_db/data/models/cocktail_model_impl.dart';
import 'package:cocktail_db/data/vos/ingredient_vo.dart';
import 'package:flutter/foundation.dart';

class IngredientBloc extends ChangeNotifier {
  final CocktailModel _model = CocktailModelImpl();
  bool isDisposed = false;
  List<IngredientVO>? ingredientList ;
  IngredientBloc(){
    _model.getIngredientListFromNetwork().then((value) {
      ingredientList = value;
      ingredientList?.sort((a, b) => a.ingredient?.compareTo(b.ingredient ?? '') ?? 0,);
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
