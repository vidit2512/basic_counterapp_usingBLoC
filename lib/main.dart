import 'package:counter_app/bloc/counter_bloc.dart';
import 'package:counter_app/bloc/counter_event.dart';
import 'package:counter_app/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CounterBloc>(
        create: (context) => CounterBloc(),
        child: MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final title;

  const MyHomePage({Key? key, required this.title}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            BlocListener(
              bloc: counterBloc,
              listener: (context, state) {
                if ((state as CountingState).val) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('heyy,YOU have pressed Increment Button'),
                      backgroundColor: Colors.amber,
                    ),
                  );
                } 
                else //false
                {

                   ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('heyy,YOU have pressed Decrement Button'),
                      backgroundColor: Colors.deepOrange,
                    ),
                  );

                }
              },
              child:     BlocBuilder<CounterBloc, CounterState>(
              builder: (bb, state) {
     
            return 
            Text(
           
              (
                (state as CountingState).counter.toString()
               //+
                  //state.val.toString()
                  ),
              style: Theme.of(context).textTheme.headline4,
            );

                }
       
            ),
           //##########################################
            
            ),
            // //////////////////////////////////////
      
            SizedBox(
              height: 50,
            ),
            FloatingActionButton(
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
