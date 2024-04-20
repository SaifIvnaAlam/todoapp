part of 'complete_todo_cubit.dart';

@freezed
class CompleteTodoState with _$CompleteTodoState {
  const factory CompleteTodoState.initial() = _Initial;
  const factory CompleteTodoState.complete() = _Complete;
}
