import 'package:freezed_annotation/freezed_annotation.dart';
import 'user.dart';
import '../device/device.dart';

part 'data_export.freezed.dart';
part 'data_export.g.dart';

@freezed
class DataExport with _$DataExport {
  const factory DataExport({
    required DateTime exportedAt,
    required User user,
    required List<Device> devices,
    required int messageCount,
  }) = _DataExport;

  factory DataExport.fromJson(Map<String, dynamic> json) =>
      _$DataExportFromJson(json);
}
