
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter_auth_buttons/flutter_auth_buttons.dart';
import 'package:hello_world/src/app.dart';





class Login  extends StatefulWidget{


@override
_LoginState createState() => _LoginState();

}

class _LoginState extends State<Login>{


final GoogleSignIn googleSignIn = new GoogleSignIn();
final FirebaseAuth firebaseAuth =FirebaseAuth.instance;
final _formKey =GlobalKey<FormState>();
TextEditingController _emailTextController =TextEditingController();
TextEditingController _passwordTextController =TextEditingController();
SharedPreferences preferences;
bool loading = false;
bool isLogedin =false;
SharedPreferences prefs;
FirebaseUser currentUser;

@override
void initState()  {

  super.initState();
  isSignedIn();

}

void isSignedIn()  async{
setState(() {
  loading = true;
});


prefs = await SharedPreferences.getInstance();
isLogedin =await googleSignIn.isSignedIn();
if(isLogedin){
Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>App()));

}

setState(() {
  loading =false;

  
});
}


Future<FirebaseUser> handleSignIn() async{

  preferences = await SharedPreferences.getInstance();

  setState(() {
    loading=true;
  });



GoogleSignInAccount googleUser = await googleSignIn.signIn();
GoogleSignInAuthentication googleAuth = await  googleUser.authentication;
AuthCredential credential= GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

final FirebaseUser firebaseUser = (await firebaseAuth.signInWithCredential(credential)).user;

if(firebaseUser != null){
  final QuerySnapshot result =await Firestore.instance.collection('user').where('id',isEqualTo :firebaseUser.uid).getDocuments();



  final List <DocumentSnapshot> documents = result.documents;


  if(documents.length==0){

    Firestore.instance.collection('user').document(firebaseUser.uid).setData({


      'id' :firebaseUser.uid,
      'username':firebaseUser.displayName,

      'photoUrl': firebaseUser.photoUrl,
    });
currentUser =firebaseUser;
await prefs.setString('id',currentUser.uid );
await prefs.setString(
  'username', currentUser.displayName);
  await prefs.setString('photoUrl', currentUser.photoUrl);




  }

  else{

    await prefs.setString('id', documents[0]['id']);
    await prefs.setString(
  'username', documents[0]['username']);
  await prefs.setString('photoUrl',   documents[0]['photoUrl']);



  }


  Fluttertoast.showToast(msg: "sign in success");
setState(() {
  isLogedin =false;
});

  Navigator.of(context).pushReplacementNamed('/home_page');

}
else{

  Fluttertoast.showToast(msg: "Sign in fail");
  setState(() {
    isLogedin =false;
  });
}

return firebaseUser;

}

@override
Widget build(BuildContext context){
  return MaterialApp(
  home: Scaffold(




   body: Stack(
     children:<Widget>[
 Image.asset('assests/cup cakes.jpg',fit :BoxFit.cover,width:double.infinity
  ),

  Container(
    color: Colors.red.withOpacity(0.4),
    width: double.infinity,
    height: double.infinity,
  ),



  Padding(
    padding: const EdgeInsets.only(top:200.0),
    child: Center(
    child:Form(
      key: _formKey,
      child:
    
     Column(children: <Widget>[
Padding(

      padding: const EdgeInsets.all(8.0),
 child:Material(
    borderRadius: BorderRadius.circular(20.0),
    color: Colors.white.withOpacity(0.8),
    elevation: 0.0,
    child:Padding(

      padding: const EdgeInsets.only(left:12.0),
      child: TextFormField(
        controller: _emailTextController,
        decoration:InputDecoration(hintText : "Email",
        
        icon :Icon(Icons.email),
        ),
          validator: (value) {

        if(value.isEmpty) {  

          Pattern pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
            RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(value))
           return 'please enter email';

           
      else
        return null;
        } 
        
      },
        
      ),
    )
)
),




Padding(

      padding: const EdgeInsets.all(8.0),
 child:Material(
    borderRadius: BorderRadius.circular(20.0),
    color: Colors.white.withOpacity(0.8),
    elevation: 0.0,
    child:Padding(

      padding: const EdgeInsets.only(left:12.0),
      child: TextFormField(
        controller: _passwordTextController,
        decoration:InputDecoration(hintText : "password",
        
        icon :Icon(Icons.lock_outline),
         
        ),
        validator: (value){
          if(value.isEmpty){

            return "The password cannot be empty";
          }

          else if(value.length <6){

            return 'the password has to be at least 6 charaters';
          
          }


          return null;
          
        },
         
        
      ),
    )
)
),



Padding(

      padding: const EdgeInsets.all(8.0),
 child:Material(
    borderRadius: BorderRadius.circular(20.0),
    color: Colors.blue.withOpacity(0.8),
    elevation: 0.0,
    child:MaterialButton(onPressed: (){},
    
    minWidth: MediaQuery.of(context).size.width,
    child: Text("Login" ,textAlign: TextAlign.center,
    
    style: TextStyle(
      color : Colors.white,fontWeight:FontWeight.bold,fontSize: 22.0
    ),),



    )

)
),










     ],),),
),
  ),


  

  Container(
    alignment:Alignment.center,
    child:Center(child: Form(child:
    
     Column(children: <Widget>[],),),)
  ),

       
       Positioned(
         
         child:Center(
         
         child: isLogedin ?
       Container(
         child:CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.red),),

         color: Colors.white.withOpacity(0.8),
       ):Container(),
        ) ),
        
        ]
   ),

   bottomNavigationBar:Container(
   child: Padding(
     padding: const EdgeInsets.all(8.0),
         child: 
       GoogleSignInButton(
         onPressed:handleSignIn,
       ),



         
         
       ),   
   )
  )


  );


  

}
}

  

  