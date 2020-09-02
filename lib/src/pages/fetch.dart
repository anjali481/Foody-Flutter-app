import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';



class Fetch extends StatefulWidget{


  Fetch({Key key,this.title}):super(key:key);

  final String title;
  @override
  _FetchState createState()=> _FetchState();

}

class  _FetchState extends State<Fetch>{

  void customLaunch(command) async{


    if(await canLaunch(command)){


      await launch(command);

    }
else{

  print('cound not launch $command');


}



  }


  @override

  Widget build(BuildContext context){


    return Scaffold(


      appBar:AppBar(

        
      ),
    

    body:Center(


      child:Column(

        mainAxisAlignment:MainAxisAlignment.center,


       
        children: <Widget>[

          Column(

            

            children: <Widget>[
              Text(" Get Connected with Admin",style:GoogleFonts.pacifico(fontSize:20,fontWeight: FontWeight.w700)),


              RaisedButton(

                onPressed: (){



              customLaunch('mailto:anjalideore321@gmail.com?subject=problem%20subject&body=description%20body');
                },

                child: Text('Email'),
                 color: Colors.tealAccent,
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
          

              ),
              Padding(padding: EdgeInsets.all(12.0),),

               RaisedButton(
              

                onPressed: (){



              customLaunch('sms:9421562656');
                },

                child: Text('SMS'),
          color: Colors.tealAccent,
          
          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),

              ),









            ],
          )
        ],
      )
     ) );


  }
}



