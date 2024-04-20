import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/src/features/home/presentation/home_page.dart';
import 'package:todoapp/src/features/home/infrastructure/todo_facade.dart';
import 'package:todoapp/src/features/home/application/Todo_cubit/todo_cubit.dart';
import 'package:todoapp/src/features/create_todo/infrastructure/create_todo_facade.dart';
import 'package:todoapp/src/features/home/application/complete_todo_cubit/complete_todo_cubit.dart';
import 'package:todoapp/src/features/create_todo/application/create_todo_cubit/createtodo_cubit.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TodoCubit(TodoFacade())),
        BlocProvider(create: (context) => CreatetodoCubit(CreateTodoFacade())),
        BlocProvider(create: (context) => CompleteTodoCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: GoogleFonts.robotoTextTheme(),
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.cyan.shade400,
          ),
        ),
        home: const HomePage(),
      ),
    );
  }
}
