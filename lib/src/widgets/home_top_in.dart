import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class HomeTopIn extends StatelessWidget{
   final styletext =TextStyle(fontSize:30.0,fontWeight:FontWeight.bold, );
  @override
  Widget build(BuildContext context){
    return Container(
      margin:EdgeInsets.only(bottom: 20.0),
    child:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Ready to Eat ", style:GoogleFonts.pacifico(fontSize:30.0,fontWeight:FontWeight.w200)),
              Text("Awesome Food?" ,style:GoogleFonts.pacifico(fontSize:30.0,fontWeight:FontWeight.w200)),
            ],
          ),
          Icon(Icons.notifications,size: 30.0,color: Theme.of(context).primaryColor,),
        ],
    )
    ); 
    
  
  }
}
  
