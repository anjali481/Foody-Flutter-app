import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; 
 
 
 
 class LocalNotification extends StatefulWidget{
  @override

_LocalNotificationState createState()=> _LocalNotificationState();


}

class _LocalNotificationState extends State<LocalNotification>{
  FlutterLocalNotificationsPlugin flutterLocalNotificationPlugin=  FlutterLocalNotificationsPlugin();
  AndroidInitializationSettings androidInitializationSettings;
  IOSInitializationSettings iosInitializationSettings ;
  InitializationSettings initializationSettings;
@override


void initState(){

  super.initState();
  initializing();

}

void initializing() async{

  androidInitializationSettings=AndroidInitializationSettings('@mipmap/ic_launcher');
  iosInitializationSettings= IOSInitializationSettings(    onDidReceiveLocalNotification :onDidReceiveLocalNotification);
  initializationSettings =   InitializationSettings(androidInitializationSettings,iosInitializationSettings);
  await flutterLocalNotificationPlugin.initialize(initializationSettings,onSelectNotification:onSelectNotification );


}

void _showNotification()async{

await notificationSchedule();

}







 Future<void> notificationSchedule() async {
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'your other channel id',
        'your other channel name',
        'your other channel description');
    var iOSPlatformChannelSpecifics = IOSNotificationDetails();
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        androidPlatformChannelSpecifics, iOSPlatformChannelSpecifics);
    await flutterLocalNotificationPlugin.show(
        0,
        'You have a Order',
        '1:Pizza paratha ,1 :Aloo paratha,Table 5'
          ,
        // scheduledNotificationDateTime,
        platformChannelSpecifics);
  }

  Future onSelectNotification(String payLoad) {
    if (payLoad != null) {
      debugPrint("$payLoad");
    }
    print("Notification Tab");
// If we tab in the notification we can set the nagivator to navigate to the next page,
  }

  Future onDidReceiveLocalNotification(
      int id, String title, String body, String paload) async {
    return showDialog(
        context: context,
        builder: (
          BuildContext context,
        ) =>
            CupertinoAlertDialog(
              title: Text(title),
              content: Text(body),
              actions: <Widget>[
                CupertinoDialogAction(
                  isDefaultAction: true,
                  child: Text("Okay"),
                  onPressed: () {
                    // naviagate to desire page
                  },
                )
              ],
            ));
  

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(


        title:Text("Success!"),

      ),
body:Center(

  
),
  



 



   floatingActionButton:FloatingActionButton(
    onPressed: _showNotification,
    child: Icon(Icons.arrow_back_ios),
    
    
  )
);


      
      
     
       

        
      

      
     // FloatingActionButton(

        
       //   child: 
         // Icon(Icons.notifications), onPressed: _showNotification),
     
  }
}



