## Architecture overview
This project is a fork from [counter-bloc](https://github.com/KRRySS/counter-bloc) It's very simple example of BLoC architecture pattern with Cubit.
- abandons the concept of Events and simplifies the way of emitting state,
- events are changed to methods,
- emitting new state in response to function call:
```dart
  void onIncrement() {
    emit(CounterState(state.counter + 1));
  }

```
- returning widgets and capturing state from BLoC using BlocBuilder (or BlocListener for no side effects):
```dart
  BlocBuilder<CounterCubit, CounterState>(
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


# fl_template

## Getting Started

This project is a starting point for a lm_monitor_cs application.

## Install lefthook
Firstly, we need to install lefthook globally. Based on your environment, there are a few options
- If you have Node.js installed:
```console
npm install -g @arkweid/lefthook
```

- If you’re in a Ruby-based environment:
```console
gem install lefthook
```
You may need to run these commands as sudo

## Boostratping lm_monitor_cs project
Run below script in main root after checkout this repo:
```console
./bootstrap.sh
```
This is work-around for maven_repository_v2 accessibility from local filesystem
