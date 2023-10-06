
# Ola Style Datetime Picker

A  Ola Style Datetime Picker is designed with a similar look and feel to the popular ride-hailing app Ola.


## Authors

- [@Nagaraj K](https://www.github.com/Nagaraj-kumaravel)


## Installation



```bash
  import 'package:ola_style_datetime_picker/ola_style_datetime_picker.dart';
```
```bash
 OlaStyleDateTimePicker(startDate: DateTime.now(), 
 endDate: DateTime.now().add(Duration(days: 365*2)),
 selectedDate: DateTime.now(), onChanged:(dateTime)
 { 
 setState(() { 
 selectedTime = dateTime.toString();
});
     }),
```


## Screenshots

![App Screenshot](http://139.59.43.169/travelApp/public/ezgif.com-video-to-gif.gif)


## Usable Parms




`startDate`

`endDate`

`selectedTextStyle`

`dateFormat`

`onChanged`