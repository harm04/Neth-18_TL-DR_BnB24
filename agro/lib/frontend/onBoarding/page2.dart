import 'package:agri_chain/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Page2 extends StatefulWidget {
  const Page2({key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child:
                    Image.asset('assets/images/veg2.jpg', fit: BoxFit.cover)),
            Positioned(
                bottom: 60,
                left: 100,
                right: 100,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MyHomePage()));
                    },
                    child: Container(
                      height: 60,
                      width: 90,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(20)),
                      child: const Center(
                        child: Text(
                          'Get started',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ))),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                  ),
                  const Center(
                      child: Text(
                    'About Us',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  )),
                  const Padding(
                    padding: EdgeInsets.all(28.0),
                    child: Text(
                      'Agro-Chain is sowing digital seeds in age-old soils, sprouting a greener tomorrow for every Indian farmer. We connect the Farmer to Trader’s and keep the process ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
