## Architecture overview
This project is a fork from [counter-pure-bloc](https://github.com/KRRySS/counter-pure-bloc) It's very simple example of BLoC architecture pattern based on [flutter_bloc](https://pub.dev/packages/flutter_bloc).
- stream management for events has hidden implementation and reduces boilerplate code,
- BLoC gives us opportunity to observe all bloc instances using BlocObserver,
- adding new events to BLoC:
```dart
  context.read<CounterBloc>()..onIncrement();

  void onIncrement() {
    add(IncrementEvent());
  }

```
- overridden method which mapping events to state:
```dart
  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield CounterState(counter: state.counter + 1);
    } else if (event is DecrementEvent) {
      yield CounterState(counter: state.counter - 1);
    }
  }

```
- returning widgets and capturing state from BLoC using BlocBuilder (or BlocListener for no side effects):
```dart
  BlocBuilder<CounterBloc, CounterState>(
    builder: (context, state) {
      //get the data
      final counter = state.counter;
      return Text(
        '$counter',
        style: Theme.of(context).textTheme.headline4,
      );
    },
  ),

```
- closing all stream manually for preventing memory leaks is not necessary


<br />
<br />

![alt text][architecture]

[architecture]: https://miro.medium.com/max/1360/0*-vqhX7Z7wdxw9xSc "BLoC architecture, resource: https://miro.medium.com/max/1360/0*-vqhX7Z7wdxw9xSc"
