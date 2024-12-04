import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
class AppState with _$AppState {
  const factory AppState({
    required String huggingFaceMaterial,
    required String pytorchMaterial,
    required String pytorchClassification,
    required bool loading
  }) = _AppState;

}
