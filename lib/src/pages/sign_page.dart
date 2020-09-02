import 'package:flutter/material.dart';

class SingInPage extends StatefulWidget{
  @override
   _SignInPageState createState()=> _SignInPageState();
     
     }
   
   class _SignInPageState extends State<SingInPage>{
bool _toggleVisibilty =false;
     Widget _buildEmailTextFeild(){

       return TextFormField(
decoration: InputDecoration(

  hintText:"Your email or username",
  hintStyle:TextStyle(

    color:Color(0xFFBDC2CB),

    fontSize:18.0,
  )
),

       );
     }



     Widget _buildPasswordField(){

       return TextFormField(
decoration: InputDecoration(

  hintText:"Your email or username",
  hintStyle:TextStyle(

    color:Color(0xFFBDC2CB),

    fontSize:18.0,
  ),

  suffixIcon:IconButton(
    onPressed:(){
setState(() {
  


      _toggleVisibilty = !_toggleVisibilty;

      });
    },
   icon: _toggleVisibilty ? Icon(Icons.visibility_off)  :  Icon(Icons.visibility),
   
   ),
),
obscureText: _toggleVisibilty,
       );
     }


       
     
  @override
  Widget build(BuildContext context){
    return Scaffold(
  body:Padding(
    
    padding: EdgeInsets.symmetric(horizontal:10.0),
  
  child: Column(

    mainAxisAlignment: MainAxisAlignment.center,
    children:<Widget>[
Text("Sign in",style: TextStyle(
  fontSize:40.0,
  fontWeight:FontWeight.bold,
),),
SizedBox(height:100.0),
Row(
   mainAxisAlignment: MainAxisAlignment.end,

  children:<Widget>[

    Text("Forgotton  Password?" ,style: TextStyle(fontSize:18.0,color: Colors.blueAccent,fontWeight: FontWeight.bold),),


  ]
),
SizedBox(height: 10.0,),
Card(
elevation: 5.0,
  child:Padding(padding: EdgeInsets.all(20.0),

  child:Column(
    children:<Widget>[
_buildEmailTextFeild(),

SizedBox(
  height:20.0,
),
    _buildPasswordField(),



    ],
  )
  ),
),

SizedBox(

  height:30.0,
),
 Container(

   height: 50.0,

   decoration: BoxDecoration(
color: Colors.blueAccent,

     borderRadius:BorderRadius.circular(25.0)
   ),


   child: Center(

     child:

       Text("Sign In" ,style: TextStyle(color:Colors.white,fontSize:18.0,fontWeight:FontWeight.bold),),
     
 
   ),
 ),

 Divider(height:20.0),

 Row(
   children :<Widget>[
Text("Don't have an account?",style: TextStyle(color:Color(0xFFBDC2CB),fontWeight: FontWeight.bold,fontSize: 18.0),),


SizedBox(width:10.0),
Text("Sign up", style: TextStyle(color: Colors.blueAccent,fontWeight:FontWeight.bold,fontSize:18.0),),

   ],
 )
    ]
  ),)
    );
  }
  }







