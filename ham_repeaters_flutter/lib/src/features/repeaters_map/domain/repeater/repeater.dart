import 'package:freezed_annotation/freezed_annotation.dart';

part 'repeater.freezed.dart';

enum RepeaterMode {
  fm,
  c4fm,
  dstar,
  dmr,
  allmode,
  echolink,
  winlink,
  other,
}

enum RepeaterStatus {
  active,
  inactive,
  unknown,
}

@freezed
abstract class Repeater with _$Repeater {
  const factory Repeater({
    required String id,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? name,
    required String callsign,
    int? nodeNumber,
    String? managerCallsign,
    required int frequencyHz,
    int? shiftHz,
    String? shiftRaw,
    String? toneRaw,
    double? ctcssHz,
    required RepeaterMode mode,
    String? network,
    required RepeaterStatus status,
    String? region,
    String? provinceCode,
    String? locality,
    String? locator,
    double? latitude,
    double? longitude,
    double? distanceMeters,
  }) = _Repeater;
}
