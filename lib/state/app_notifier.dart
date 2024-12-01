
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recycling_pal/network/client/image_upload.dart';
import 'package:recycling_pal/state/app_state.dart';

class AppNotifier extends StateNotifier<AppState> {

  AppNotifier() : super(AppState(materialType: '', classification: ''));

  Future<void> classifyImage(String imgPath, String fileName) async {
    final response = await uploadImage(imgPath, fileName);

    if (response != null) {
      final AppState appState = AppState(
          materialType: response.typeOfMaterial,
          classification: response.classification
      );
      state =  appState;
    } else {
      state = AppState(
          materialType: '',
          classification: ''
      );
    }
  }

}

final appNotifierProvider = StateNotifierProvider<AppNotifier, AppState>((ref) => AppNotifier());
