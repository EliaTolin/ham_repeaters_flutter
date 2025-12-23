import 'package:freezed_annotation/freezed_annotation.dart';

part 'repeater_model.freezed.dart';
part 'repeater_model.g.dart';

@freezed
abstract class RepeaterModel with _$RepeaterModel {
  const factory RepeaterModel({
    required String id,
    @JsonKey(name: 'created_at') required String createdAt,
    @JsonKey(name: 'updated_at') required String updatedAt,
    String? name,
    required String callsign,
    @JsonKey(name: 'node_number') int? nodeNumber,
    @JsonKey(name: 'manager_callsign') String? managerCallsign,
    @JsonKey(name: 'frequency_hz') required int frequencyHz,
    @JsonKey(name: 'shift_hz') int? shiftHz,
    @JsonKey(name: 'shift_raw') String? shiftRaw,
    @JsonKey(name: 'tone_raw') String? toneRaw,
    @JsonKey(name: 'ctcss_hz') double? ctcssHz,
    required String mode,
    String? network,
    required String status,
    String? region,
    @JsonKey(name: 'province_code') String? provinceCode,
    String? locality,
    String? locator,
    double? lat,
    double? lon,
    @JsonKey(name: 'distance_m') double? distanceM,
  }) = _RepeaterModel;

  factory RepeaterModel.fromJson(Map<String, dynamic> json) =>
      _$RepeaterModelFromJson(json);
}
