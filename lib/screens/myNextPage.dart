import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';

class MyNextPage extends StatelessWidget {
  final title, color;

  const MyNextPage({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: color,
      ),
      // themeData:ThemeData(primaryColor:Colors.amber),
      // backgroundColor: Colors.pink,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer(
                bloc: counterBloc,
                listener: (context, state) {
                  if ((state as CountingState).val) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('heyy,YOU have pressed Increment Button'),
                        backgroundColor: Colors.amber,
                      ),
                    );
                  } else //false
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('heyy,YOU have pressed Decrement Button'),
                        backgroundColor: Colors.deepOrange,
                      ),
                    );
                  }
                },
                //    child:     BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                    ((state as CountingState).counter.toString()
                    //+
                    //state.val.toString()
                    ),
                    style: Theme.of(context).textTheme.headline4,
                  );
                }

                //   ),
                //##########################################

                ),
            // //////////////////////////////////////

            SizedBox(
              height: 50,
            ),
            FloatingActionButton(
               heroTag:"btn2",
              onPressed: () {
                counterBloc.add(IncrementEvent());
              }, //_incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              heroTag:"btn1",
              onPressed: () {
                 
                counterBloc.add(DecrementEvent());
              }, //_incrementCounter,
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
