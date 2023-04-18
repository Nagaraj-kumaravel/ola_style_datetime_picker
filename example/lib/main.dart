import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ola_style_datetime_picker/ola_style_datetime_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Ola Style datetime Picker'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateTime? selectedTime;


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
              child: Text('A Ola Style Date Picker')),
          SizedBox(height: 20,),
          OlaStyleDateTimePicker(startDate: DateTime.now(), endDate: DateTime.now().add(Duration(days: 365*2)), selectedDate: DateTime.now(),
              onChanged:(dateTime){
                setState(() {
                  selectedTime = dateTime;
                });
          }),
          SizedBox(height: 20,),
          Align(
            alignment: Alignment.center,
              child: Text(selectedTime!=null?DateFormat('dd-MM-yyyy').format(selectedTime!):'Scroll to change',
              style: TextStyle(
                fontSize: 18
              ),))
        ],
      ),
    );
  }
}
