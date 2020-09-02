import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hello_world/src/pages/restaurants.dart';

class Googlemap extends StatefulWidget{

  @override

_GooglemapState createState() => _GooglemapState();


}

class _GooglemapState extends State<Googlemap>{
  List<Marker>allMarkers =[];
GoogleMapController _controller ;
PageController _pageController;
int prevPage;
@override
void initState(){

super.initState();

shops.forEach((element){

  allMarkers.add(Marker(
    markerId: MarkerId(element.shopName),
    draggable: false,
    infoWindow: InfoWindow(title: element.shopName,snippet: element.address),
    position: element.locationCoords
  ));

});

_pageController =PageController(initialPage: 1,viewportFraction: 0.8)

..addListener(_onScroll);

  
}



void _onScroll(){

  if(_pageController.page.toInt()!=prevPage){

    prevPage=_pageController.page.toInt();
    moveCamera();
  }
}


_shopList(index){

  return AnimatedBuilder(
    animation: _pageController,
    builder: (BuildContext context,Widget widget){

      double value=1;
      if(_pageController.position.haveDimensions){

        value=_pageController.page-index;
        value=(1-(value.abs()*0.3)+0.06).clamp(0.0, 0.1);

      }

return Center(
  child: SizedBox(
    height: Curves.easeInOut.transform(value)*125.0,
    width:Curves.easeInOut.transform(value)*325.0, 
    child: widget,
  ),
);
    },

    child:  InkWell(
      onTap: (){
      //  moveCamera();

      },
      
        child:Stack(
          children:[
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0 ,vertical: 20.0,

                ),

                height: 125.0,
                width: 275.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0,4.0),
                      blurRadius: 10.0,


                    ),
                  ]
                ),


                child:  Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white
                  ),

                  child: Row(
                    children:[
               Container(
                 height: 90.0,
                 width: 90.0,
               child: Image.asset(
                 shops[index].thumbnail,
                  fit:  BoxFit.fitWidth,
                  
           height: 30,
           width: 30,
               )
               
                   
               ),


               SizedBox(
                 width: 5.0,
               ),
               Column(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children:[

                   Text(
                     shops[index].shopName,
                     style:TextStyle(
                       fontSize:12.5,
                       fontWeight:FontWeight.bold
                     ),
                   ),

                   Text(
                     shops[index].address,
                     style:TextStyle(
                       fontSize:12.0,
                       fontWeight:FontWeight.w600,
                     ),
                   ),

                   Container(
                     width: 170.0,
                     child: Text(
                       shops[index].description,
                        style:TextStyle(
                       fontSize:12.0,
                       fontWeight:FontWeight.w300,
                     ),
                     ),
                   )
                 ],
               )
                    ],
                  ),
                ),
              ),
            )

          ],
      )
      
    ),
  );
}


  @override
Widget build(BuildContext context){

  return Scaffold(
    appBar: AppBar(
 title: Text(
   "Maps"
 ),
    ),
 body:Stack(
children:<Widget>[
   Container(
  height:MediaQuery.of(context).size.height, 
  width: MediaQuery.of(context).size.width,
  child: GoogleMap(

    initialCameraPosition:CameraPosition(

      target:LatLng(19.9975,73.7898 ),

      zoom: 15.0
      
    ),
    markers: Set.from(allMarkers),

    onMapCreated: mapCreate,

  ),
),


Positioned(

  bottom: 20.0,
  child:Container(
    height: 200.0,
    width: MediaQuery.of(context).size.width,
    child: PageView.builder(
      controller: _pageController,
      itemCount: shops.length,
      itemBuilder: (BuildContext context,int index){
        return _shopList(index);
      },
    ),
  ) ,
)

]


 )
    
  );
}

void mapCreate(controller){

  setState(() {

   _controller =controller;

  });
}



moveCamera(){

  _controller.animateCamera(CameraUpdate.newCameraPosition(
    CameraPosition(target: shops[_pageController.page.toInt()].locationCoords,zoom: 14.0,
    bearing: 45.0,
    tilt: 45.0,),

    

  ));
}



}