import 'package:cocktail_db/network/responses/category_list_respones.dart';
import 'package:cocktail_db/network/responses/cocktail_list_response.dart';

abstract class CocktailDataAgent{
  Future<CategoryListResponse?> getCategoryList();
  Future<CocktailListResponse?> getRandomCocktail();
}