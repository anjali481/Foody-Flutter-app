import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hello_world/src/bloc/cartListBloc.dart';
import 'package:hello_world/src/pages/favorite_page.dart';
import 'package:hello_world/src/pages/home_page.dart';
import 'package:hello_world/src/widgets/food_items.dart';

class OrderPage extends StatelessWidget {
final CartListBloc bloc =BlocProvider.getBloc<CartListBloc>();

  @override
  Widget build(BuildContext context) {
    List<FoodItem> foodItems;

    return StreamBuilder(
      
      stream: bloc.listStream,
      builder: (context,snapshot){
        if(snapshot.data !=null){

          foodItems  =snapshot.data;
          return Scaffold(
            
            body: SafeArea(
              child:Container(
                child: CartBody(foodItems),

              ),
            ),

            bottomNavigationBar:BottomBar(foodItems),
          );
        }
      
      else{
        return Container();

      }
      }
    );
  }
  
}


class BottomBar extends StatelessWidget{

  final List<FoodItem> foodItems;

  BottomBar(this.foodItems);
  @override
  Widget build(BuildContext context) {
    return Container(
margin:EdgeInsets.only(left: 35,bottom: 25),
child: Column(
  mainAxisSize: MainAxisSize.min,
  children: <Widget>[
    totalAmount(foodItems),


    Divider(
      height: 1,
      color: Colors.grey[700],


    ),
    persons(),

    

  ],
),
    );
  }





Container persons(){

  return Container(
margin: EdgeInsets.only(right: 10),

padding: EdgeInsets.symmetric(vertical: 30),
child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,

  children: <Widget>[
    Text(
      "Persons",
      style:TextStyle(
        fontSize:14,

        fontWeight:FontWeight.w700,
      ),
    ),

    CustomPersonWidget(),
  ],
),
  );
}









Container totalAmount(List<FoodItem> foodItem){
  return Container(
margin: EdgeInsets.only(right: 10),
padding:  EdgeInsets.all(25),
child: Row(

  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
    Text(
      "Total:",
      style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.w300,

      ),
    ),

    Text(
      "\$${returnTotalAmount(foodItems)}",
      style: TextStyle(
        fontWeight: FontWeight.w700,
        fontSize: 28,
      ),
    )
  ],
),
  );
}







String returnTotalAmount(List<FoodItem> foodItems){

  double totalAmount =0.0;
  for( int i=0;i<foodItems.length;i++){
totalAmount=totalAmount+ foodItems[i].price* foodItems[i].quantity;


  }

return totalAmount.toStringAsFixed(2);

}
}



class  CustomPersonWidget extends StatefulWidget {
  @override
  _CustomPersonWidgetState createState() => _CustomPersonWidgetState();


  }
class _CustomPersonWidgetState extends State< CustomPersonWidget> {



  int noOfPersons=1;
  double _buttonWidth=30;



  @override
  Widget build(BuildContext context) {
    
    return Container(

  margin: EdgeInsets.only(right: 25),
  decoration: BoxDecoration(
    border: Border.all(color:  Colors.grey[300],width: 2),

    borderRadius: BorderRadius.circular(10),

  ), 
padding: EdgeInsets.symmetric(vertical: 5),
width: 120,
child: Row(

  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: <Widget>[
    SizedBox(
      width: _buttonWidth,
      height: _buttonWidth,
      child: RaisedButton(
        child: Text(
          " ",style:TextStyle(fontWeight:FontWeight.w600,
          fontSize:20,
          ),
        ),
      onPressed: (){
 Navigator.push(context, MaterialPageRoute(builder:(context)=>FavoritePage()));
        setState(() {
         if(noOfPersons>1){
          noOfPersons--;
   

         } 
        });
      },


      ),
    ),


    Text(
      noOfPersons.toString(),
      style: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,

      ),
    ),


      SizedBox(
      width: _buttonWidth,
      height: _buttonWidth,
      child: FlatButton(
        child: Text(
          " +",style:TextStyle(fontWeight:FontWeight.w600,
          fontSize:20,
          ),
        ),
      onPressed: (){

        setState(() {
         if(noOfPersons>1){
          noOfPersons++;


         } 
        });
      },


      ),
    ),
  ],
),

    );
  }

  
}













class CartBody extends StatelessWidget {

  final List<FoodItem> foodItems;
  CartBody(this.foodItems);


  @override
  Widget build(BuildContext context) {
    
    return Container(
padding: EdgeInsets.fromLTRB(35, 40, 25,0),
child: Column(
  children: <Widget>[
    CustomAppBar(),
    title(),
    Expanded(
      flex: 1,
     child: foodItems.length>0?foodItemList():noItemContainer(),
    )
  ],
),
    );
  }




  Container noItemContainer(){

    return Container(child: Center(
      child: Text(
        "No more items in the orders Cart",

        style: TextStyle(
          fontWeight: FontWeight.w600,
          color:  Colors.grey[500],
          fontSize: 20
        ),
      ),
    ),);
  }



  ListView foodItemList(){

    return ListView.builder(
      
      itemCount: foodItems.length,

      itemBuilder:  (builder,index){
        return CartListItem(foodItem: foodItems[index] );


      },
    );
  }



Widget title(){

  return Padding(
    padding:EdgeInsets.symmetric(vertical: 35),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "My",
              style:GoogleFonts.pacifico(

                fontWeight: FontWeight.w600,
                fontSize:30,

              )
            ),



            Text(

              "Order",
              style:GoogleFonts.pacifico(

                fontWeight: FontWeight.w300,
                fontSize:30,


              )
            )

          ],
        )
      ],
    ),
  );
}


}



class  CartListItem extends StatelessWidget{
  final FoodItem foodItem;
  CartListItem({@required this.foodItem});

  
  @override



  Widget build(BuildContext context) {
    
    return Container(

      margin: EdgeInsets.only( bottom: 25),

      child: ItemContent(foodItem:foodItem),
    );
  }


} 


class  ItemContent extends StatelessWidget {

  final FoodItem foodItem;

   ItemContent({@required this.foodItem});


  @override
  Widget build(BuildContext context) {
    
    return Container(
   child: Row(
     crossAxisAlignment:  CrossAxisAlignment.center,
     mainAxisAlignment:  MainAxisAlignment.spaceBetween,
     children: <Widget>[
       ClipRRect(
         borderRadius: BorderRadius.circular(5),
         child: Image.asset(
           foodItem.imgUrl,
           fit:  BoxFit.fitHeight,
           height: 55,
           width: 80,

         ),
       ),



       RichText(
         text: TextSpan(
           style: TextStyle(
             fontSize: 16,
             color:  Colors.black,
             fontWeight: FontWeight.w700,

           ),

           children: [

             TextSpan(
               text:  foodItem.quantity.toString()
             ),

              TextSpan(),
               TextSpan(),
           ]
         ),
       ),


       Text(
         "\$${foodItem.quantity * foodItem.price}", 
       style: TextStyle(color: Colors.grey[300], fontWeight: FontWeight.w400),
       )
     ],
   )

    );
  }
  
}


  




class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(5.0),

          child: GestureDetector(child: 
          Icon(
            CupertinoIcons.back,
            size:30,
          ),
          onTap: (){
          Navigator.pop(context);
          }
          ),

        ),



        GestureDetector(
          child: Padding(
            padding: EdgeInsets.all(5.0),
            child: Icon(CupertinoIcons.delete,size:35),
          ),
          onTap: (){},
        )
      ],
    );
    
  }
  
}




















































/*import 'package:hello_world/src/pages/sign_page.dart';
import '../widgets/order_card.dart';

class OrderPage extends StatefulWidget{
  @override
 _OrderPageState createState() =>_OrderPageState();




}


class _OrderPageState extends State<OrderPage>{
  @override
  Widget build(BuildContext context) {
    
    return Scaffold( 

       appBar: AppBar(


        title:Text("My Food Cart",style: TextStyle(color:Colors.black),),
        centerTitle:true,
        backgroundColor: Colors.deepOrange,
        elevation: 0.0,
      


      ),
    
    body :ListView(
      padding: EdgeInsets.symmetric(horizontal: 10.0),
     scrollDirection: Axis.vertical,
     children: <Widget>[
 
     

        
       OrderCard(),
       OrderCard(),
  
       
         _buildTotalContainer(), 


         
       

          

     ],
    ),
    
    

      
     

     
    
    );
    
  }


  Widget _buildTotalContainer(){


    return Container(

      height: 280.0,
      margin: EdgeInsets.only(top:20.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      child:Column(
        
        children: <Widget>[

      


Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,

  children:<Widget>[
Text("Cart price Total",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.grey),),

 Text("23.0",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black),),   
  ],
),

SizedBox(height: 10.0),
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,

  children:<Widget>[
Text("Discount",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.grey),),

 Text("23.0",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black),),   
  ],
),
SizedBox(height: 10.0),


Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,

  children:<Widget>[
Text("Tax",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.grey),),

 Text("0.6",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black),),   
  ],
),

Divider(height:40.0,color: Color(0xFFD3D3D3),),


Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,

  children:<Widget>[
Text("Sub total",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.grey),),

 Text("26.6",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold,color: Colors.black),),   
  ],
),

SizedBox(

  height:20.0,
),

GestureDetector(
  onTap:(){

Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SingInPage()),);
  },
 child: Container(
  
 
  height: 50.0,
  decoration:BoxDecoration(
color: Colors.blue,
borderRadius: BorderRadius.circular(35.0),

  ),

  child: Center(

    child:Text("Proceed to Checkout",

    style:TextStyle(

      color:Colors.white,

      fontWeight: FontWeight.bold,
      fontSize: 18.0,
    ),
    ),
  ),
 )
),

SizedBox(height:20.0
),
      ],),
    );
  }
}

*/
