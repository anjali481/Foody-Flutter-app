
import 'package:meta/meta.dart';


FooditemList fooditemList =FooditemList(foodItems:
[



  FoodItem(
id:1,
title:" Aloo paratha",
price:120,
imgUrl:"assests/Alooparatha.jpg",



  ),
FoodItem(
id:2,
title:" Gobi Paratha",
price:120,
imgUrl:"assests/GobiParatha.jpg",



  ),


FoodItem(
id:3,
title:" Lacha paratha",
price:120,
imgUrl:"assests/Lachaparatha.jpg",



  ),


FoodItem(
id:4,
title:" palak paratha",
price:120,
imgUrl:"assests/palakparatha.jpg",



  ),


FoodItem(
id:5,
title:" Pizza paratha",
price:120,
imgUrl:"assests/Pizzaparatha.jpg",



  ),



FoodItem(
id:6,
title:" Methi paratha",
price:120,
imgUrl:"assests/Methiparatha.jpg",



  ),





]);

class FooditemList{

  List<FoodItem>foodItems;
  FooditemList({ @required this.foodItems});
}

class FoodItem{



  int id;
  String title;
  String imgUrl;
  double price;
  int quantity;


  FoodItem({

    @required this.id,
    @required this.title,
    @required this.imgUrl,
    @required this.price,

    this.quantity=1
   } );



   void incrementQuantity(){

     this.quantity =this.quantity+1;

   }

void decrementQuantity(){

     this.quantity =this.quantity-1;

   }


}