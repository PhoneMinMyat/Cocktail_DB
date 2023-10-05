import 'package:json_annotation/json_annotation.dart';

part 'ingredient_vo.g.dart';

@JsonSerializable()
class IngredientVO {
  @JsonKey(name: 'strIngredient1')
  String? ingredient;

  IngredientVO({
    this.ingredient,
  });

  factory IngredientVO.fromJson(Map<String, dynamic> json) =>
      _$IngredientVOFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientVOToJson(this);
}
