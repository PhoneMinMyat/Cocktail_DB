import 'package:cocktail_db/data/models/cocktail_model.dart';
import 'package:cocktail_db/data/models/cocktail_model_impl.dart';
import 'package:cocktail_db/data/vos/cocktail_vo.dart';
import 'package:flutter/foundation.dart';

class FavouriteBloc extends ChangeNotifier {
  bool isDisposed = false;
  final CocktailModel _model = CocktailModelImpl();

  List<CocktailVO>? favouriteCocktailList;

  FavouriteBloc() {
    getData();
  }

  void getData() async {
    await _model.getFavouriteCocktail().then((value) {
      favouriteCocktailList = value;
      safeNotifyListeners();
    });
  }

  Future<void> makeCocktailFavourite(
      {required String id, required bool isFavourite}) async {
    print('CALLED ON TAP FROM BLOC');
    await _model.makeCocktailFavourite(id: id, isFavourite: isFavourite);
    getData();
    safeNotifyListeners();
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
