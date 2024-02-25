import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

List<Product> all_Products = [];

class ContractLinking extends ChangeNotifier {
  List<Product> Products = [];
  int urunCount = 0;
  bool isLoading = true;

  final String _rpcUrl = "http://127.0.0.1:7545";
  final String _wsUrl = "ws://127.0.0.1:7545/";
  final String _privateKey =
      "0x5d7c972ae481f7f182c2f99aa7a2f8f3b346f40f93a71b2ec2558725cf1d42bd";

  late Web3Client _client;

  late String _abiCode;
  late EthereumAddress _contractAddress;
  late Credentials _credentials;

  late DeployedContract _contract;
  late ContractFunction _createProduct;
  late ContractFunction _updateProduct;
  late ContractFunction _deleteProduct;
  late ContractFunction _readProduct;
  late ContractFunction _urunCount;

  ContractLinking() {
    initialSetup();
  }

  initialSetup() async {
    _client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });
    await getAbis();
    await getCredentials();
    await getDeployedContract();
  }

  getAbis() async {
    String artifactString =
        await rootBundle.loadString("src/artifacts/Products.json");
    var jsonFile = jsonDecode(artifactString);
    _abiCode = jsonEncode(jsonFile["abi"]);
    //print(_abiCode);
    _contractAddress =
        EthereumAddress.fromHex(jsonFile["networks"]["5777"]["address"]);
  }

  getCredentials() async {
    _credentials = await _client.credentialsFromPrivateKey(_privateKey);
  }

  getDeployedContract() async {
    _contract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "Products"), _contractAddress);

    _urunCount = _contract.function("productCount");
    _readProduct = _contract.function("products");
    _createProduct = _contract.function("createProduct");
    _updateProduct = _contract.function("updateProduct");
    _deleteProduct = _contract.function("deleteProduct");

    getProducts();
  }

  getProducts() async {
    List totalProductsList = await _client
        .call(contract: _contract, function: _urunCount, params: []);
    BigInt totalProducts = totalProductsList[0];
    print(totalProducts);
    urunCount = totalProducts.toInt();
    Products.clear();
    all_Products.clear();

    for (var i = 0; i < urunCount; i++) {
      var allProducts = await _client.call(
          contract: _contract,
          function: _readProduct,
          params: [BigInt.from(i)]);

      print(allProducts);
      Products.add(Product(
        id: allProducts[0],
        productTitle: allProducts[1],
        productDescription: allProducts[2],
        fabrikaFiyat: allProducts[3],
        toptanciData: allProducts[4],
        kargoData: allProducts[5],
        marketData: allProducts[6],
        gecmisData: allProducts[7],
      ));
    }
    for (var i = 0; i < urunCount; i++) {
      var allProducts = await _client.call(
          contract: _contract,
          function: _readProduct,
          params: [BigInt.from(i)]);

      //print(allProducts);
      all_Products.add(Product(
        id: allProducts[0],
        productTitle: allProducts[1],
        productDescription: allProducts[2],
        fabrikaFiyat: allProducts[3],
        toptanciData: allProducts[4],
        kargoData: allProducts[5],
        marketData: allProducts[6],
        gecmisData: allProducts[7],
      ));
    }
    isLoading = false;
    notifyListeners();
  }

  createProducts(
      String title,
      String descp,
      String fabrikaFiyat,
      String toptanciData,
      String kargoData,
      String marketData,
      String gecmisData) async {
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract,
            function: _createProduct,
            parameters: [
              title,
              descp,
              fabrikaFiyat,
              toptanciData,
              kargoData,
              marketData,
              gecmisData
            ],
            maxGas: 1000000),
        chainId: 1337,
        fetchChainIdFromNetworkId: false);
    getProducts();
  }

  updateProduct(
      BigInt id,
      String head,
      String desc,
      String fabrikaFiyat,
      String toptanciData,
      String kargoData,
      String marketData,
      String gecmisData) async {
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract,
            function: _updateProduct,
            parameters: [
              id,
              head,
              desc,
              fabrikaFiyat,
              toptanciData,
              kargoData,
              marketData,
              gecmisData
            ],
            maxGas: 1000000));
    getProducts();
  }

  deleteProduct(BigInt id) async {
    isLoading = true;
    notifyListeners();
    await _client.sendTransaction(
        _credentials,
        Transaction.callContract(
            contract: _contract, function: _deleteProduct, parameters: [id]));
    getProducts();
  }
}

class Product {
  BigInt? id;
  String? productTitle;
  String? productDescription;
  String? fabrikaFiyat;
  String? toptanciData;
  String? kargoData;
  String? marketData;
  String? gecmisData;

  Product(
      {this.id,
      this.productTitle,
      this.productDescription,
      this.fabrikaFiyat,
      this.toptanciData,
      this.kargoData,
      this.marketData,
      this.gecmisData});
}
