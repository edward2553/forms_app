part of 'counter_cubit.dart';

class CounterState extends Equatable {
  
  final int counter;
  final int transactionCount;
  
  const CounterState({
    this.counter = 0,
    this.transactionCount = 0
  });

  copyWith({
    int? counter,
    int? transactionCount
  }) => CounterState(
    counter: counter ?? this.counter,
    transactionCount: transactionCount ?? this.transactionCount
  );

  // si las propiedades del objeto son las mismas, entonces el objeto es el mismo
  @override
  List<Object> get props => [counter, transactionCount];

}