abstract class CounterState {
  const CounterState();

//  get counter => null;

  // @override
  // List<Object> get props => [counter];
  // get cnt => null;
  // final int cnt;
  // const CounterState(this.cnt);
}

class CountingState extends CounterState {
  final int counter;
  final bool val;
  const CountingState({required this.counter, required this.val});
}

// class IncrementedState extends CounterState {
//   final int counter;

//   const IncrementedState({required this.counter});
// }

// class DecrementedState extends CounterState {
//   final int counter;

//   const DecrementedState({required this.counter});
// }

