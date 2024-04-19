import 'package:flutter/material.dart';
import 'package:todoapp/src/core/presentation/app.dart';
import 'package:todoapp/src/core/infrastructure/bootstrap_app.dart';

void main() async {
  await bootstrapApp();
  runApp(const App());
}
