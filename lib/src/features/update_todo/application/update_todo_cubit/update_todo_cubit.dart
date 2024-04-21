import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoapp/src/features/update_todo/domain/interface/i_update_todo_facade.dart';

part 'update_todo_cubit.freezed.dart';
part 'update_todo_state.dart';

class UpdateTodoCubit extends Cubit<UpdateTodoState> {
  final IUpdateTodoFacade _iUpdateTodoFacade;
  UpdateTodoCubit(this._iUpdateTodoFacade)
      : super(const UpdateTodoState.initial());

  Future<void> updateTodo(
      {required String id,
      required String title,
      required String description}) async {
    _iUpdateTodoFacade.updateTodo(
        id: id, title: title, description: description);
  }

  Future<void> deleteTodo({
    required String id,
  }) async {
    _iUpdateTodoFacade.deleteTodo(
      id: id,
    );
  }
}
