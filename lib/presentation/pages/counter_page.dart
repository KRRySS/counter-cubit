import 'package:counter_bloc/presentation/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';

class CounterPage extends StatelessWidget {
  final String title;

  CounterPage({this.title});

  void _incrementCounter(BuildContext context) {
    context.read<CounterBloc>()..onIncrement();
  }

  void _decrementCounter(BuildContext context) {
    context.read<CounterBloc>()..onDecrement();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterBloc, CounterState>(
              listener: (context, state) {
                if (state is IncrementEvent) {
                  print("Increment counter");
                } else if (state is DecrementEvent) {
                  print("Decrement counter");
                }
              },
              builder: (context, state) {
                //get the data
                final counter = state.counter;
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: _buildButtons(context),
    );
  }

  Row _buildButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          onPressed: () => _decrementCounter(context),
          tooltip: 'Decrement',
          child: Icon(Icons.remove),
        ),
        FloatingActionButton(
          onPressed: () => _incrementCounter(context),
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      ],
    );
  }
}
