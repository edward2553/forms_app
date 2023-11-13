import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_app/presentation/blocs/counter_cubit/counter_cubit.dart';

class CubitsCounterScreen extends StatelessWidget {
  const CubitsCounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => CounterCubit(), child: const _CubitCounterView());
  }
}

class _CubitCounterView extends StatelessWidget {
  const _CubitCounterView();

  final TextStyle textStyle = const TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );

  void increaseBy(BuildContext context, [int value = 1]) {
    context.read<CounterCubit>().increaseBy(value);
  }

  @override
  Widget build(BuildContext context) {

    // final counterState = context.watch<CounterCubit>().state;


    return Scaffold(
      appBar: AppBar(
        // title:  Text('Cubit Counter: ${counterState.transactionCount}')
        title: context.select((CounterCubit value) {
          return Text('Cubit Counter: ${value.state.transactionCount}');
        }),
        actions: [
          IconButton(
            onPressed: () => {
              context.read<CounterCubit>().reset()
            },
            icon: const Icon(Icons.refresh_outlined),
          )
        ],
      ),
      body: Center(
        child: BlocBuilder<CounterCubit, CounterState>(
          builder: (context, state) {
            print('El counter cambió');
            return Text(
              'Counter value: ${ state.counter }',
              style: textStyle,
            );
          },
        ),
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
