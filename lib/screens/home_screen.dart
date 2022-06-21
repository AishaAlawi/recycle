import 'package:charts_flutter/flutter.dart' as charts;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:tsetrun/screens/pick-up.dart';
import 'package:tsetrun/screens/qr_scan.dart';
import 'package:tsetrun/screens/recy_screen.dart';
import '../chart_data.dart';
import '../chart_model.dart';
import 'login_page.dart';
import 'map_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var list = [
    'Grocery bags dissolve into potentially harmful microplastics and, in the case of ingestion or entanglement, hurt and kill animals.',
    'Don’t recycle anything smaller than a credit card. That includes straws, bottle caps, coffee pods, plastic cutlery, paperclips, and a million other tiny things that creep into our daily lives. ',
    'Food waste contaminates whole loads of recyclable material, rendering them useless and fast-tracking them to landfills. ',
    'Recycling only works when like materials are together. Unfortunately, items like plastic-coated coffee cups, laminated paper and paper-bubble wrap envelopes from the mail can’t ever be separated, which means they’re trash.',
    'Not all plastics are treated equally. Rigid plastics are recyclable, labeled by resin codes 1 through 7. Generally, the higher the number, the less recyclable it is.',
  ];

  int _pageIndex = 1;

  final pages = [HomeScreen(), MapScreen(), RecyScreen()];

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Recycle',
      style: optionStyle,
    ),
    Text(
      'Index 1: Home',
      style: optionStyle,
    ),
    Text(
      'Index 2: Map',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _pageIndex = index;
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RecyScreen()),
        );
      } else {
        if (index == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MapScreen()),
          );
        }
      }
    });
  }

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
    var randomItem = (list.toList()..shuffle()).first;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut().then(
                  (value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ),
                  ),
                );
          },
          icon: Icon(
            Icons.account_circle,
          ),
        ),
        title: Text('Welcome Back!!'),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const QRScanPage()),
              );
            },
            icon: Icon(
              Icons.qr_code,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const pickUp()),
              );
            },
            icon: Icon(
              Icons.calendar_month,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
              width: double.infinity,
              child: Text('daily tips',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Flexible(
              child: Expanded(
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          ' ${randomItem}',
                          style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Spacer(),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ChartData(
                    data: data,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 0,
              child: Container(
                width: double.infinity,
                child: Text('Recycling Progress',
                    style: TextStyle(
                      fontSize: 16.0,
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
                  borderRadius: BorderRadiusDirectional.circular(20.0),
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
        backgroundColor: Colors.green,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.recycling),
            label: 'recycle',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Maps',
          ),
        ],
        currentIndex: _pageIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void onNotification() {
    print('notification clicked');
  }
}
