part of 'createtodo_cubit.dart';

@freezed
class CreatetodoState with _$CreatetodoState {
  const factory CreatetodoState.initial() = _Initial;
  const factory CreatetodoState.created(bool isCreated) = _Created;
}
