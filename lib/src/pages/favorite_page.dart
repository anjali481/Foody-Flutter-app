import 'package:flutter/material.dart';
import 'package:hello_world/src/pages/google_maps.dart';
import 'package:hello_world/src/pages/notescreen.dart';
import '../pages/profile_page.dart';
import 'ListViewnote.dart';
import 'google_maps.dart';
import 'package:google_fonts/google_fonts.dart';

class FavoritePage extends StatefulWidget{


  
  @override
 _FavoritePageState createState() =>_FavoritePageState();


}


class _FavoritePageState extends State<FavoritePage>{


   List picked =[false,false];
  int totalAmount =0;
pickToggle(index){
  setState(() {
    picked[index]=!picked[index];
   getTotalAmount();

  });

}

getTotalAmount(){

var count =0;
for (int i =0; i<picked.length;i++){
  if(picked[i]){
    count =count+1;

  }
if (i==picked.length-1){

  setState(() {
    totalAmount =120*count;
  });
}

}


}







  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:ListView(shrinkWrap: true,children: <Widget>[
        Column(crossAxisAlignment: CrossAxisAlignment.start,children: <Widget>[
          Stack(children: [
            Stack(children: <Widget>[
              Container(
                height:MediaQuery.of(context).size.height,
                width:double.infinity,

              ),
              Container(
                height:250.0,
                width:double.infinity,
                color:Colors.orange[200],

              ),


              Positioned(bottom: 450.0,
              right:100.0,
              child:Container(
                height: 400.0,
                width: 400.0,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(200.0),
                  color:Colors.orange[200]

                ),
              )
              
              ),

              Positioned(bottom: 500.0,
              left:150.0,
              child:Container(
                height: 300.0,
                width: 300.0,
                decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(150.0),
                  color:Colors.orange[200]

                ),
              )
              
              ),
              Padding(padding: EdgeInsets.only(top:15.0),
              child:IconButton(
                alignment: Alignment.topLeft,
                icon: Icon(Icons.arrow_back),
                onPressed: (){},
              )),

              Positioned(
                top:100.0,
                left:15.0,
                child:Text('Confirm Orders',
                style:GoogleFonts.pacifico(

                fontWeight: FontWeight.w400,
                fontSize:30,


              )
                ),
                
               


                
              ),















Positioned(
top:50,
right: 15.0,

           
           child:   SizedBox(

              child:Container(
                padding: EdgeInsets.all(5.0),
                
                height: 40,
                width: 150,

          
            
              child: RaisedButton(
                
                onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder:(context)=>ListViewNote()));
                },
                
                 
                color: Colors.red,
                child:Center(child: Text('Address' ,
                      
                      ),),

                    textColor: Colors.white,  
                     

                   
                    
              ),
                
            )
            ),
),
              Positioned(

                top:150.0,
                child:Column(

                  children: <Widget>[

                    itemCard('Aloo paratha','gray','120','assests/Alooparatha.jpg',true,0),
                    itemCard('Pizza paratha','gray','120','assests/Pizzaparatha.jpg',true,1),
                    itemCard('palak paratha','gray','180','assests/palakparatha.jpg',false,2),
                 //  itemCard('Veg pulav','gray','248','assests/pulav.jpg',true,3),
                    //itemCard('Veg pulav','gray','248','assests/pulav.jpg',true,4),
                    //itemCard('Veg pulav','gray','248','assests/pulav.jpg',true,5),

                  ],
                ),
              ),

              Padding(padding: EdgeInsets.only(top:600.0,bottom:15.0),
              child:Container(
                height: 50.0,
                width: double.infinity,
                color: Colors.white,
                child: Row(
                  mainAxisAlignment:MainAxisAlignment.end,
                  children:<Widget>[

                    Text('Total:\$'+totalAmount.toString()),
                    SizedBox(width:10.0),
                    Padding(padding: const EdgeInsets.all(8.0),
                    child:RaisedButton(
                      onPressed:(){
                         Navigator.push(context, MaterialPageRoute(builder:(context)=>ProfilePage()));
            
                      },

                      elevation:0.5,
                      color:Colors.red,
                      child:Center(child: Text('Pay Now' ,
                      
                      ),),

                    textColor: Colors.white,
                    



                    ))
                  ]
                ),
              ))






              
            ],)
          ],)
        ],)
      ]

    ),
    
    
   

            
          
        );
      
  


  }




  Widget itemCard(itemName,color,price,imgPath,available,i){

    return InkWell(
  onTap: (){

if(available){

  pickToggle(i);

}

  },


  child: Padding(padding: EdgeInsets.all(10.0),
  child: Material(
    borderRadius: BorderRadius.circular(10.0),
    elevation: 3.0,
    child: Container(
      padding:EdgeInsets.only(left:15.0,right:10.0),
      width:MediaQuery.of(context).size.width  -20.0,
   height: 150.0,
   decoration: BoxDecoration(
     color:Colors.white,
     borderRadius:BorderRadius.circular(10.0),
   ),

   child: Row(
     children:<Widget>[
       Column(
       mainAxisAlignment:MainAxisAlignment.center,
       children:<Widget>[


         Container(

           height:25,
           width: 25.0 ,
           decoration: BoxDecoration(
             color:available?
             Colors.grey.withOpacity(0.4):
             Colors.red.withOpacity(0.4),
             borderRadius:BorderRadius.circular(12.5),
           ),

           child: Center(
             child:available
             ?Container(
               height:12.0,
               width:12.0,
               decoration:BoxDecoration( 
               color:picked[i]
               ?Colors.yellow:
               Colors.grey.withOpacity(0.4),
               borderRadius: BorderRadius.circular(6.0),



               ),

             )
           :Container()

         ))
       ],
       ),

SizedBox(width:10.0),

Container(
  height:150.0,

  width:125.0,


  decoration:BoxDecoration(

    image:DecorationImage(image: AssetImage(
      imgPath
    ),
    fit: BoxFit.contain
    )
  )
),


SizedBox(
  width:4.0
),

Column(
  mainAxisAlignment:MainAxisAlignment.center,
  crossAxisAlignment:CrossAxisAlignment.start,

  children:<Widget>[

    Row( 
    children: <Widget>[

      Text(
itemName,
style: TextStyle(
  fontWeight:FontWeight.bold,
  fontSize:15.0
),

      ),


SizedBox(
  width:7.0
),

available
?picked[i]
?Text('x1', style: TextStyle(fontWeight:FontWeight.bold,fontSize:14.0,color:Colors.grey),)
:Container()
:Container()




    ],),

    SizedBox(height:7.0),
    available
      ?Text('Color:'+color,
      style:TextStyle(color: Colors.grey,fontWeight:FontWeight.bold,fontSize:14.0),
      )

      :OutlineButton(onPressed: 
      (){
 Navigator.push(context, MaterialPageRoute(builder:(context)=>Googlemap()));


      },
      borderSide:BorderSide(color: Colors.red,
      width:1.0,
      
      style:BorderStyle.solid),
      child:Center(
        child:Text('Google maps',
        style:TextStyle(color: Colors.red, 
        fontWeight:FontWeight.bold,
        fontSize:12.0,)),
      ) ,),



SizedBox(height:7.0),
available
?Text(
  '\$'+price,
  style:TextStyle(color: Color(0xFFFDD34A),
  fontWeight:FontWeight.bold,
  fontSize:20.0,)
)
:Container(),


  ],

)

     ]
   ),
    ),
  ),
  ),
    );
  }
}
