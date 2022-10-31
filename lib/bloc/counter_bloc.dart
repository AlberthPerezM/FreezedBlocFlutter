import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'counter_event.dart';
part 'counter_state.dart';
part 'counter_bloc.freezed.dart';
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const _Initial()) {
    on<CounterEvent>((event, emit) async {
      if(state is _$_Initial){
        emit(const CounterState.running(0));
      }
      else if (state is _Runing){
       int number= (state as _Runing).number;
       emit(await event.when<Future<CounterState>>(increment: () async {
           await Future.delayed(const Duration(milliseconds:500));
           return CounterState.running(number +1);

       },decrement: () async{

        await Future.delayed(const Duration(microseconds: 500));
        return CounterState.running(number-1 );
       }
       
       
       
       
        ));
       
    


      }
    /*  emit(state.when(initial: () => CounterState.running(0),
      running:(number){
        return
      event.when(increment: ()=> CounterState.running(number + 1),
       decrement: ()=>CounterState.running(number - 1));
      }));*/
    }); 
  }
}
