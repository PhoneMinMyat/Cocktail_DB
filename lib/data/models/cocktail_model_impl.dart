import 'package:cocktail_db/data/models/cocktail_model.dart';
import 'package:cocktail_db/data/vos/category_vo.dart';
import 'package:cocktail_db/data/vos/cocktail_vo.dart';
import 'package:cocktail_db/data/vos/ingredient_vo.dart';
import 'package:cocktail_db/network/data_agents/cocktail_data_agent.dart';
import 'package:cocktail_db/network/data_agents/cocktail_data_agent_impl.dart';
import 'package:cocktail_db/persistence/persistence_service.dart';

class CocktailModelImpl implements CocktailModel {
  late CocktailDataAgent dataAgent;
  late PersistenceService persistenceService;

  static final CocktailModelImpl _singleton = CocktailModelImpl._internal();

  factory CocktailModelImpl() {
    return _singleton;
  }

  CocktailModelImpl._internal() {
    initilize();
  }

  void initilize() async {
    dataAgent = CocktailDataAgentImpl();
    persistenceService = PersistenceService();
  }

  @override
  Future<List<CategoryVO>?> getCategoryListFromNetwork() {
    return dataAgent.getCategoryList().then((categoryListRes) {
      return categoryListRes?.categoryList;
    });
  }

  @override
  Future<CocktailVO?> getRandomCocktailFromNetwork() {
    return dataAgent.getRandomCocktail().then((cocktailListRes) {
      return cocktailListRes?.cocktailList?.first;
    });
  }

  @override
  Future<List<CocktailVO>?> getCocktailListByCategory(String category) {
    return dataAgent
        .getCocktailListByCategory(category)
        .then((cocktailListRes) {
      return cocktailListRes?.cocktailList;
    });
  }

  @override
  Future<CocktailVO?> getCocktailListById(String id) {
    return dataAgent.getCocktailById(id).then((cocktailListRes) {
      return cocktailListRes?.cocktailList?.first;
    });
  }

  @override
  Future<List<IngredientVO>?> getIngredientListFromNetwork() {
    return dataAgent.getIngredientList().then((value) => value?.ingredientList);
  }

  @override
  Future<List<CocktailVO>?> getCocktailListByIngredient(String ingredient) {
    return dataAgent
        .getCocktailListByIngredient(ingredient)
        .then((value) => value?.cocktailList);
  }

  @override
  Future<List<CocktailVO>?> getCocktailListFromPersistence() {
    return persistenceService.getSavedCokctailList();
  }

  @override
  Future<bool> putCocktailToPersistence(CocktailVO cocktailVO) {
    return persistenceService.saveSingleCocktail(cocktailVO);
  }
}
