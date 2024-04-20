import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoapp/src/features/home/domain/entities/todo_model.dart';
import 'package:todoapp/src/features/home/domain/interface/i_todo_facade.dart';

// ignore_for_file: no_leading_underscores_for_local_identifiers

part 'todo_cubit.freezed.dart';
part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  final ITodoFacade _iTodoFacade;
  TodoCubit(this._iTodoFacade) : super(const TodoState.loading());

  Future<void> getTodos() async {
    emit(const TodoState.loading());
    final _response = await _iTodoFacade.getTodos();
    emit(TodoState.loaded(_response));
  }

  Future<void> completeTodo({required String id}) async {
    final _res = await _iTodoFacade.completedTodo(id: id);
    log(_res.toString());
    getTodos();
  }
}
