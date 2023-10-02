import 'package:json_annotation/json_annotation.dart';

part 'cocktail_vo.g.dart';

@JsonSerializable()
class CocktailVO {
  String? idDrink;
  String? strDrink;
  String? strDrinkAlternate;
  String? strTags;
  String? strVideo;
  String? strCategory;
  String? strIBA;
  String? strAlcoholic;
  String? strGlass;
  String? strInstructions;
  String? strInstructionsES;
  String? strInstructionsDE;
  String? strInstructionsFR;
  String? strInstructionsIT;
  @JsonKey(name: 'strInstructionsZH-HANS')
  String? strInstructionsZHHANS;
  @JsonKey(name: 'strInstructionsZH-HANT')
  String? strInstructionsZHHANT;
  String? strDrinkThumb;
  String? strIngredient1;
  String? strIngredient2;
  String? strIngredient3;
  String? strIngredient4;
  String? strIngredient5;
  String? strIngredient6;
  String? strIngredient7;
  String? strIngredient8;
  String? strIngredient9;
  String? strIngredient10;
  String? strIngredient11;
  String? strIngredient12;
  String? strIngredient13;
  String? strIngredient14;
  String? strIngredient15;
  String? strMeasure1;
  String? strMeasure2;
  String? strMeasure3;
  String? strMeasure4;
  String? strMeasure5;
  String? strMeasure6;
  String? strMeasure7;
  String? strMeasure8;
  String? strMeasure9;
  String? strMeasure10;
  String? strMeasure11;
  String? strMeasure12;
  String? strMeasure13;
  String? strMeasure14;
  String? strMeasure15;
  String? strImageSource;
  String? strImageAttribution;
  String? strCreativeCommonsConfirmed;
  String? dateModified;
  CocktailVO({
    this.idDrink,
    this.strDrink,
    this.strDrinkAlternate,
    this.strTags,
    this.strVideo,
    this.strCategory,
    this.strIBA,
    this.strAlcoholic,
    this.strGlass,
    this.strInstructions,
    this.strInstructionsES,
    this.strInstructionsDE,
    this.strInstructionsFR,
    this.strInstructionsIT,
    this.strInstructionsZHHANS,
    this.strInstructionsZHHANT,
    this.strDrinkThumb,
    this.strIngredient1,
    this.strIngredient2,
    this.strIngredient3,
    this.strIngredient4,
    this.strIngredient5,
    this.strIngredient6,
    this.strIngredient7,
    this.strIngredient8,
    this.strIngredient9,
    this.strIngredient10,
    this.strIngredient11,
    this.strIngredient12,
    this.strIngredient13,
    this.strIngredient14,
    this.strIngredient15,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strImageSource,
    this.strImageAttribution,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  factory CocktailVO.fromJson(Map<String, dynamic> json) =>
      _$CocktailVOFromJson(json);

  Map<String, dynamic> toJson() => _$CocktailVOToJson(this);

  Map<String?, String?> getIngredientAndMeasureList() {
    Map<String?, String?> result = {
      strIngredient1: strMeasure1,
      strIngredient2: strMeasure2,
      strIngredient3: strMeasure3,
      strIngredient4: strMeasure4,
      strIngredient5: strMeasure5,
      strIngredient6: strMeasure6,
      strIngredient7: strMeasure7,
      strIngredient8: strMeasure8,
      strIngredient9: strMeasure9,
      strIngredient10: strMeasure10,
      strIngredient11: strMeasure11,
      strIngredient12: strMeasure12,
      strIngredient13: strMeasure13,
      strIngredient14: strMeasure14,
      strIngredient15: strMeasure15,
    };
    result.removeWhere((key, value) => key == null);

    return result;
  }
}
