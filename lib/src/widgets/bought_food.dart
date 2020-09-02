import 'package:flutter/material.dart';



class BoughtFood extends StatefulWidget{

  final String id;
  final String name;
  final String imagepath;
  final String category;
  final double price;
  final double discount;
  final double ratings;


  BoughtFood({this.id,this.name,this.imagepath,this.category,this.price,this.discount,this.ratings}); 
  @override
  _BoughtFoodState createState() => _BoughtFoodState();
}

class _BoughtFoodState extends State<BoughtFood>{
  @override
  Widget build(BuildContext context){

    return ClipRRect(
      child:Material(
        child:InkWell(

          onTap: () => Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> ProductDetails(

      


          ))),
      borderRadius:BorderRadius.circular(10.0),
    child: Stack(children: <Widget>[
      Container(
        height:200.0,
        child:Image.asset(widget.imagepath, fit:BoxFit.cover,),
      ),
     
     Positioned(
      


      

       left: 0.0,
       bottom: 0.0,
     child: Container(
        height: 60.0,
        
        decoration: BoxDecoration(
          gradient: LinearGradient(colors:[ Colors.black12 ,Colors.black45],
          
          begin:Alignment.bottomCenter,
          end:Alignment.topCenter )
        ),
     ),
     
      ),

     
     Positioned(

       left:0.0,
       bottom:15.0,
     child: Row(
        children:<Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: <Widget>[

          Text(
            widget.name,
            style:TextStyle(color: Colors.black,
            fontSize:18.0,
            fontWeight: FontWeight.bold
            ),
          ),

          Row(children: <Widget>[
            Icon(Icons.star,color:Theme.of(context).accentColor,size:16.0), 
            Icon(Icons.star,color:Theme.of(context).primaryColor,size:16.0),  
            Icon(Icons.star,color:Theme.of(context).primaryColor,size:16.0),  
            Icon(Icons.star,color:Theme.of(context).primaryColor,size:16.0),  
            Icon(Icons.star,color:Theme.of(context).primaryColor,size:16.0), 
            SizedBox(width: 20.0,),
            Text(
              "(" + widget.ratings.toString() +"Reviews)",
              style: TextStyle(
                color:Colors.black45
                
              ),


            ), 
                     ],)
        ],),

        Column(
          children: <Widget>[

            Text(widget.price.toString(),
            ),

            Text(
""
              
            ),
            
          ]
        
        
        ),
      ]
      
      
      )
     ),
    ],
    ),
      ),
     ),
      );
  }
}

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