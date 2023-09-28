import 'package:cocktail_db/data/vos/category_vo.dart';

abstract class CocktailModel{
  Future<List<CategoryVO>?> getCategoryListFromNetwork();
}