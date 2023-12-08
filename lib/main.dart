import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'name_age_bloc.dart';
import 'my_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Name Age Estimator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => NameAgeBloc(),
        child:  const MyHomePage(),
      ),
    );
  }
}
