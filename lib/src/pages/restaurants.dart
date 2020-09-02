import 'package:google_maps_flutter/google_maps_flutter.dart';

class Restaurants {
  String shopName;
  String address;
  String description;
  String thumbnail;
  LatLng locationCoords;




  Restaurants(

    {
      this.shopName,this.address,this.description,this.thumbnail,this.locationCoords
    }
  );
}

final List<Restaurants> shops=[

  Restaurants(
    shopName: " Gokul pure veg ",
    address: " Matoshree nagar,Nashik",
    description: 'Shudha shakahari',
    locationCoords: LatLng(19.990278,73.782336),
    thumbnail: 'assests/kaju.jpg',
  ),

Restaurants(

  shopName:" barbaque Nation   ",
  address:" city centre mall  ",
  description:'  Get all types of foods ',
  locationCoords: LatLng( 19.9907242 ,73.7609518 ),

  thumbnail: 'assests/lunch.jpg'),
Restaurants(

  shopName: 'Giriraj Chienese Restro',
  address: ' Near Bank of Baroda ',
  description: 'Get all chienese dishes ',
  locationCoords: LatLng(19.981424,73.755683 ),

  thumbnail: 'assests/pulav.jpg'),


Restaurants(

  shopName: ' Hotel Cafe zRoyale Pure Veg',
  address: 'Shalimar',
  description: 'Vegetarian hotel',
  locationCoords: LatLng(19.997897,73.785979 ),
  thumbnail: 'assests/dosa.jpg',

),
Restaurants(

  shopName: 'jaganaath restro',
  address: 'Shalimar',
  description: 'Vegetarian',
  locationCoords: LatLng(20.003920,73.786975 ),
  thumbnail: 'assests/burger.jpg ',

),








];
