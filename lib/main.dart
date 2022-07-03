import 'dart:math';

import 'package:bloc_example/test_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Cubit Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: BlocProvider<TestCubit>(
        create: (context) => TestCubit(),
        child: BlocConsumer<TestCubit, TestState>(
          // buildWhen: (previous, current) => ,
          builder: (context, state) {
            print('========================');

            final cubit = context.read<TestCubit>();

            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text((cubit.state.testString?.length ?? 0) > 0 ? (cubit.state.testString?.first ?? '0') : '0'),
                  SizedBox(height: 20,),
                  Text((cubit.state.testString2?.length ?? 0) > 0 ? (cubit.state.testString2?.first ?? '0') : '0'),
                  RaisedButton(onPressed: () {
                    context.read<TestCubit>().testCopy('6', /*Random().nextInt(100).toString()*/ '7');
                    // context.read<TestCubit>().testCopy('6');
                  },)
                ],
              ),
            );
          },
          listener: (context, state) {

          },
        ),
      ),
    );
  }
}
