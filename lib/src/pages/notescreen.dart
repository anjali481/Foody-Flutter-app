import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:hello_world/src/pages/notification.dart';
import 'Addresss.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:flutter/cupertino.dart';


class NoteScreen extends StatefulWidget {
  final Note note;
  NoteScreen(this.note);

  @override
  State<StatefulWidget> createState() => new _NoteScreenState();
}

final notesReference = FirebaseDatabase.instance.reference().child('notes');

class _NoteScreenState extends State<NoteScreen> {
  TextEditingController _titleController;
  TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();

    _titleController = new TextEditingController(text: widget.note.title);
    _descriptionController = new TextEditingController(text: widget.note.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Note Your Address')),
      body: Container(
        margin: EdgeInsets.all(15.0),
        alignment: Alignment.center, 
        child: Column(
          children: <Widget>[
            
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            Padding(padding: new EdgeInsets.all(5.0)),
            RaisedButton(
              child: (widget.note.id != null) ? Text('Update') : Text('Add'),
              onPressed: () {
                if (widget.note.id != null) {
                  notesReference.child(widget.note.id).set({
                    'title': _titleController.text,
                    'description': _descriptionController.text
                  }).then((_) {
                    Navigator.pop(context);
                  });
                } else {
                  notesReference.push().set({
                    'title': _titleController.text,
                    'description': _descriptionController.text
                  }).then((_) {
                    Navigator.pop(context);
                  });
                }
              },
            ),

RaisedButton(onPressed: (){
 Navigator.push(context, MaterialPageRoute(builder:(context)=>LocalNotification()));
},
color: Colors.blue,)

           
            
          ],
        ),
      ),
    );
  }





}








/*

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
        'Address has been deployed ',
        'Great! Address is deployed',
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
    return Align(
      alignment: Alignment.bottomLeft,
      child: 
       FloatingActionButton(

        
          child: 
          Icon(Icons.notifications), onPressed: _showNotification),
    );
  }
}*/