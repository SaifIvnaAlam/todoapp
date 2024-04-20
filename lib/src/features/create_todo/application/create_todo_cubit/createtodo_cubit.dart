import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoapp/src/features/create_todo/domain/i_create_todo_facade.dart';

// ignore_for_file: no_leading_underscores_for_local_identifiers

part 'createtodo_cubit.freezed.dart';
part 'createtodo_state.dart';

class CreatetodoCubit extends Cubit<CreatetodoState> {
  final ICreateTodoFacade _createTodoFacade;
  CreatetodoCubit(this._createTodoFacade)
      : super(const CreatetodoState.initial());

  Future<void> createTodo(
      {required String title, required String description}) async {
    _createTodoFacade.createTodo(title: title, description: description);
    emit(const CreatetodoState.created(true));
  }
}
