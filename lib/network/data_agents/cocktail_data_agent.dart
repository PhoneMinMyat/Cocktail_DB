import 'package:cocktail_db/network/responses/category_list_respones.dart';

abstract class CocktailDataAgent{
  Future<CategoryListResponse?> getCategoryList();
}