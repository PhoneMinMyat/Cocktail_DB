import 'package:cocktail_db/data/vos/category_vo.dart';
import 'package:json_annotation/json_annotation.dart';

part 'category_list_respones.g.dart';

@JsonSerializable()
class CategoryListResponse {
  @JsonKey(name: 'drinks')
  List<CategoryVO>? categoryList;

  CategoryListResponse({
    this.categoryList,
  });

  factory CategoryListResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryListResponseFromJson(json);
      
  Map<String, dynamic> toJson() => _$CategoryListResponseToJson(this);
}
