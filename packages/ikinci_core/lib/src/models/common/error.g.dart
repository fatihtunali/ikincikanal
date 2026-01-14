// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiErrorImpl _$$ApiErrorImplFromJson(Map<String, dynamic> json) =>
    _$ApiErrorImpl(
      code: json['code'] as String,
      message: json['message'] as String,
      details: json['details'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$ApiErrorImplToJson(_$ApiErrorImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'details': instance.details,
    };

_$ValidationErrorImpl _$$ValidationErrorImplFromJson(
  Map<String, dynamic> json,
) => _$ValidationErrorImpl(
  code: json['code'] as String,
  message: json['message'] as String,
  fields: (json['fields'] as List<dynamic>)
      .map((e) => FieldError.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$$ValidationErrorImplToJson(
  _$ValidationErrorImpl instance,
) => <String, dynamic>{
  'code': instance.code,
  'message': instance.message,
  'fields': instance.fields,
};

_$FieldErrorImpl _$$FieldErrorImplFromJson(Map<String, dynamic> json) =>
    _$FieldErrorImpl(
      path: json['path'] as String,
      message: json['message'] as String,
    );

Map<String, dynamic> _$$FieldErrorImplToJson(_$FieldErrorImpl instance) =>
    <String, dynamic>{'path': instance.path, 'message': instance.message};
