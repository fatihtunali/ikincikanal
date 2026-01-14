import 'package:freezed_annotation/freezed_annotation.dart';

part 'error.freezed.dart';
part 'error.g.dart';

@freezed
class ApiError with _$ApiError {
  const factory ApiError({
    required String code,
    required String message,
    Map<String, dynamic>? details,
  }) = _ApiError;

  factory ApiError.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorFromJson(json);
}

@freezed
class ValidationError with _$ValidationError {
  const factory ValidationError({
    required String code,
    required String message,
    required List<FieldError> fields,
  }) = _ValidationError;

  factory ValidationError.fromJson(Map<String, dynamic> json) =>
      _$ValidationErrorFromJson(json);
}

@freezed
class FieldError with _$FieldError {
  const factory FieldError({
    required String path,
    required String message,
  }) = _FieldError;

  factory FieldError.fromJson(Map<String, dynamic> json) =>
      _$FieldErrorFromJson(json);
}
