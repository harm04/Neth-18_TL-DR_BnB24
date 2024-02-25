import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:agri_chain/custom_widgets/button_plain.dart';
import 'package:agri_chain/linking/contract_linking.dart';
import 'package:agri_chain/utils/colors.dart';

String error_message = "";

// ignore: must_be_immutable
class CreateUrun extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController descpController = TextEditingController();
  TextEditingController fabrikaFiyatController = TextEditingController();

  TextEditingController toptanciAdController = TextEditingController();
  TextEditingController toptanciFiyatController = TextEditingController();

  TextEditingController kargoAdController = TextEditingController();
  TextEditingController kargoFiyatController = TextEditingController();

  TextEditingController marketAdController = TextEditingController();
  TextEditingController marketFiyatController = TextEditingController();

  TextEditingController tarihAdController = TextEditingController();
  TextEditingController gecmisFiyatController = TextEditingController();

  String wholesaler_names = "";
  String wholesaler_prices = "";
  String wholesaler_total = "";
  int wholesaler_qty = 0;

  String shipping_names = "";
  String shipping_prices = "";
  String shipping_total = "";
  int shipping_qty = 0;

  String market_isimleri = "";
  String market_Fiyatlari = "";
  String market_total = "";
  int market_adet = 0;

  String previous_name = "";
  String previous_price = "";
  String gecmis_total = "";
  int gecmis_adet = 0;

  @override
  Widget build(BuildContext context) {
    var contractLinking = Provider.of<ContractLinking>(context);
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(),
              ),
              Expanded(
                flex: 5,
                child: ListView(
                  padding: EdgeInsets.all(34),
                  children: <Widget>[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "ADDING A NEW PRODUCT",
                        style: TextStyle(
                            fontSize: 44,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextField(
                      controller: titleController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Title",
                          hintStyle: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                              color: Colors.white54),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          contentPadding: EdgeInsets.all(16),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          prefixIcon: Icon(Icons.title, color: Colors.white)),
                    ),
                    SizedBox(
                      height: 24,
                    ),
                    TextField(
                      controller: descpController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: "Description",
                          hintStyle: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                              color: Colors.white54),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          contentPadding: EdgeInsets.all(16),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          prefixIcon: Icon(Icons.title, color: Colors.white)),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    TextField(
                      controller: fabrikaFiyatController,
                      style: TextStyle(color: Colors.white),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(
                            RegExp(r'^\d+\.?\d{0,2}')),
                      ],
                      decoration: InputDecoration(
                          hintText: "Manufacturer Price",
                          hintStyle: TextStyle(
                              fontSize: 21,
                              fontWeight: FontWeight.w500,
                              color: Colors.white54),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          contentPadding: EdgeInsets.all(16),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(width: 2, color: white),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16))),
                          prefixIcon: Icon(Icons.title, color: Colors.white)),
                    ),
                    listeGirme(
                      controller1: toptanciAdController,
                      controller2: toptanciFiyatController,
                      String_Ad: wholesaler_names,
                      String_Fiyat: wholesaler_prices,
                      total: wholesaler_total,
                      cins: "Wholesaler ",
                      callback: () {
                        if (toptanciAdController.text.length > 0 &&
                            toptanciFiyatController.text.length > 0) {
                          wholesaler_names = wholesaler_names +
                              (toptanciAdController.text) +
                              "|";
                          wholesaler_prices = wholesaler_prices +
                              (toptanciFiyatController.text) +
                              "|";

                          wholesaler_total =
                              "$wholesaler_names : $wholesaler_prices";
                          print(wholesaler_total);
                          wholesaler_qty++;

                          toptanciAdController.clear();
                          toptanciFiyatController.clear();
                        } else {
                          print("Missing input");
                        }
                      },
                    ),
                    listeGirme(
                      controller1: kargoAdController,
                      controller2: kargoFiyatController,
                      String_Ad: shipping_names,
                      String_Fiyat: shipping_prices,
                      total: shipping_total,
                      cins: "Cargo delivery",
                      callback: () {
                        if (kargoAdController.text.length > 0 &&
                            kargoFiyatController.text.length > 0) {
                          shipping_names =
                              shipping_names + (kargoAdController.text) + "|";
                          shipping_prices = shipping_prices +
                              (kargoFiyatController.text) +
                              "|";

                          shipping_total = "$shipping_names : $shipping_prices";
                          print(shipping_total);
                          shipping_qty++;

                          kargoAdController.clear();
                          kargoFiyatController.clear();
                        } else {
                          print("Missing input");
                        }
                      },
                    ),
                    listeGirme(
                      controller1: marketAdController,
                      controller2: marketFiyatController,
                      String_Ad: market_isimleri,
                      String_Fiyat: market_Fiyatlari,
                      total: market_total,
                      cins: "Market ",
                      callback: () {
                        if (marketAdController.text.length > 0 &&
                            marketFiyatController.text.length > 0) {
                          market_isimleri =
                              market_isimleri + (marketAdController.text) + "|";
                          market_Fiyatlari = market_Fiyatlari +
                              (marketFiyatController.text) +
                              "|";

                          market_total = "$market_isimleri : $market_Fiyatlari";
                          print(market_total);
                          market_adet++;

                          marketAdController.clear();
                          marketFiyatController.clear();
                        } else {
                          print("Missing input");
                        }
                      },
                    ),
                    listeGirme(
                      controller1: tarihAdController,
                      controller2: gecmisFiyatController,
                      String_Ad: previous_name,
                      String_Fiyat: previous_price,
                      total: gecmis_total,
                      cins: "Past History ",
                      callback: () {
                        if (tarihAdController.text.length > 0 &&
                            gecmisFiyatController.text.length > 0) {
                          previous_name =
                              previous_name + (tarihAdController.text) + "|";
                          previous_price = previous_price +
                              (gecmisFiyatController.text) +
                              "|";

                          gecmis_total = "$previous_name : $previous_price";
                          print(gecmis_total);
                          gecmis_adet++;

                          tarihAdController.clear();
                          gecmisFiyatController.clear();
                        } else {
                          print("Missing input");
                        }
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$error_message",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ],
                    ),
                    ButtonPlainWithShadow(
                      text: "Add Product",
                      shadowColor: wood_smoke,
                      borderColor: wood_smoke,
                      callback: () {
                        if (titleController.text.length > 0 &&
                            descpController.text.length > 0 &&
                            fabrikaFiyatController.text.length > 0 &&
                            wholesaler_qty > 3 &&
                            shipping_qty > 3 &&
                            market_adet > 3 &&
                            gecmis_adet > 2) {
                          contractLinking.createProducts(
                              titleController.text,
                              descpController.text,
                              fabrikaFiyatController.text,
                              wholesaler_total,
                              shipping_total,
                              market_total,
                              gecmis_total);

                          titleController.clear();
                          descpController.clear();
                          Navigator.pop(context);
                        } else {
                          error_message = "Incomplete or Incorrect Input";
                          print("input missing");
                          Navigator.pop(context);
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateUrun()));
                        }
                      },
                      color: lightening_yellow,
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
              left: 24,
              top: 50,
              child: IconButton(
                iconSize: 48,
                color: Colors.white,
                icon: Icon(
                  Icons.cancel,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ))
        ],
      ),
    );
  }

//titleController.text.length>0 && descpController.text.length>0 && fabrikaFiyatController.text.length>0 &&wholesaler_qty>3&&shipping_qty>3&&market_adet>3&&gecmis_adet>2
}

// ignore: must_be_immutable
class listeGirme extends StatelessWidget {
  TextEditingController? controller1;
  TextEditingController? controller2;
  String? cins;
  String? String_Ad;
  String? String_Fiyat;
  String? total;
  final VoidCallback? callback;

  listeGirme(
      {this.controller1,
      this.controller2,
      this.cins,
      this.String_Ad,
      this.String_Fiyat,
      this.total,
      this.callback});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: controller1,
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
              hintText: "name of $cins",
              hintStyle: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  color: Colors.white54),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              contentPadding: EdgeInsets.all(16),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              prefixIcon: Icon(Icons.description, color: Colors.white)),
        ),
        TextField(
          controller: controller2,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
          decoration: InputDecoration(
              hintText: "price $cins",
              hintStyle: TextStyle(
                  fontSize: 21,
                  fontWeight: FontWeight.w500,
                  color: Colors.white54),
              border: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              contentPadding: EdgeInsets.all(16),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(width: 2, color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(16))),
              prefixIcon: Icon(Icons.description, color: Colors.white)),
        ),
        ButtonPlainWithShadow(
          text: "$cins add price information",
          shadowColor: wood_smoke,
          borderColor: wood_smoke,
          callback: callback,
          color: lightening_yellow,
        ),
      ],
    );
  }
}
