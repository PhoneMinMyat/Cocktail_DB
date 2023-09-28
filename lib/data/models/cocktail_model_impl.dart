import 'package:cocktail_db/data/models/cocktail_model.dart';
import 'package:cocktail_db/data/vos/category_vo.dart';
import 'package:cocktail_db/network/data_agents/cocktail_data_agent.dart';
import 'package:cocktail_db/network/data_agents/cocktail_data_agent_impl.dart';

class CocktailModelImpl implements CocktailModel {
  late CocktailDataAgent dataAgent;

  static final CocktailModelImpl _singleton = CocktailModelImpl._internal();

  factory CocktailModelImpl() {
    return _singleton;
  }

  CocktailModelImpl._internal() {
    dataAgent = CocktailDataAgentImpl();
  }

  @override
  Future<List<CategoryVO>?> getCategoryListFromNetwork() {
    return dataAgent.getCategoryList().then((categoryListRes) {
      return categoryListRes?.categoryList;
    });
  }
}
