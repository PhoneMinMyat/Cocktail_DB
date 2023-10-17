import 'package:cocktail_db/data/models/cocktail_model.dart';
import 'package:cocktail_db/data/models/cocktail_model_impl.dart';
import 'package:cocktail_db/data/vos/cocktail_vo.dart';
import 'package:flutter/foundation.dart';

class DetailBloc extends ChangeNotifier {
  final CocktailModel _model = CocktailModelImpl();

  bool isDisposed = false;
  CocktailVO? resultCocktail;

  DetailBloc(CocktailVO cocktailVO) {
    getData(cocktailVO);
  }

  void getData(CocktailVO cocktailVO) async {
    if (cocktailVO.strInstructions == null) {
      await _model
          .getCocktailListById(cocktailVO.idDrink ?? '0')
          .then((cocktail) {
        resultCocktail = cocktail;
        safeNotifyListeners();
      });
    } else {
      resultCocktail = cocktailVO;
      safeNotifyListeners();
    }

    if (resultCocktail != null) {
      await _model.putCocktailToPersistence(resultCocktail!).then((value) {
        if (value) {
          print('Saved Success');
        }
      });
    }
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
