import 'page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Page1 extends StatefulWidget {
  const Page1({key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Image.asset('assets/images/veg1.jpg',fit: BoxFit.cover)),
              Positioned(
                bottom: 60,
              left: 100,
              right: 100,
                child: GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Page2()));
                  },
                child: const CircleAvatar(
                  radius: 43,
                  backgroundColor: Color.fromARGB(255, 71, 165, 74),
                  child: CircleAvatar(backgroundColor: Color.fromARGB(255, 29, 226, 36),radius: 40,
                       child: Center(child: Icon(Icons.arrow_forward,size: 40,color: Colors.white,),),            ),
                )
              )),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.18,),
                    Center(child: Text('Be Healthy & Eat Only Fresh Organic Vegetables',style: TextStyle(color: Colors.white,fontSize: 45,fontWeight: FontWeight.bold),))
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}