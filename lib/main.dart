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
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                //  if (state is IncrementedState) {

               // final snackBar;
                // if ((state as CountingState).val)
                //   snackBar = SnackBar(
                //       content: Text(' Hey! you have pressed increment button'));
                //       else   snackBar = SnackBar(
                //       content: Text(' Hey! you have pressed decrement button'));
                //  Scaffold.of(context).showSnackBar(snackBar);
              //  print((state as CountingState).val);
                return Text(
                  // ignore: unnecessary_cast

                  (state as CountingState).counter.toString(),
                  style: Theme.of(context).textTheme.headline4,
                );
                //  } else {// if (state is DecrementedState) {

                //  final snackBar = SnackBar(content: Text(' Hey! you have pressed decrement button'));
                //     Scaffold.of(context).showSnackBar(snackBar);
                // return Text(
                //   // ignore: unnecessary_cast
                //   '${(state as DecrementedState).counter.toString()}',
                //   style: Theme.of(context).textTheme.headline4,
                // );
                //    }
                // else
                //   return Center();//Dummyy....
              },
            ),
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
