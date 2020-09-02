import 'package:flutter/material.dart';
import 'package:hello_world/src/bloc/provider.dart';
import 'package:hello_world/src/pages/fetch.dart';
import 'package:hello_world/src/pages/order_pages.dart';
import 'package:hello_world/src/widgets/food_catergory.dart';
import 'package:hello_world/src/widgets/home_top_in.dart';
import '../widgets/search_field.dart';
import '../widgets/bought_food.dart';
import '../models/food_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import '../data/food_data.dart';
import '../bloc/cartListBloc.dart';
import '../widgets/food_items.dart';


class HomePage extends StatefulWidget{
 
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage>{
  bool darkMode=false;
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
              onTap: (){
                Text('available');
              },
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


    drawer:Drawer(


      child: Column(
    children:<Widget>[

UserAccountsDrawerHeader(

accountName:Text("Anjali",style: TextStyle(fontSize:19,color:Colors.black,fontWeight: FontWeight.bold)),
accountEmail:Text("anjali.deore@vit.edu"),

currentAccountPicture:CircleAvatar(backgroundImage: ExactAssetImage("assests/kaju.jpg"),)

),

ListTile(
  leading:Icon(Icons.local_grocery_store),
  title: Text(" My Orders",style: TextStyle(fontSize:15)),
 onTap: (){
    Navigator.push(context, MaterialPageRoute(builder:(context)=>OrderPage()));
 }
),


ListTile(
  leading:Icon(Icons.chat),
  title: Text(" Chat with admin",style: TextStyle(fontSize:15)),
  onTap: (){
     Navigator.push(context, MaterialPageRoute(builder:(context)=>Fetch()));
  },
),


ListTile(
  leading:Icon(Icons.local_grocery_store),
  title: Text(" Settings",style: TextStyle(fontSize:15)),
  onTap: (){},
),

ListTile(
  leading:Icon(Icons.local_grocery_store),
  title: Text("Dark mode",style: TextStyle(fontSize:15)),
  onTap: (){
    setState(() {
      darkMode=true;
    });
  },
),





    ]



      ),
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
    "Parathas",
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
    
    return BlocProvider(
      blocs:[

        Bloc((i)=>CartListBloc())

      ],child:MaterialApp(

        title:"List",
        home:Home(),
      )

    );
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

class Home extends StatelessWidget{

  @override
  Widget build (BuildContext context){

    return Scaffold(
      body: SafeArea(

        child : Container(

          child:ListView(

            children:<Widget>[

              FirstHalf(),
             SizedBox(height: 45),
             for (var foodItem in fooditemList.foodItems)
             ItemContainer(foodItem :foodItem)
            ],
          ),
        ),
      ),


    );
  }
}




class ItemContainer extends StatelessWidget {

  final FoodItem foodItem;


  ItemContainer({
@required this.foodItem
  });
final CartListBloc bloc =BlocProvider.getBloc<CartListBloc>();
  addToCart(FoodItem foodItem){
bloc.addToList(foodItem);


  }
  @override
  Widget build(BuildContext context){

    return GestureDetector(

      onTap: (){
        addToCart(foodItem);
        final snackbar =SnackBar(
  content:  Text("${foodItem.title} added to the cart"),
  duration: Duration(milliseconds:  550),
) ;


Scaffold.of(context).showSnackBar(snackbar);

      },

      child: Items(
        itemName:foodItem.title,
        itemPrice : foodItem.price,

        imgUrl:foodItem.imgUrl,
        leftAligned :(foodItem.id %2==0) ?true:false
      ),

    )
    
    ;
  }
  
}

class Items extends StatelessWidget{
Items({

  @required this.leftAligned,
   @required this.imgUrl,
    @required this.itemName,
     @required this.itemPrice,

});
final bool leftAligned;
final String imgUrl;
final String itemName;
final double itemPrice;

  @override
  Widget build(BuildContext context){

  double containerPadding =45;
  double containerBorderRadius =15;


    return Column(

      children: <Widget>[
        Container(
          padding: EdgeInsets.only(
            left: leftAligned ? 0:containerPadding,
            right: leftAligned?containerPadding:0,

          ),

          child: Column(children: <Widget>[

            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: ClipRRect(
                borderRadius:BorderRadius.horizontal(
                  left: leftAligned?Radius.circular(0):Radius.circular(containerBorderRadius),
                  right: leftAligned?Radius.circular(containerBorderRadius):Radius.circular(0),
                ),


               child: Image.asset(
                 imgUrl,
                 fit: BoxFit.fill,
               ),

              ),


            ),


          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.only(
              left: leftAligned?20:0,
              right: leftAligned?0:20,
            ),

          child:Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            children:<Widget>[

          Row(

            children: <Widget>[
              Expanded(
                child: Text(
                  itemName,
                  style:TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18
                  ),
                ),



              ),

              Text(
                "\$$itemPrice",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 18,

                ),
              )
            
            ],
          ),

SizedBox(height: 10,),
Align(
  alignment: Alignment.centerLeft,
  child: RichText(
    text: TextSpan(
      style: TextStyle(
        color: Colors.black45,
        fontSize: 15
      ),
      children: [

        TextSpan( text: "by"),
        TextSpan(
          
        ),
      ]
    )
  )
),

SizedBox( height:  containerPadding,)

            ],
          )













          )



          ],),
        )
      ],
    );
  }
}






class FirstHalf extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Padding(
 padding:EdgeInsets.fromLTRB(35,25,0,0),
 child:Column(

   children:<Widget>
   [

     CustomAppBar(),
       SizedBox(height:30),
       title(),
       SizedBox(height:30),
      SizedBox(height: 30),

      categories(),

     
   ],
 ),

    );
  }




  Widget categories(){

    return Container(
  height:195,
  child: ListView(
    scrollDirection: Axis.horizontal,
    children: <Widget>[
      CategoryListItem(

        categoryIcon:Icons.bug_report,
        categoryName:"Burgers",
        availability:10,
        selected:true,

      ),



CategoryListItem(

        categoryIcon:Icons.bug_report,
        categoryName:" cheese",
        availability:11,
        selected:false,

      ),



      CategoryListItem(

        categoryIcon:Icons.bug_report,
        categoryName:" Chicken",
        availability:15,
        selected:false,

      ),
       CategoryListItem(

        categoryIcon:Icons.bug_report,
        categoryName:" Veg Burges",
        availability:15,
        selected:false,

      ),
       CategoryListItem(

        categoryIcon:Icons.bug_report,
        categoryName:"Burgers",
        availability:15,
        selected:false,

      ),
       CategoryListItem(

        categoryIcon:Icons.bug_report,
        categoryName:"Burgers ",
        availability:15,
        selected:false,

      ),




    ],
  ),
    );
  }


  Widget title(){

    return Row(
      mainAxisAlignment:MainAxisAlignment.start,
      children:<Widget>[
SizedBox(width:45),
Column(

  crossAxisAlignment:CrossAxisAlignment.start,
  children:<Widget>[

    Text(

      "Food",

      style:TextStyle(
fontWeight:FontWeight.w700,
fontSize:30,



      )
    ),


    Text("Delivery",
    style: TextStyle(

      fontWeight:FontWeight.w200,
      fontSize:30,

    ))
  ]
)

      ]
    );
  }
}

class CustomAppBar extends StatelessWidget{


final CartListBloc  bloc =  BlocProvider.getBloc<CartListBloc>();



  @override
  Widget build(BuildContext context){
    return Container(


      margin:EdgeInsets.only(bottom:15),
      child:Row(

        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children:<Widget>[

          Icon(Icons.menu),
       StreamBuilder(
         stream: bloc.listStream,
         builder: (context,snapshot){
           List<FoodItem> foodItems =snapshot.data;


           int length = foodItems!=null ?foodItems.length:0;
           return buildGestureDetector(length,context,foodItems);
         },
       )
        ],
      ),
    );

  
  
  }



  GestureDetector buildGestureDetector(int lenght,BuildContext context,List<FoodItem> foodItems){



    return GestureDetector(

      onTap: (){
        if(lenght>0){
          Navigator.push(context, MaterialPageRoute(builder:(context)=>OrderPage()));

        }

        else{
          return;
        }
      },

        child:Container(
          margin:EdgeInsets.only(right: 30),
          child: Text(lenght.toString()),
          padding: EdgeInsets.all(15),
decoration: BoxDecoration(color: Colors.yellow[800], borderRadius: BorderRadius.circular(50)),
        ),
      
    );
  }
 }

 class CategoryListItem extends StatelessWidget {

   final IconData categoryIcon;
   final String categoryName;
   final int availability;
   final bool selected;

   CategoryListItem({

     @required this.categoryIcon,
     @required this.categoryName,
     @required this.availability,
     @required this.selected

   });
   @override

   Widget build(BuildContext context){

     return Container(


       margin: EdgeInsets.only(right: 20),
       padding: EdgeInsets.fromLTRB(10, 10, 10, 20),
     decoration: BoxDecoration(borderRadius: BorderRadius.circular(50),
     
     color: selected?Color(0xfffeb324):Colors.white,
     border: Border.all(
       color: selected?Colors.transparent:Colors.grey[200],
       width: 1.5
     ),
     
     boxShadow: [
       BoxShadow(
         color: Colors.grey[100],
         blurRadius: 15,
         offset:Offset(25,0),
         spreadRadius: 5
       )
     ]
     ),

child: Column(

  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[

    Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(

        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: selected?Colors.transparent:Colors.grey,
          width: 1.5,
        )



      ),


      child: Icon(categoryIcon,color:Colors.black,size:30),
    ),


    SizedBox(height: 10,),
    Text(categoryName,style:TextStyle(fontWeight: FontWeight.w700,
    color: Colors.black,
    fontSize: 15,)),


Container(
  margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
  width: 1.5,
  height: 15,
  color: Colors.black26,
),
Text(
  availability.toString(),
  style: TextStyle(
    fontWeight: FontWeight.w600,

    color: Colors.black
  ),
)



  ],
),

     );
   }
 }