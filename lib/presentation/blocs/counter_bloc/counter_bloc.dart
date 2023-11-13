import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {

    on<CounterIncreasedEvent>( _onCounterIncrease );
    on<CounterResetEvent>(_onCounterReset);

  }

  void _onCounterIncrease(CounterIncreasedEvent event, Emitter<CounterState> emit) {
    emit(
      state.copyWith(
        counter: state.counter + event.value,
        transactionCount: state.transactionCount + 1
      )
    );
  }

    void _onCounterReset(CounterResetEvent event, Emitter<CounterState> emit) {
    emit(
      state.copyWith(
        counter: 0,
      )
    );
  }

  void increaseBy([int value = 1]) {
    add(CounterIncreasedEvent(value));
  }

  void resetCounter() {
    add(const CounterResetEvent());
  }

}
