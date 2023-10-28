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

    // Check the cocktail is already exists in storage
    bool isUnique = true;

    // Convert String List to cocktail list
    for (String ct in cocktailList) {
      Map<String, dynamic> json = jsonDecode(ct) as Map<String, dynamic>;
      CocktailVO cocktailVo = CocktailVO.fromJson(json);

      // Check the cocktail
      if (cocktail.idDrink == cocktailVo.idDrink) {
        isUnique = false;
        break;
      }
    }

    // If cocktail does not exist in storage ,add the cocktail
    if (isUnique) {
      cocktailList.add(cocktailString);
      return pref.setStringList(COCKTAIL_LIST_KEY, cocktailList);
    }

    // If cocktail exists in storage ,add the old cocktail list
    return pref.setStringList(COCKTAIL_LIST_KEY, cocktailList);
  }

  Future<bool> makeCocktailFavourite(
      {required String id, required bool isFavourite}) async {
    final pref = await _pref;
    List<String> cocktailStringList =
        pref.getStringList(COCKTAIL_LIST_KEY) ?? [];

    List<CocktailVO> cocktailVOList = cocktailStringList.map((cocktailString) {
      Map<String, dynamic> json =
          jsonDecode(cocktailString) as Map<String, dynamic>;
      CocktailVO cocktail = CocktailVO.fromJson(json);
      return cocktail;
    }).toList();

    int index = cocktailVOList.indexWhere((element) => element.idDrink == id);
    if (index > -1) {
      cocktailVOList[index].setFavourite = isFavourite;
    }

    cocktailVOList.forEach((element) {
      print("ID =====> ${element.idDrink} FAV =======> ${element.isFavourite}");
    });

    List<String> newCocktailStringList = cocktailVOList.map((element) {
      String cocktailString = jsonEncode(element);
      return cocktailString;
    }).toList();

    print(newCocktailStringList);

    return pref
        .setStringList(COCKTAIL_LIST_KEY, newCocktailStringList)
        .then((value) {
      List<String> cocktailStringList =
          pref.getStringList(COCKTAIL_LIST_KEY) ?? [];

      List<CocktailVO> cocktailVOList =
          cocktailStringList.map((cocktailString) {
        Map<String, dynamic> json =
            jsonDecode(cocktailString) as Map<String, dynamic>;
        CocktailVO cocktail = CocktailVO.fromJson(json);
        return cocktail;
      }).toList();

      cocktailVOList.forEach((element) {
        print(
            "ID =====> ${element.idDrink} FAV =======> ${element.isFavourite}");
      });
      return Future.value(true);
    });
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
