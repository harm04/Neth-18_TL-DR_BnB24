import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          children: [
            // SizedBox(height: 30,),
            Stack(children: [
              CircleAvatar(radius: 60,backgroundColor: Colors.green,child: CircleAvatar(radius: 55,backgroundImage: NetworkImage('https://images.unsplash.com/photo-1545830790-68595959c491?q=80&w=1935&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),),)
            ],),
            Text('Profile'),
          ],
        ),
      ),
    );
  }
}
