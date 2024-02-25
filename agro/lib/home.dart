import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:agri_chain/custom_widgets/custom_app_bar.dart';
import 'package:agri_chain/custom_widgets/product_card.dart';
import 'package:agri_chain/linking/contract_linking.dart';
import 'package:agri_chain/screens/DevLoginPage.dart';
import 'package:agri_chain/screens/create_urun.dart';
import 'package:agri_chain/screens/splash_page.dart';
import 'package:agri_chain/utils/colors.dart';

bool if_Dev = true;

class MyHomePage extends StatefulWidget {
  final Product? task;

  MyHomePage({this.task});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Product> searchedObjects = all_Products;

  @override
  Widget build(BuildContext context) {
    var contractLinking = Provider.of<ContractLinking>(context);
    // TextEditingController _searchController = TextEditingController();

    if (all_Products.length == 0) {
      return SplashPage();
    } else {
      return Scaffold(
        appBar: CustomAppBar(
          
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Products",
                        style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(right: 50, bottom: 20),
                      child: IconButton(
                        tooltip: "Developer Options",
                        icon: Icon(Icons.login, size: 50),
                        color: black,
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DevLoginPage()));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.only(left: 25, top: 20, right: 25),
              //   child: TextField(
              //       controller: _searchController,
              //       decoration: InputDecoration(
              //           hintText: " Search",
              //           hintStyle: TextStyle(
              //               fontSize: 21,
              //               fontWeight: FontWeight.w500,
              //               color: Colors.black),
              //           border: OutlineInputBorder(
              //               borderSide:
              //                   BorderSide(width: 2, color: Colors.white),
              //               borderRadius:
              //                   BorderRadius.all(Radius.circular(16))),
              //           contentPadding: EdgeInsets.all(16),
              //           focusedBorder: OutlineInputBorder(
              //               borderSide:
              //                   BorderSide(width: 2, color: Colors.white),
              //               borderRadius:
              //                   BorderRadius.all(Radius.circular(16))),
              //           prefixIcon:
              //               Icon(Icons.search_outlined, color: Colors.white)),
              //       onChanged: searchObject),
              // ),
            ],
          ),
        ),
        floatingActionButton: if_Dev == true
            ? FloatingActionButton(
                backgroundColor: Color(0xff1F4690),
                child: Icon(Icons.add, color: white),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => CreateUrun()));
                },
              )
            : Container(),
        body: contractLinking.isLoading
            ? Center(
                child: CircularProgressIndicator(color: black),
              )
            : Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                  child: ListView.builder(
                    itemCount: searchedObjects.length,
                    // padding: EdgeInsets.only(left: 24, right: 24, bottom: 24),
                    itemBuilder: (context, index) {
                      // final Task=searchedObjects[index];
                      print(searchedObjects[index].id);
                      return TaskCard(urun: searchedObjects[index]);
                    },
                  ),
                ),
            ),
      );
    }
  }

  // void searchObject(String query) {
  //   final suggestions = all_Products.where((Task) {
  //     final searchedTitle = Task.productTitle!.toLowerCase();
  //     final input = query.toLowerCase();

  //     return searchedTitle.contains(input);
  //   }).toList();
  //   setState(() => searchedObjects = suggestions.isNotEmpty ? suggestions : all_Products.take(10).toList());
  // }
}
