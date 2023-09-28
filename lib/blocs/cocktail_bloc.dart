 import 'package:cocktail_db/data/models/cocktail_model.dart';
import 'package:cocktail_db/data/models/cocktail_model_impl.dart';
import 'package:cocktail_db/data/vos/cocktail_vo.dart';
import 'package:flutter/foundation.dart';

class CocktailBloc extends ChangeNotifier{
final CocktailModel _model = CocktailModelImpl();

bool isDisposed = false;

CocktailVO? randomCocktail;


CocktailBloc(){
  _model.getRandomCocktailFromNetwork().then((cocktail) {
    randomCocktail = cocktail;
    safeNotifyListeners();
  });
}


void safeNotifyListeners(){
if(!isDisposed){
notifyListeners();
}
 }
@override
void dispose() {
isDisposed = true;
super.dispose();
}
}