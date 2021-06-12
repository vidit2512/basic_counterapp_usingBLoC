import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/counter_bloc.dart';
import '../bloc/counter_event.dart';
import '../bloc/counter_state.dart';
import 'myNextPage.dart';

class MyHomePage extends StatelessWidget {
  final title, color;

  const MyHomePage({Key? key, required this.title, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
  //  CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

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
            BlocConsumer<CounterBloc,CounterState>(
                //bloc: counterBloc,
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
                BlocProvider.of<CounterBloc>(context).
                add(IncrementEvent());
              }, //_incrementCounter,
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
            SizedBox(
              height: 10,
            ),
            FloatingActionButton(
              heroTag: "btn1",
              onPressed: () {
                 BlocProvider.of<CounterBloc>(context).
                add(DecrementEvent());
              }, //_incrementCounter,
              tooltip: 'Decrement',
              child: Icon(Icons.remove),
            ),
            ElevatedButton(
             
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute<MyNextPage>(
                    builder: (_)=>BlocProvider.value(
                      value: BlocProvider.of<CounterBloc>(context),
                    //  bloc:counterBloc,
                      child:MyNextPage(title:'Welcome to second Page',color:Colors.deepOrangeAccent),
                    ),
                  ),
                );
              },
              child: Icon(Icons.next_plan_sharp),
            ),
          ],
        ),
      ),

      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
