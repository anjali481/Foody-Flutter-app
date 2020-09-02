import 'package:flutter/material.dart';
import 'package:hello_world/src/homescreen.dart';
import 'src/bloc/cartListBloc.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
void main() =>runApp(MyApp());
class MyApp extends StatelessWidget{
  
  @override
  Widget build(BuildContext context){
    return BlocProvider(
      blocs:[
  Bloc((i)=>CartListBloc())

      ],
      child:MaterialApp(
    debugShowCheckedModeBanner: false,
      
     theme:   ThemeData(
       
      primaryColor: Colors.orange,

      ),
      home: Login(),
    ));
    
  }
}
  

/*return BlocProvider(
      blocs:[

        Bloc((i)=>CartListBloc())

      ],child:MaterialApp(

        title:"List",
        home:Home(),
      )

    );


MaterialApp(
      theme :ThemeData(
        primarySwatch :Colors.blue,

      ),
      home: Login(),
    );
*/


