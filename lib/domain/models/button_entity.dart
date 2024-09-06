import 'package:freezed_annotation/freezed_annotation.dart';

part 'button_entity.freezed.dart';

enum ButtonType {
  empty,
  dummy,
  numeric,
}

@freezed
class ButtonEntity with _$ButtonEntity {
  const factory ButtonEntity({
    required int id,
    required int count,
    required ButtonType type,
  }) = _ButtonEntity;
}
