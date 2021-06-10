abstract class CounterEvent{

  const CounterEvent();

//  List<Object> get props => [];
}

class IncrementEvent extends CounterEvent{}
class DecrementEvent extends CounterEvent{}
