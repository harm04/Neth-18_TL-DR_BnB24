import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:agri_chain/linking/contract_linking.dart';

import 'frontend/onBoarding/page1.dart';

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
        home: Page1(),
      ),
    );
  }
}
