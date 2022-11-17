import 'dart:math';

import 'package:bloc_example/test_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TestCubit>(
          create: (context) => TestCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(

          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Cubit Home Page'),
      ),
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

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TestCubit>();
    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: BlocConsumer<TestCubit, TestState>(
        // buildWhen: (previous, current) => ,
        builder: (context, state) {
          print('========================');


          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // Text((cubit.state.testString?.length ?? 0) > 0 ? (cubit.state.testString?.first ?? '0') : '0'),
                SizedBox(height: 20,),
                // Text((cubit.state.testString2?.length ?? 0) > 0 ? (cubit.state.testString2?.first ?? '0') : '0'),
                CupertinoButton(onPressed: () {
                  context.read<TestCubit>().testCopy('6', /*Random().nextInt(100).toString()*/ '7');
                }, child: Text('click 1'),),

                SizedBox(height: 20,),

                CupertinoButton(onPressed: () {
                  // context.read<TestCubit>().clear();
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SecondRoute()),
                  );


                }, child: Text(cubit.state.text ?? 'Click'),)

              ],
            ),
          );
        },
        listener: (context, state) {

        },
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // context.read<TestCubit>().state.copyWith(text: 'tessttttt');
            context.read<TestCubit>().state.text = 'sdsdsds';
            Navigator.pop(context);

          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}

