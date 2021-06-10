import 'package:counter_app/bloc/counter_event.dart';
import 'package:counter_app/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///enum CounterEvent { increment , decrement}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super( CounterState(counter:0) );
  //int count = 0;


  @override
  Stream<CounterState> mapEventToState(CounterEvent event) async* {
    // switch (event) {
    //   case IncrementEvent:
    //   //   yield state + 1;
    //   //   break;
    //   // case CounterEvent.decrement:
    //   //   yield state - 1;
    //   //   break;
    // }
    if (event is IncrementEvent) {
      yield CounterState(counter: state.counter + 1);
    }
     else if(event is DecrementEvent){
      yield CounterState(counter: state.counter - 1);
     }
  }
}
