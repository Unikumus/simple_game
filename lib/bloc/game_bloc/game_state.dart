part of 'game_bloc.dart';

@freezed
class GameState with _$GameState {
  const factory GameState({
    required List<ButtonEntity> buttons,
    required Status status,
  }) = _GameState;
}
