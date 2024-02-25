import 'widgets.dart/custom_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: const TextField(decoration: InputDecoration(hintText: 'Search Store',prefixIcon: Icon(Icons.search)),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomCard(context,const AssetImage('assets/images/banana.png',),'Organic Banana','7 pcs,400'),
                  const SizedBox(width: 10,),
              CustomCard(context,const AssetImage('assets/images/apple.png',),'Red apple','1 kg, 400'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomCard(context,const AssetImage('assets/images/bellPeper.png',),'Bell Peper Red','7 pcs,400'),
                  const SizedBox(width: 10,),
              CustomCard(context,const AssetImage('assets/images/ginger.png',),'Ginger','250 g, 300'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomCard(context,const AssetImage('assets/images/banana.png',),'Organic Banana','7 pcs,400'),
                  const SizedBox(width: 10,),
              CustomCard(context,const AssetImage('assets/images/apple.png',),'Red apple','1 kg, 400'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomCard(context,const AssetImage('assets/images/bellPeper.png',),'Bell Peper Red','7 pcs,400'),
                  const SizedBox(width: 10,),
              CustomCard(context,const AssetImage('assets/images/ginger.png',),'Ginger','250 g, 300'),
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}