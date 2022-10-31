import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_bloc/bloc/counter_bloc.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Freezed Bloc'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
               return Text(
                state.when(initial:() => '-' , running:(number) => '$number'),
                style: const TextStyle(fontSize: 30,fontWeight: FontWeight.bold),
                
               );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(onPressed: () {
              
             context.read<CounterBloc>()
               .add(CounterEvent.increment());


            },
             child: const Text('Increment'))
          ],
        ),
      ),
    );
  }
}
