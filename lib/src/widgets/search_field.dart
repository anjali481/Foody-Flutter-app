import 'package:flutter/material.dart';

class SearchField  extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Material(
      elevation: 1.0,
      child: TextField(
      decoration :InputDecoration(
        
        hintText: "Search any food",
        suffixIcon: Icon(Icons.search,
        color: Colors.black45,),
        border:InputBorder.none
    ),
  ),
    );
}

    
    
  




}