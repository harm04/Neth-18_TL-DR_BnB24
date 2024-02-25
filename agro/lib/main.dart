import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agri_chain/home.dart';
import 'package:agri_chain/linking/contract_linking.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ContractLinking(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Agri Chain',
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.cyan[400],
        ),
        home: MyHomePage(),
      ),
    );
  }
}
