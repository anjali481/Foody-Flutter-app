import 'package:flutter/material.dart';


class ProductDetails extends StatefulWidget{
final String id;
  final String name;
  final String imagepath;
  final String category;
  final double price;
  final double discount;
  final double ratings;

   ProductDetails({this.id,this.name,this.imagepath,this.category,this.price,this.discount,this.ratings});

  @override
  _ProductDetailsState createState()=> _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails>{
  
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: new AppBar(
        backgroundColor: Colors.blueAccent,
        title :Text("Food App"),
        actions :<Widget>[

          new IconButton(icon: Icon(Icons.search  ,color:  Colors.white), onPressed: (){})
        ]

        ),


        body : new Column(

          children: <Widget>[

            new Container(
              height: 300.0,
              child: Container(
              color: Colors.white,
            
              
             
             
              ),
            )
          ],
        )
      );
    }
  }
