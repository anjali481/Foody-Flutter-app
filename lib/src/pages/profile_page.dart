import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart';



class ProfilePage extends StatefulWidget{
  @override
 _ProfilePageState createState() =>_ProfilePageState();

}


class _ProfilePageState extends State<ProfilePage>{
  int amount =120;

  Razorpay _razorpay;

@override
void initState(){
  super.initState();
  _razorpay =Razorpay();
  _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);



}

@override
void dispose(){

  super.dispose();
  _razorpay.clear();
}



void openCheckout() async{

  var options={

    'key':"rzp_test_Y7ko3SDFcNy7HP",
    'amount':amount*100,
    'name':'anjali',
    'description':'Test Payment',

    'prefill':{'contact':'', 'email': ''},
    'external':{
      'wallets':['paytm']
    }
  };




  try{

    _razorpay.open(options);

  }

  catch(e){

    debugPrint(e);

  }
}

void _handlePaymentSuccess(PaymentSuccessResponse response){


  Fluttertoast.showToast(msg: "SUCCESS:" +response.paymentId);

}


void _handlePaymentError(PaymentFailureResponse response){


  Fluttertoast.showToast(msg: "ERROR:" +response.code.toString()+"-" +response.message);

  
}


void _handleExternalWallet( ExternalWalletResponse response){


  Fluttertoast.showToast(msg: "WALLET" +response.walletName);

  
}







  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Make payment" 
        ),
      ),
   
   body: Center(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         LimitedBox(
           maxWidth: 150.0,
           child: TextField(
             keyboardType: TextInputType.number,
             decoration: InputDecoration(
               hintText: "Enter the amount to pay",

             ),

             onChanged: (value){

               setState(() {
                amount =num.parse(value); 
               });
             },

           ),
         ),

         SizedBox(
height: 15.0,

         ),
         
         RaisedButton(
           color: Colors.teal,
           child: Text("Make Payment",
           style: TextStyle(
             color: Colors.white,
             fontSize: 22.0,
             fontWeight: FontWeight.bold
           ),
           ),
           onPressed: (){
             openCheckout();


           },
         )
       ],
     ),
   ),
    );
    
  }
}