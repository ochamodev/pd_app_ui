
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recycling_pal/network/client/image_upload.dart';
import 'package:recycling_pal/state/app_state.dart';

class AppNotifier extends StateNotifier<AppState> {

  AppNotifier() : super(AppState(huggingFaceMaterial: '', pytorchClassification: '', pytorchMaterial: '', loading: false));

  Future<void> classifyImage(String imgPath, String fileName) async {
    final response = await uploadImage(imgPath, fileName);

    if (response != null) {
      final AppState appState = AppState(
        huggingFaceMaterial: response.huggingFaceResponse.typeOfMaterial,
        pytorchClassification: response.pytorchModel.classification,
        pytorchMaterial: response.pytorchModel.typeOfMaterial,
        loading: false
      );
      state =  appState;
    } else {
      state = const AppState(
        pytorchMaterial: 'Error no se pudo ejecutar la operación',
        pytorchClassification: '',
        huggingFaceMaterial: '',
        loading: false
      );
    }
  }

  setLoading(bool loading) {
    state = state.copyWith(
      loading: loading
    );
  }

}

final appNotifierProvider = StateNotifierProvider<AppNotifier, AppState>((ref) => AppNotifier());
