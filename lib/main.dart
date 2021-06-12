import 'package:counter_app/bloc/counter_bloc.dart';
import 'package:counter_app/bloc/counter_event.dart';
import 'package:counter_app/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'screens/myHomePage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(
            title: 'Flutter Demo Home Page', color: Colors.amberAccent),
        // home: BlocProvider<CounterBloc>(
        //   create: (context) => CounterBloc(),
        //   child: MyHomePage(title: 'Flutter Demo Home Page',color:Colors.amberAccent),
        // ),
      ),
    );
  }
}
