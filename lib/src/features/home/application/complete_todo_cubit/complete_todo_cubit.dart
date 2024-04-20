import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todoapp/src/features/home/domain/demo_data.dart';

part 'complete_todo_cubit.freezed.dart';
part 'complete_todo_state.dart';

class CompleteTodoCubit extends Cubit<CompleteTodoState> {
  CompleteTodoCubit() : super(const CompleteTodoState.initial());

  Future<void> completeTodo({required String id}) async {
    for (var data in demoData) {
      log(id);
      if (data.id == id) {
        data.isDone = !data.isDone;
      }
    }
  }
}
