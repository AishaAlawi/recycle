import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tsetrun/chart_data.dart';
import 'package:tsetrun/chart_model.dart';

class HomeScreen extends StatelessWidget {
  final List<ChartModel> data = [
    ChartModel(
      month: 'jan',
      number: 15,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    ),
    ChartModel(
      month: 'feb',
      number: 5,
      barColor: charts.ColorUtil.fromDartColor(Colors.black),
    ),
    ChartModel(
      month: 'mar',
      number: 40,
      barColor: charts.ColorUtil.fromDartColor(Colors.blue),
    ),
    ChartModel(
      month: 'april',
      number: 6,
      barColor: charts.ColorUtil.fromDartColor(Colors.orange),
    ),
    ChartModel(
      month: 'june',
      number: 4,
      barColor: charts.ColorUtil.fromDartColor(Colors.green),
    ),
    ChartModel(
      month: 'july',
      number: 2,
      barColor: charts.ColorUtil.fromDartColor(Colors.red),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: onNotification,
          icon: Icon(
            Icons.menu,
          ),
        ),
        centerTitle: true,
        title: Text('welcome user 1234'),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            onPressed: onNotification,
            icon: Icon(
              Icons.qr_code,
            ),
          ),
          IconButton(
            onPressed: onNotification,
            icon: Icon(
              Icons.more_vert,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
              width: double.infinity,
              child: Text('daily tips',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadiusDirectional.circular(5.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      ' space for daily tips',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          color: Colors.white,
                          onPressed: onNotification,
                          icon: Icon(
                            Icons.notifications_active,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: double.infinity,
                child: ChartData(
                  data: data,
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                width: double.infinity,
                child: Text('Recycling Progress',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    )),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                child: LinearPercentIndicator(
                  width: 180.0,
                  lineHeight: 20.0,
                  percent: 40 / 100,
                  animation: true,
                  progressColor: Colors.green,
                  alignment: MainAxisAlignment.center,
                  barRadius: Radius.circular(20),
                  leading: Text(
                    '0',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                  center: Text(
                    '40',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                  trailing: Text(
                    '100',
                    style:
                        TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(5.0),
                ),
                width: 200,
                child: MaterialButton(
                  color: Colors.green,
                  onPressed: () {},
                  child: Text(
                    'Exchange Points',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blueGrey,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.delete),
            label: 'recycle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'recycle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    );
  }

  void onNotification() {
    print('notification clicked');
  }
}
