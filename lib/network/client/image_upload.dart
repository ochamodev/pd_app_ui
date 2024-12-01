
import 'package:dio/dio.dart';
import 'package:recycling_pal/network/response/classification_response.dart';
import 'package:recycling_pal/shared/endpoints.dart';
import 'package:recycling_pal/shared/environment.dart';

Future<ClassificationResponse?> uploadImage(String imgPath, String fileName) async {
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
    var classificationResponse = ClassificationResponse.fromJson(response.data);

    return classificationResponse;

  } on Exception catch (e) {
    print(e);
    return null;
  }

}