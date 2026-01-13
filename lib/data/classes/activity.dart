import "package:freezed_annotation/freezed_annotation.dart";
import "package:json_annotation/json_annotation.dart";
import "package:flutter/foundation.dart";

part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
abstract class Activity with _$Activity {
  const factory Activity({
    required String activity,
    required num availability,
    required String type,
    required int participants,
    required num price,
    required String accessibility,
    required String duration,
    required bool kidFriendly,
    required String link,
    required String key,
  }) = _Activity;

  factory Activity.fromJson(Map<String, Object?> json) =>
      _$ActivityFromJson(json);
}
