
import 'package:dio/dio.dart';
import 'package:recycling_pal/network/response/classification_response.dart';
import 'package:recycling_pal/network/response/hugging_face_response.dart';
import 'package:recycling_pal/network/response/server_response.dart';
import 'package:recycling_pal/shared/endpoints.dart';
import 'package:recycling_pal/shared/environment.dart';

Future<ServerResponse?> uploadImage(String imgPath, String fileName) async {
  try {
    final Dio dio = Dio();
    const url = "${Environment.restApiUrl}${Endpoints.imageClassification}";

    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(imgPath, filename: fileName),
    });

    final Response response = await dio.post(
        url,
        data: formData
    );
    var serverResponse = ServerResponse.fromJson(response.data);

    return serverResponse;

  } on Exception catch (e) {
    print(e);
    return ServerResponse(pytorchModel: ClassificationResponse(typeOfMaterial: "", classification: e.toString()), huggingFaceResponse: HuggingFaceResponse(typeOfMaterial: ""));
  }

}