
import 'package:json_annotation/json_annotation.dart';

part 'hugging_face_response.g.dart';

@JsonSerializable()
class HuggingFaceResponse {
  @JsonKey(name: "type_of_material")
  final String typeOfMaterial;

  HuggingFaceResponse({
    required this.typeOfMaterial
  });

  factory HuggingFaceResponse.fromJson(Map<String, dynamic> json)
    => _$HuggingFaceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HuggingFaceResponseToJson(this);

}
