import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Notification Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    var _androidInitializationSettings= AndroidInitializationSettings('app_icon');
    var _iosInitializationSettings = IOSInitializationSettings();
    var initializationsSettings = InitializationSettings(android: _androidInitializationSettings,iOS: _iosInitializationSettings);
    flutterLocalNotificationsPlugin.initialize(initializationsSettings,onSelectNotification: selectNotification,);
  }


  Future _showNotification() async
   {
     var androidData = new AndroidNotificationDetails("Channel ID", "Notification", "Notification",importance: Importance.max,
      sound: RawResourceAndroidNotificationSound('a_long_cold_sting'),
       playSound: true,
       timeoutAfter: 30000,
       autoCancel: false
     );
     var iOSData = new IOSNotificationDetails();
     var generalNotificationDetails = new NotificationDetails(android: androidData,iOS: iOSData);
     await flutterLocalNotificationsPlugin.show(0, "Task", "You achieved", generalNotificationDetails,);


   }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: _showNotification,
          child: Text('Send me a Notification'),
        ),
      ),
    );
  }

  Future selectNotification(String payload) async {
  }

}


