part of 'todo_cubit.dart';

@freezed
class TodoState with _$TodoState {
  const factory TodoState.loading() = _Loading;
  const factory TodoState.loaded(List<ToDoModel> todos) = _Loaded;
  const factory TodoState.error() = _Error;
}
