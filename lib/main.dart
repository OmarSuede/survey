import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(home: SurveyScreen()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}

class SurveyScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  late int _hoursSlept;
  late int _sleepQuality;
  late int _stepCount;
  late int _focusedHours;

  @override
  Widget build(BuildContext context) {
    String today = DateFormat('EEEE, MMM d').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        title: Text('Daily Survey'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                today,
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'How many hours did you sleep last night?',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _hoursSlept = int.parse(value!);
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText:
                      'How would you rate the quality of your sleep(1=bad, 10=good)?',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _sleepQuality = int.parse(value!);
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'How many steps did you take today?',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _stepCount = int.parse(value!);
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'How many hours were you focused today?',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _focusedHours = int.parse(value!);
                },
              ),
              SizedBox(height: 32.0),
              Center(
                child: ElevatedButton(
                  child: Text('Submit'),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // TODO: Save survey data to a database or server
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Survey submitted')));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
