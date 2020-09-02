import 'package:firebase_database/firebase_database.dart';

class Note {
  String _id;
  String _title;
  String _description;

  Note(this._id, this._title, this._description);

  Note.map(dynamic obj) {
    this._id = obj['id'];
    this._title = obj['title'];
    this._description = obj['description'];
  }

  String get id => _id;
  String get title => _title;
  String get description => _description;

  Note.fromSnapshot(DataSnapshot snapshot) {
    _id = snapshot.key;
    _title = snapshot.value['title'];
    _description = snapshot.value['description'];
  }
}


















// ignore: missing_required_param
 //FirebaseApp app =   await FirebaseApp.configure(
 //options:FirebaseOptions(
  //  googleAppID: '1:254644763144:android:fecfcbf07063f4be282fbd',
    //apiKey: 'AIzaSyBH6VLA5yNPgkppzj4WjwAYGd2Ux0-rHUE',
    //databaseURL: 'https://food-app-9569a.firebaseio.com',//
   
  //), 
//);
/*class Add extends StatefulWidget{
  @override
 
AddState createState()=> AddState();

  
}
class AddState extends State<Add> {

  List <Item>items =List();
  Item item;
  DatabaseReference itemRef;
  final GlobalKey<FormState>formKey=GlobalKey<FormState>();
  @override

void initState(){

  super.initState();
  item =Item("","");
  final FirebaseDatabase database =FirebaseDatabase.instance;
  itemRef =database.reference().child('items');
  itemRef.onChildAdded.listen(_onEntryAdded);
  itemRef.onChildChanged.listen(_onEntryChanged);
//itemRef =FirebaseDatabase.instance.reference().child("items");

}



_onEntryAdded(Event event){

  setState(() {
   items.add(Item.fromSnapshot(event.snapshot));

  });
}

_onEntryChanged(Event event){
  var old =items.singleWhere((entry){
    return entry.key==event.snapshot.key;

  });

  setState(() {

   items[items.indexOf(old)]=Item.fromSnapshot(event.snapshot); 
  });
}


void handleSubmit(){

  final FormState form =formKey.currentState;
  if (form.validate()){
    form.save();
    form.reset();
    itemRef.push().set(item.toJson());
  }
}


@override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Address field"),

      ),

      resizeToAvoidBottomPadding: false,
      body: Column(

        children: <Widget>[
          Flexible(
            flex: 0,
            child: Center(
              child: Form(

                key: formKey,
                child: Flex(
                  direction: Axis.vertical,
                  children: <Widget>[

                    ListTile(
                      leading: Icon(Icons.info),
                      title: TextFormField(
                        initialValue: "",

                        onSaved: (val)=>item.title=val,
                           validator: (val)=>val == "" ?val:null,
                      ),

                    ),



                     ListTile(
                      leading: Icon(Icons.info),
                      title: TextFormField(
                        initialValue: '',
                           onSaved: (val)=>item.body=val,
                           validator: (val)=>val == "" ?val:null,
                      ),

                    ),
              IconButton(
                icon: Icon(Icons.send),
                onPressed: (){
                  handleSubmit();
                },
              )

                  ],
                ),
              ),
            ),
          ),



          Flexible(


            child: FirebaseAnimatedList(
              query: itemRef,
              itemBuilder: (BuildContext context, DataSnapshot snapshot ,
              Animation<double> animation,int index){
                return new ListTile(
              leading:Icon(Icons.message),
              title:Text(items[index].title),
              subtitle: Text(items[index].body),
                );

              }
            ),

          )
        ],

      ),
    );

  }
  
}

class Item {
  String key;
  String title;
  String body;

  Item(this.title,this.body);
  Item.fromSnapshot(DataSnapshot snapshot)
  :key=snapshot.key,
  title=snapshot.value["title"],
  body=snapshot.value[" body"];

  toJson(){

    return{
      "title":title,
      "body":body,
    };
  }




}
*/





















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

  androidInitializationSettings=AndroidInitializationSettings(" ");
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
        'Great!',
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
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.notifications), onPressed: _showNotification),
    );
  }
/*






}

*/
*/
