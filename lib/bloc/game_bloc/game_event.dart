part of 'game_bloc.dart';

@freezed
class GameEvent with _$GameEvent {
  const factory GameEvent.updateBtn({required int btnId}) = _UpdateBtn;
  const factory GameEvent.restart() = _Restart;
}
