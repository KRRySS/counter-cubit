part of 'counter_cubit.dart';

@immutable
class CounterState extends Equatable {
  final int counter;

  const CounterState(this.counter);

  factory CounterState.initial() => CounterState(0);

  @override
  List<Object> get props => [counter];
}
