library ola_style_datetime_picker;

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class OlaStyleDateTimePicker extends StatefulWidget {
  double? widgetHeight;
  DateTime startDate;
  DateTime endDate;
  DateTime selectedDate;
  String? dateFormat;
  TextStyle? selectedTextStyle;
  TextStyle? unSelectedTextStyle;
  void Function(DateTime) onChanged;

  OlaStyleDateTimePicker({this.widgetHeight,
    required this.startDate,
    required this.endDate,
    required this.selectedDate,
    this.dateFormat,
    this.selectedTextStyle,
    this.unSelectedTextStyle,
    required this.onChanged,Key? key}) : super(key: key);

  @override
  State<OlaStyleDateTimePicker> createState() => _OlaStyleDateTimePickerState();
}

class _OlaStyleDateTimePickerState extends State<OlaStyleDateTimePicker> {
  TextStyle defaultSelectedStyle =  TextStyle(color: Colors.black);
  TextStyle defaultUnSelectedStyle =  TextStyle(color:Colors.black.withOpacity(0.2));
  late List<DateTime> lisOfDates;
  late List<int> listOfHours;
  late List<int> listOfMinutes;
  List<String> listOfAM= ['AM','PM'];

  int selectedDateIndex = 0;
  int selectedHourIndex = 0;
  int selectedMinuteIndex = 0;
  int selectedAmPmIndex = 0;

  @override
  void initState() {
    initiateValues();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: widget.widgetHeight??150,
      child: Stack(
        children: [
          Row(
            children: [
              Flexible(
                flex: 2,
                child: _buildDateList(),
              ),
              SizedBox(width: 20,),
              Flexible(
                child: _buildHourList(),
              ),
              SizedBox(width: 10,
                child: Text(':',
                  textAlign: TextAlign.center,),),
              Flexible(child: _buildMinuteList()),
              SizedBox(width: 10,),
              Flexible(child:_buildAmPm() )

            ],
          ),
        ],
      ),
    );
  }
  Widget _buildDateList(){
    return Stack(
      alignment: Alignment.center,
      children: [
        PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: lisOfDates.length,
          controller: PageController(
              initialPage:0,
              viewportFraction: 1 / 3),
          itemBuilder: (context, index) {
            final textStyle = index == selectedDateIndex ? widget.selectedTextStyle??defaultSelectedStyle : widget.unSelectedTextStyle??defaultUnSelectedStyle;
            return Container(
              child: ListTile(
                title: Text(DateFormat(widget.dateFormat??'EEE dd MMM').format(lisOfDates[index]),
                  textAlign: TextAlign.center,
                  style: textStyle,),
              ),
            );
          },
          onPageChanged: (index){
            setState(() {
              selectedDateIndex =index;
            });
            formatDateAndTime();

          },
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize:MainAxisSize.min,
            children: [
              Divider(
                thickness: 1,
              ),
              SizedBox(height: 40,),
              Divider(
                thickness: 1,
              )
            ],
          ),
        )
      ],
    );
  }
  Widget _buildHourList() {
    return Stack(
      alignment: Alignment.center,
      children: [
        PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listOfHours.length,
          controller: PageController(
            initialPage: selectedHourIndex,
            viewportFraction: 1 / 3,
          ),
          itemBuilder: (context, index) {
            final hour = listOfHours[index];
            final textStyle = index == selectedHourIndex ? widget.selectedTextStyle??defaultSelectedStyle : widget.unSelectedTextStyle??defaultUnSelectedStyle;
            return Container(
              child: ListTile(
                title: Text(hour.toString().padLeft(1),
                  textAlign: TextAlign.center,
                  style: textStyle,),
              ),
            );
          },
          onPageChanged: (index) {
            setState(() {
              selectedHourIndex = index;
            });
            formatDateAndTime();

          },
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize:MainAxisSize.min,
            children: [
              Divider(
                thickness: 1,
              ),
              SizedBox(height: 40,),
              Divider(
                thickness: 1,
              ),
            ],
          ),
        )
      ],
    );
  }
  Widget _buildMinuteList() {
    return Stack(
      alignment: Alignment.center,
      children: [
        PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listOfMinutes.length,
          controller: PageController(
            initialPage: selectedMinuteIndex,
            viewportFraction: 1 / 3,
          ),
          itemBuilder: (context, index) {
            final minute = listOfMinutes[index];
            final textStyle = index == selectedMinuteIndex ? widget.selectedTextStyle??defaultSelectedStyle : widget.unSelectedTextStyle??defaultUnSelectedStyle;
            return Container(
              child: ListTile(
                title: Text(minute.toString(),
                  textAlign: TextAlign.center,
                  style: textStyle,),
              ),
            );
          },
          onPageChanged: (index) {
            setState(() {
              selectedMinuteIndex = index;
            });
            formatDateAndTime();

          },
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize:MainAxisSize.min,
            children: [
              Divider(
                thickness: 1,
              ),
              SizedBox(height: 40,),
              Divider(
                thickness: 1,
              )
            ],
          ),
        )
      ],
    );
  }
  Widget _buildAmPm(){
    return Stack(
      alignment: Alignment.center,
      children: [
        PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listOfAM.length,
          controller: PageController(
            initialPage: selectedAmPmIndex,
            viewportFraction: 1 / 3,
          ),
          itemBuilder: (context, index) {
            final amPm = listOfAM[index];
            final textStyle = index == selectedAmPmIndex ? widget.selectedTextStyle??defaultSelectedStyle : widget.unSelectedTextStyle??defaultUnSelectedStyle;
            return Container(
              child: ListTile(
                title: Text(amPm.toString(),
                  textAlign: TextAlign.center,
                  style: textStyle,),
              ),
            );
          },
          onPageChanged: (index) {

            setState(() {
              selectedAmPmIndex = index;
            });
            formatDateAndTime();

          },
        ),
        Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize:MainAxisSize.min,
            children: [
              Divider(
                thickness: 1,
              ),
              SizedBox(height: 40,),
              Divider(
                thickness: 1,
              )
            ],
          ),
        )
      ],
    );
  }

  void initiateValues(){
    setState(() {
      lisOfDates = getDaysInBetween(widget.startDate, widget.endDate);
      listOfHours = List<int>.generate(12, (index) => index + 1);
      listOfMinutes = List<int>.generate(60, (index) => index);
      final now = DateTime.now();
      selectedDateIndex = lisOfDates.indexWhere((element) => DateFormat('dd-MM-yyyy').format(element)==DateFormat('dd-MM-yyyy').format(widget.selectedDate));

      selectedHourIndex = (now.hour-1) % 12;
      selectedMinuteIndex = now.minute;
      selectedAmPmIndex = (now.hour-1) < 12 ? 0 : 1;
    });
  }

  void formatDateAndTime() {
    String selectedDate = DateFormat('yyyy-MM-dd').format(lisOfDates[selectedDateIndex]);
    DateTime tempDate = DateFormat("yyyy-MM-dd h:mm a").parse('$selectedDate ${listOfHours[selectedHourIndex]}:${listOfMinutes[selectedMinuteIndex]} ${listOfAM[selectedAmPmIndex]}',);
    widget.onChanged(tempDate);
  }


}

List<DateTime> getDaysInBetween(DateTime startDate, DateTime endDate) {
  List<DateTime> days = [];
  for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
    days.add(startDate.add(Duration(days: i)));
  }
  return days;
}

