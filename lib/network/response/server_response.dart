
import 'package:json_annotation/json_annotation.dart';
import 'package:recycling_pal/network/response/classification_response.dart';
import 'package:recycling_pal/network/response/hugging_face_response.dart';

part 'server_response.g.dart';

@JsonSerializable()
class ServerResponse {
  @JsonKey(name: "pytorch_model")
  final ClassificationResponse pytorchModel;
  @JsonKey(name: "hugging_face_model")
  final HuggingFaceResponse huggingFaceResponse;

  ServerResponse({
    required this.pytorchModel,
    required this.huggingFaceResponse
  });

  factory ServerResponse.fromJson(Map<String, dynamic> json)
    => _$ServerResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServerResponseToJson(this);

}
