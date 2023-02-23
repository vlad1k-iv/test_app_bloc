import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app_bloc/app.dart';
import 'package:test_app_bloc/cubit/photos_cubit/photos_cubit.dart';

void main() {
  runApp(MultiBlocProvider(providers: _providers(), child: const MyApp()));
}

_providers() {
  return [
    BlocProvider<PhotosCubit>(create: (context) => PhotosCubit()),
    BlocProvider<PhotoCubit>(create: (context) => PhotoCubit()),
  ];
}
