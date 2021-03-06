import 'package:flutter/foundation.dart';
import 'package:nooberfood/domain/data_structures/recipe_preview.dart';

class RecipePreviewModel extends RecipePreview {
  RecipePreviewModel({
    @required String title,
    @required String imageType,
    @required int id,
  })  : assert(title != null),
        assert(id != null),
        assert(imageType != null),
        super(
          id: id,
          title: title,
          imageUrl:
              "https://spoonacular.com/recipeImages/${id.toString()}-636x393.$imageType",
        );
  factory RecipePreviewModel.fromJson(Map<String, dynamic> json) {
    return RecipePreviewModel(
      id: (json["id"] as num).toInt(),
      title: json["title"] as String,
      imageType: _extractImageType(json),
    );
  }
}

String _extractImageType(Map<String, dynamic> json) {
  if (json["imageType"] != null) {
    return json["imageType"] as String;
  }
  return (json["image"] as String).split(".")[1];
}
