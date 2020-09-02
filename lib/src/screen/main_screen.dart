import 'package:flutter/material.dart';
import '../pages/home_page.dart';

import '../pages/order_pages.dart';
import '../pages/profile_page.dart';
import '../pages/favorite_page.dart';


class MainScreen extends StatefulWidget{
  @override
  _MainScreenState createState() => _MainScreenState();
}
   
  

class _MainScreenState extends State<MainScreen>{


  int currentTabIndex =0;

  List<Widget> pages;
  Widget currentPage;
  HomePage homePage;
 OrderPage orderPage;
FavoritePage favoritePage;
ProfilePage paymentPage;
  @override
  void initState() {
  
    super.initState();
    homePage=HomePage();
    orderPage=OrderPage();
    favoritePage =FavoritePage();
    paymentPage =ProfilePage();
  pages=[homePage,orderPage,favoritePage,paymentPage];

  currentPage=homePage;
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      bottomNavigationBar :BottomNavigationBar(
      onTap: (int index){

   setState(() {
   currentTabIndex =index;
   currentPage =pages[index];

   });
      },
currentIndex: currentTabIndex,
type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(

            icon: Icon(Icons.home),
            title: Text("Home")
          ),

          BottomNavigationBarItem(

            icon: Icon(Icons.shopping_cart),
            title:Text("Orders")
          ),


          
          BottomNavigationBarItem(

            icon: Icon(Icons.favorite),
            title:Text("Confirm")
          ),


          
          BottomNavigationBarItem(

            icon: Icon(Icons.person),
            title:Text("Payment")
          ),
        ],
      ),

      body: currentPage,
     
    );
  }

}
