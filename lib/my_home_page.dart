import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:name_age_estimator/name_age_bloc.dart';
import 'package:name_age_estimator/name_age_state.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  final TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController
        .dispose(); // Dispose the controller when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Name Age Estimator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: 'Enter a name'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                final name = _nameController.text.trim();
                if (name.isNotEmpty) {
                  BlocProvider.of<NameAgeBloc>(context).add(name);
                }
              },
              child: const Text('Get Age Estimate'),
            ),
            const SizedBox(height: 16.0),
            BlocBuilder<NameAgeBloc, NameAgeState>(
              builder: (context, state) {
                if (state is NameAgeSuccess) {
                  return Column(
                    children: [
                      Text('Name: ${state.ageEstimate.name}'),
                      Text('Estimated Age: ${state.ageEstimate.age}'),
                      Text('Count: ${state.ageEstimate.count}'),
                      Text('Country ID: ${state.ageEstimate.countryId}'),
                    ],
                  );
                } else if (state is NameAgeError) {
                  return Text('Error: ${state.errorMessage}');
                } else {
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
