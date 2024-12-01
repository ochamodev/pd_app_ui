import 'package:json_annotation/json_annotation.dart';

part 'classification_response.g.dart';

@JsonSerializable()
class ClassificationResponse {
  @JsonKey(name: "type_of_material")
  final String typeOfMaterial;
  @JsonKey(name: "classification")
  final String classification;

  ClassificationResponse({
    required this.typeOfMaterial,
    required this.classification
  });

  factory ClassificationResponse.fromJson(Map<String, dynamic> json)
    => _$ClassificationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ClassificationResponseToJson(this);

}