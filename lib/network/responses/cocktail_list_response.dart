import 'package:json_annotation/json_annotation.dart';

import 'package:cocktail_db/data/vos/cocktail_vo.dart';

part 'cocktail_list_response.g.dart';

@JsonSerializable()
class CocktailListResponse {
  @JsonKey(name: 'drinks')
  List<CocktailVO>? cocktailList;
  CocktailListResponse({
    this.cocktailList,
  });

  factory CocktailListResponse.fromJson(Map<String, dynamic> json) =>
      _$CocktailListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CocktailListResponseToJson(this);
}
