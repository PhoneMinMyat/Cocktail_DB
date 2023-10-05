
import 'package:cocktail_db/data/vos/ingredient_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ingredient_list_response.g.dart';

@JsonSerializable()
class IngredientListResponse {
  @JsonKey(name: 'drinks')
  List<IngredientVO>? ingredientList;

  IngredientListResponse({
    this.ingredientList,
  });

  factory IngredientListResponse.fromJson(Map<String, dynamic> json) => _$IngredientListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientListResponseToJson(this);
}
