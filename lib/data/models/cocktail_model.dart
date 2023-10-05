import 'package:cocktail_db/data/vos/category_vo.dart';
import 'package:cocktail_db/data/vos/cocktail_vo.dart';
import 'package:cocktail_db/data/vos/ingredient_vo.dart';

abstract class CocktailModel{
  Future<List<CategoryVO>?> getCategoryListFromNetwork();
  Future<List<IngredientVO>?> getIngredientListFromNetwork();
  Future<CocktailVO?> getRandomCocktailFromNetwork();
  Future<List<CocktailVO>?> getCocktailListByCategory(String category);
  Future<List<CocktailVO>?> getCocktailListByIngredient(String ingredient);
  Future<CocktailVO?> getCocktailListById(String id);
}