// ignore: file_names
String ConvertTime(DateTime Time){
  int hour;
  String zero="";
  String type;
if(Time.hour>12){
  hour=Time.hour-12;
  type="PM";
}
else{
  hour=Time.hour;
  type="AM";
}
if(Time.minute==0){
  zero="0";
}
  return "$hour:${Time.minute}$zero $type";
}