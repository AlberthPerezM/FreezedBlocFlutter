import 'package:flutter/material.dart';
import 'package:freezed_bloc/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) =>CounterBloc(),
      child:const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
