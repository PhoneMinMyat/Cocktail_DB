import 'package:cocktail_db/data/vos/category_vo.dart';
import 'package:cocktail_db/data/vos/cocktail_vo.dart';

abstract class CocktailModel{
  Future<List<CategoryVO>?> getCategoryListFromNetwork();
  Future<CocktailVO?> getRandomCocktailFromNetwork();
}