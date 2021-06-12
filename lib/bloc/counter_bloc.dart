import 'package:counter_app/bloc/counter_event.dart';
import 'package:counter_app/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///enum CounterEvent { increment , decrement}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CountingState(counter: 0, val: true));
  //int count = 0;

  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    if (event is IncrementEvent) {
    
      yield CountingState(
          counter: (state as CountingState).counter + 1, val: true);
     
    } else if (event is DecrementEvent) {
      yield CountingState(
          counter: (state as CountingState).counter - 1, val: false);
     
    }
  }
}
