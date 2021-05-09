import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState.initial());

  void onIncrement() {
    emit(CounterState(state.counter + 1));
  }

  void onDecrement() {
    emit(CounterState(state.counter - 1));
  }
}
