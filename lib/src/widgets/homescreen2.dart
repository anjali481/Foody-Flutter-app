import 'package:flutter/material.dart';
import 'package:hello_world/src/widgets/home_top_in.dart';
import 'package:hello_world/src/widgets/food_catergory.dart';
import 'package:hello_world/src/widgets/search_field.dart';
import 'package:hello_world/src/widgets/bought_food.dart';

import '../data/food_data.dart';
import '../models/food_model.dart';


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
 List<Food> _foods = foods;
  @override
  Widget build(BuildContext context){
  return Scaffold(
    appBar: AppBar(
      title:Text("Search food"),
      actions :<Widget>[


        
      
        IconButton(icon : Icon(Icons.search),
          onPressed: (){
            showSearch(context: context,delegate: DataSearch()
);
          },
          
        )
      ],
    ),
    body:ListView(
      padding: EdgeInsets.only(top:40.0,left:20.0,right:20.0),
      children: <Widget>[
       HomeTopIn(),
       FoodCategory(),

       SizedBox(height: 20.0,),
       SearchField(),
       SizedBox(height: 20.0,),
       Row(
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
         children:<Widget>[
           Text("Most Popular Food",
           style: TextStyle(
             fontSize:18.0,

             fontWeight: FontWeight.bold,
             color: Colors.black,

           ),
        ),
            GestureDetector(
              onTap: (){},
              child:Text(
                " Get View ",
              style: TextStyle(color: Colors.orange,
              fontWeight: FontWeight.bold,
              fontSize: 18.0,),
              ),
              ),
            
         ]
       ),
       SizedBox(height: 20.0,),
       Column(
         children: _foods.map(_buildFoodItems).toList(),
        
        
  
        
       
       ),
      
      ],
    ),
  );
  }



Widget _buildFoodItems(Food food){
  return Container(
    margin: EdgeInsets.only(bottom :20.0),
    child : BoughtFood(

      id: food.id,
      name: food.name,
imagepath: food.imagepath,
category: food.category,
discount: food.discount,
price: food.price,
ratings: food.ratings,

    ),

  );
}
}
class DataSearch extends SearchDelegate<String>{
  final food =[
    "Burger",
    "Cheese Burger",
    "Coffee",
    "Cup Cakes",
    "Lunch Thali",
    "French Fries",
    "Italian noodles",
    "Idli dosa",
    "Pizza",
    "Chienese noodles",
    "Manchurian",
    "Patice",
    "Parathas",
    "Soyachilli",


  ];

final recentfood=[
  "French Fries",
    "Italian noodles",
    "Idli dosa",
    "Pizza",
];

  @override
  List<Widget> buildActions(BuildContext context) {
  
    return [IconButton(icon: Icon(Icons.clear), onPressed: (){})];
  }

  @override
  Widget buildLeading(BuildContext context) {
  
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
         progress: transitionAnimation,
        ),
         onPressed: (){});
  }

  @override
  Widget buildResults(BuildContext context) {
    
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty?recentfood:food;
    return ListView.builder(itemBuilder: (context,index)=>ListTile(
   leading: Icon(Icons.local_pizza),
   title: Text(suggestionList[index]),
    ),
    
    itemCount: suggestionList.length,
    ); 

  }
}