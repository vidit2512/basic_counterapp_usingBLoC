import 'package:counter_app/bloc/counter_event.dart';
import 'package:counter_app/bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

///enum CounterEvent { increment , decrement}

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CountingState(counter: 0, val: true));
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
      print(state);
      print('vvvvvvvvvvvvvvvvvvvvvv');
     // yield CountingState(counter: 50, val: true);
      yield CountingState(
          counter: (state as CountingState).counter + 1, val: true);
      // print("viiditttttttttttttttttttt");
      // print((state as CountingState).counter);
      // yield IncrementedState(counter: 50);
    } else if (event is DecrementEvent) {
      yield CountingState(
          counter: (state as CountingState).counter - 1, val: false);
      //   print("aradhyaaaaaaaaaaaa");
      // print((state as CountingState).counter);

      // yield DecrementedState(counter: (state as CountingState).counter - 1,val:false);
    }
  }
}
