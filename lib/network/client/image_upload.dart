
import 'package:dio/dio.dart';
import 'package:recycling_pal/shared/endpoints.dart';
import 'package:recycling_pal/shared/environment.dart';

void uploadImage(String imgPath, String fileName) async {
  final Dio dio = Dio();
  const url = "${Environment.restApiUrl}${Endpoints.imageClassification}";

  FormData formData = FormData.fromMap({
    'image': await MultipartFile.fromFile(imgPath, filename: fileName),
  });

  final Response response = await dio.post(
    url,
    data: formData
  );

}