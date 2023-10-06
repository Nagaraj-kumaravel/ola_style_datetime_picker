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
  DateTime? selectedDateTime;


  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.center,
                child: Text('A Ola Style Date Picker')),
            SizedBox(height: 40,),

            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      spreadRadius: 2)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Selected Date time:',
                    style: TextStyle(
                        fontSize: 14
                    ),
                  ),
                  SizedBox(height: 10,),
                  Text(selectedDateTime!=null?DateFormat('dd MMM, hh:mm a').format(selectedDateTime!):'Scroll to change',
                    style: TextStyle(
                        fontSize: 14,
                      color: Colors.grey
                    ),),
                  SizedBox(
                    height: 20,
                  ),
                  OlaStyleDateTimePicker(startDate: DateTime.now(), endDate: DateTime.now().add(Duration(days: 365*2)), selectedDate: DateTime.now(),
                      onChanged:(dateTime){
                        setState(() {
                          selectedDateTime = dateTime;
                        });
                  }),
                ],
              ),
            ),
            SizedBox(height: 20,),
          ],
        ),
      ),
    );
  }

}
