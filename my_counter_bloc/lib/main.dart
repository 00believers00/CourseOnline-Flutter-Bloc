import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_counter_bloc/blocs/counter/counter_bloc.dart';

import 'other_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterBloc>(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'MyCounter Bloc',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocListener<CounterBloc, CounterState>(
          listener: (context, state) {
            if (state.counter == 3) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Text("counter is ${state.counter}"),
                  );
                },
              );
            } else if (state.counter == -1) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const OtherPage();
                  },
                ),
              );
            }
          },
          child: Center(
            child: Text(
              '${context.watch<CounterBloc>().state.counter}',
              style: const TextStyle(fontSize: 52.0),
            ),
          ),
        ),
        floatingActionButton: Row(
          children: [
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(IncrementCounterEvent());
              },
              tooltip: 'Increment',
              heroTag: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              onPressed: () {
                BlocProvider.of<CounterBloc>(context).add(DecrementCounterEvent());
              },
              tooltip: 'decrement',
              heroTag: 'decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
