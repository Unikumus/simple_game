import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:simple_game/domain/models/button_entity.dart';

part 'game_event.dart';
part 'game_state.dart';
part 'game_bloc.freezed.dart';

enum GameLevel {
  simple,
  medium,
  hard,
}

enum Status {
  running,
  stop,
}

extension GameLevelExt on GameLevel {
  static GameLevel fromInt(int level) {
    switch (level) {
      case 1:
        return GameLevel.simple;
      case 2:
        return GameLevel.medium;
      case 3:
        return GameLevel.hard;
      default:
        return GameLevel.simple;
    }
  }
}

class GameBloc extends Bloc<GameEvent, GameState> {
  GameBloc({
    required this.gameLevel,
  }) : super(GameState(
            status: Status.running,
            buttons: switch (gameLevel) {
              GameLevel.simple => generateGrid(4, 4),
              GameLevel.medium => generateGrid(5, 5),
              GameLevel.hard => generateGrid(6, 6),
            })) {
    on<_UpdateBtn>(_onUpdateBtn);
    on<_Restart>(_onRestart);
  }

  Future<void> _onUpdateBtn(_UpdateBtn event, emit) async {
    final listForUpdate = List.of(state.buttons);

    int index = listForUpdate.indexWhere((btn) => btn.id == event.btnId);

    listForUpdate[index] = listForUpdate[index].copyWith(
        count: (listForUpdate[index].count < 5
            ? listForUpdate[index].count + 1
            : 1));

    final listForUpdate2 = List.of(listForUpdate);

    emit(state.copyWith(buttons: listForUpdate2));
  }

  Future<void> _onRestart(_Restart event, emit) async {
    emit(state.copyWith(status: Status.stop));

    emit(GameState(
        status: Status.running,
        buttons: switch (gameLevel) {
          GameLevel.simple => generateGrid(4, 4),
          GameLevel.medium => generateGrid(5, 5),
          GameLevel.hard => generateGrid(6, 6),
        }));
  }

  static generateGrid(int row, int column) {
    return [
      // first row
      ...[
        const ButtonEntity(id: 0, count: -1, type: ButtonType.empty),
        //
        ...List<ButtonEntity>.generate(
            column - 1,
            (int index) =>
                ButtonEntity(id: index + 1, count: -1, type: ButtonType.dummy)),
      ],
      // rows
      ...List<ButtonEntity>.generate(
          column * (row - 1),
          (int index) => index % column == 0
              ? ButtonEntity(
                  id: index + column, count: -1, type: ButtonType.dummy)
              : ButtonEntity(
                  id: index + column, count: 1, type: ButtonType.numeric)),
    ];
  }

  final GameLevel gameLevel;
}
