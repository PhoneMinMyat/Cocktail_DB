import 'dart:convert';

import 'package:cocktail_db/data/vos/cocktail_vo.dart';
import 'package:cocktail_db/persistence/persistence_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersistenceService {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();
  // static final PersistenceService _singleton = PersistenceService._internal();

  // factory PersistenceService() {
  //   return _singleton;
  // }

  // PersistenceService._internal() {}

  Future<bool> saveSingleCocktail(CocktailVO cocktail) async {
    final pref = await _pref;
    String cocktailString = jsonEncode(cocktail.toJson());
    List<String> cocktailList = pref.getStringList(COCKTAIL_LIST_KEY) ?? [];
    cocktailList.add(cocktailString);
    return pref.setStringList(COCKTAIL_LIST_KEY, cocktailList);
  }

  Future<List<CocktailVO>> getSavedCokctailList() async {
    final pref = await _pref;
    List<CocktailVO> cocktailList = [];
    List<String> cocktailStringList =
        pref.getStringList(COCKTAIL_LIST_KEY) ?? [];
    for (var cocktailString in cocktailStringList) {
      Map<String, dynamic> json =
          jsonDecode(cocktailString) as Map<String, dynamic>;
      CocktailVO cocktail = CocktailVO.fromJson(json);
      cocktailList.add(cocktail);
    }
    return Future.value(cocktailList);
  }
}
