import 'package:cocktail_db/network/constants/network_constants.dart';
import 'package:cocktail_db/network/data_agents/cocktail_data_agent.dart';
import 'package:cocktail_db/network/responses/category_list_respones.dart';
import 'package:cocktail_db/network/responses/cocktail_list_response.dart';
import 'package:cocktail_db/network/responses/ingredient_list_response.dart';
import 'package:dio/dio.dart';

class CocktailDataAgentImpl implements CocktailDataAgent {
  late Dio dio;

  static final CocktailDataAgentImpl _singleton =
      CocktailDataAgentImpl._internal();

  factory CocktailDataAgentImpl() {
    return _singleton;
  }

  CocktailDataAgentImpl._internal() {
    dio = Dio();
  }

  @override
  Future<CategoryListResponse?> getCategoryList() async {
    var responses = await dio.get('$BASE_URL/list.php?c=list');

    CategoryListResponse? categoryListRes =
        CategoryListResponse.fromJson(responses.data as Map<String, dynamic>);

    return Future.value(categoryListRes);
  }

  @override
  Future<CocktailListResponse?> getRandomCocktail() async {
    var responses = await dio.get('$BASE_URL/random.php');

    CocktailListResponse? cocktailListRes =
        CocktailListResponse.fromJson(responses.data as Map<String, dynamic>);

    return Future.value(cocktailListRes);
  }

  @override
  Future<CocktailListResponse?> getCocktailListByCategory(
      String category) async {
    var responses = await dio.get('$BASE_URL/filter.php?c=$category');
    CocktailListResponse? cocktailListRes =
        CocktailListResponse.fromJson(responses.data as Map<String, dynamic>);

    return Future.value(cocktailListRes);
  }

  @override
  Future<CocktailListResponse?> getCocktailById(String id) async {
    var responses = await dio.get('$BASE_URL/lookup.php?i=$id');
    CocktailListResponse? cocktailListRes =
        CocktailListResponse.fromJson(responses.data as Map<String, dynamic>);

    return Future.value(cocktailListRes);
  }

  @override
  Future<IngredientListResponse?> getIngredientList() async {
    var responses = await dio.get('$BASE_URL/list.php?i=list');
    IngredientListResponse? res =
        IngredientListResponse.fromJson(responses.data as Map<String, dynamic>);

    return Future.value(res);
  }

  @override
  Future<CocktailListResponse?> getCocktailListByIngredient(String ingredient) async{
      var responses = await dio.get('$BASE_URL/filter.php?i=$ingredient');
    CocktailListResponse? cocktailListRes =
        CocktailListResponse.fromJson(responses.data as Map<String, dynamic>);

    return Future.value(cocktailListRes);
  }
}
