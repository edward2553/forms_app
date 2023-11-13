import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_bloc/counter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class BlockCounterScreen extends StatelessWidget {
  const BlockCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterBloc(), child: const _BlockCounterView());
  }
}

class _BlockCounterView extends StatelessWidget {
  const _BlockCounterView();

  final TextStyle textStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  void increaseBy(BuildContext context, [int value = 1]) {
    // context.read<CounterBloc>()
    //   .add(CounterIncreasedEvent(value));
    context.read<CounterBloc>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {

    // final counterState = context.watch<CounterCubit>().state;


    return Scaffold(
      appBar: AppBar(
        // title:  Text('Cubit Counter: ${counterState.transactionCount}')
        title: context.select((CounterBloc bloc) {
          return Text('Bloc Counter: ${bloc.state.transactionCount}');
        }),
        actions: [
          IconButton(
            onPressed: () => {
              context.read<CounterBloc>().resetCounter()
            },
            icon: const Icon(Icons.refresh_outlined),
          )
        ],
      ),
      body: Center(
        child: context.select((CounterBloc counterBloc) =>
          Text(
              'Counter value: ${ counterBloc.state.counter }',
              style: textStyle,
          ))
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: 1,
            child: Text('+3', style: textStyle,),
            onPressed: () => {
              increaseBy(context, 3)
            },
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 2,
            child: Text('+2', style: textStyle,),
            onPressed: () => {
              increaseBy(context, 2)
            },
          ),
          const SizedBox(
            height: 15,
          ),
          FloatingActionButton(
            heroTag: 3,
            child: Text('+1', style: textStyle,),
            onPressed: () => {
              increaseBy(context, 1)
            },
          )
        ],
      ),
    );
  }
}
