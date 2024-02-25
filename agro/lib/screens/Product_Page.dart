import 'package:flutter/material.dart';
import 'package:agri_chain/utils/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../custom_widgets/custom_app_bar.dart';

String? task_id;
String? taskTitle;
String? taskDescription;
String? data3;
String? data4;
String? data5;
String? data6;
String? data7;

class UrunPage extends StatefulWidget {
  @override
  _UrunPageState createState() => _UrunPageState();
}

class _UrunPageState extends State<UrunPage> {
  final List<String> data4_isbookmarks = data4!.split(" : ")[0].split("|");
  final List<String> data5_isbookmarks = data5!.split(" : ")[0].split("|");
  final List<String> data6_isbookmarks = data6!.split(" : ")[0].split("|");
  final List<String> data7_isbookmarks = data7!.split(" : ")[0].split("|");

  final List<String> data4_prices = data4!.split(" : ")[1].split("|");
  final List<String> data5_prices = data5!.split(" : ")[1].split("|");
  final List<String> data6_prices = data6!.split(" : ")[1].split("|");
  final List<String> data7_prices = data7!.split(" : ")[1].split("|");

  @override
  Widget build(BuildContext context) {
    bool catch_error = data4_prices.length < 4 ||
        data5_prices.length < 4 ||
        data6_prices.length < 4 ||
        data7_prices.length < 3 ||
        data4_isbookmarks.length < 4 ||
        data5_isbookmarks.length < 4 ||
        data6_isbookmarks.length < 4 ||
        data7_isbookmarks.length < 3;

    if (catch_error) {
      return Scaffold(
          backgroundColor: Colors.black,
          body: Text("error or missing product entry"));
    } else {
      double su_AnKi_Ort_kargo = (double.parse(data4_prices[0]) +
              double.parse(data4_prices[1]) +
              double.parse(data4_prices[2]) +
              double.parse(data4_prices[3])) /
          4;
      double su_AnKi_Ort_toptanci = (double.parse(data5_prices[0]) +
              double.parse(data5_prices[1]) +
              double.parse(data5_prices[2]) +
              double.parse(data5_prices[3])) /
          4;
      double su_AnKi_Ort_market = (double.parse(data6_prices[0]) +
              double.parse(data6_prices[1]) +
              double.parse(data6_prices[2]) +
              double.parse(data6_prices[3])) /
          4;

      final double uretici_fiyat = double.parse(data3!);

      return Scaffold(
        backgroundColor: black,
        appBar: CustomAppBar(
          height: 200,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  crossAxisAlignment:  CrossAxisAlignment.start,
                  children: [
                    Text(
                      taskTitle ?? "",
                      style: TextStyle(
                          fontSize: 44,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                     Text(
                       "Product description: $taskDescription",
                       style: TextStyle(
                           fontSize: 20,
                           fontWeight: FontWeight.bold,
                           color: white),
                     ),
                    
                    Text(
                      "Product Price: $data3",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: white),
                    ),
                     Text(
                        "Product ID: $task_id",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: white),
                      ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(
                  right: 25,
                ),
                child: IconButton(
                  iconSize: 48,
                  color: Colors.white,
                  icon: Icon(
                    Icons.cancel,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Column(
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Expanded(
                  flex: 5,
                  child: ListView(
                    padding: EdgeInsets.all(34),
                    children: <Widget>[
                      SizedBox(
                        height: 24,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Wholesaler Comparison",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: white),
                      ),
                      Container(
                          child: SfCartesianChart(
                              // Initialize category axis
                              primaryXAxis: CategoryAxis(
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              primaryYAxis: CategoryAxis(
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              series: <CartesianSeries<dynamic, dynamic>>[
                            ColumnSeries<GraphValues, String>(
                              // Bind data source
                              color: Color.fromARGB(255, 142, 247, 22),
                              dataSource: <GraphValues>[
                                GraphValues(data4_isbookmarks[0],
                                    double.parse(data4_prices[0])),
                                GraphValues(data4_isbookmarks[1],
                                    double.parse(data4_prices[1])),
                                GraphValues(data4_isbookmarks[2],
                                    double.parse(data4_prices[2])),
                                GraphValues(data4_isbookmarks[3],
                                    double.parse(data4_prices[3])),
                              ],
                              xValueMapper: (GraphValues data, _) =>
                                  data.X_ekseni,
                              yValueMapper: (GraphValues data, _) =>
                                  data.Y_ekseni,
                              dataLabelSettings: DataLabelSettings(
                                  isVisible: true, color: white),
                            )
                          ])),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Comparison of Cargoers",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: white),
                      ),
                      Container(
                          child: SfCartesianChart(
                              // Initialize category axis
                              primaryXAxis: CategoryAxis(
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              primaryYAxis: CategoryAxis(
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              series: <CartesianSeries<dynamic, dynamic>>[
                            ColumnSeries<GraphValues, String>(
                              // Bind data source
                              color: Color.fromARGB(255, 142, 247, 22),
                              dataSource: <GraphValues>[
                                GraphValues(data5_isbookmarks[0],
                                    double.parse(data5_prices[0])),
                                GraphValues(data5_isbookmarks[1],
                                    double.parse(data5_prices[1])),
                                GraphValues(data5_isbookmarks[2],
                                    double.parse(data5_prices[2])),
                                GraphValues(data5_isbookmarks[3],
                                    double.parse(data5_prices[3])),
                              ],
                              xValueMapper: (GraphValues data, _) =>
                                  data.X_ekseni,
                              yValueMapper: (GraphValues data, _) =>
                                  data.Y_ekseni,
                              dataLabelSettings: DataLabelSettings(
                                  isVisible: true, color: white),
                            )
                          ])),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Comparison of Markets",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: white),
                      ),
                      Container(
                          child: SfCartesianChart(
                              // Initialize category axis
                              primaryXAxis: CategoryAxis(
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              primaryYAxis: CategoryAxis(
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              series: <CartesianSeries<dynamic, dynamic>>[
                            ColumnSeries<GraphValues, String>(
                              // Bind data source
                              color: Color.fromARGB(255, 142, 247, 22),
                              dataSource: <GraphValues>[
                                GraphValues(data6_isbookmarks[0],
                                    double.parse(data6_prices[0])),
                                GraphValues(data6_isbookmarks[1],
                                    double.parse(data6_prices[1])),
                                GraphValues(data6_isbookmarks[2],
                                    double.parse(data6_prices[2])),
                                GraphValues(data6_isbookmarks[3],
                                    double.parse(data6_prices[3])),
                              ],
                              xValueMapper: (GraphValues sales, _) =>
                                  sales.X_ekseni,
                              yValueMapper: (GraphValues sales, _) =>
                                  sales.Y_ekseni,
                              dataLabelSettings: DataLabelSettings(
                                  isVisible: true, color: white),
                            )
                          ])),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Change of Average Price over Time",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: white),
                      ),
                      Container(
                          child: SfCartesianChart(
                              // Initialize category axis
                              primaryXAxis: CategoryAxis(
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              primaryYAxis: CategoryAxis(
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              series: <LineSeries<GraphValues, String>>[
                            LineSeries<GraphValues, String>(
                              // Bind data source
                              color: Colors.redAccent,

                              dataSource: <GraphValues>[
                                GraphValues(data7_isbookmarks[0],
                                    double.parse(data7_prices[0])),
                                GraphValues(data7_isbookmarks[1],
                                    double.parse(data7_prices[1])),
                                GraphValues(data7_isbookmarks[2],
                                    double.parse(data7_prices[2])),
                                GraphValues('Now', su_AnKi_Ort_market),
                              ],
                              xValueMapper: (GraphValues sales, _) =>
                                  sales.X_ekseni,
                              yValueMapper: (GraphValues sales, _) =>
                                  sales.Y_ekseni,
                              dataLabelSettings: DataLabelSettings(
                                  isVisible: true, color: white),
                            )
                          ])),
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Change from Producer to Consumer",
                        style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            color: white),
                      ),
                      Container(
                          child: SfCartesianChart(
                              // Initialize category axis
                              primaryXAxis: CategoryAxis(
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              primaryYAxis: CategoryAxis(
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                              series: <LineSeries<GraphValues, String>>[
                            LineSeries<GraphValues, String>(
                              // Bind data source
                              color: Colors.red,

                              dataSource: <GraphValues>[
                                GraphValues("producer", uretici_fiyat),
                                GraphValues("cargo", su_AnKi_Ort_kargo),
                                GraphValues("wholesaler", su_AnKi_Ort_toptanci),
                                GraphValues("Retail", su_AnKi_Ort_market),
                              ],
                              xValueMapper: (GraphValues sales, _) =>
                                  sales.X_ekseni,
                              yValueMapper: (GraphValues sales, _) =>
                                  sales.Y_ekseni,
                              dataLabelSettings: DataLabelSettings(
                                  isVisible: true, color: white),
                            )
                          ])),
                      SizedBox(
                        height: 40,
                      ),
                     
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
}

class GraphValues {
  GraphValues(this.X_ekseni, this.Y_ekseni);
  final String X_ekseni;
  final double Y_ekseni;
}
