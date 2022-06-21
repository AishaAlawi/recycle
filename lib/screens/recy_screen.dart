import 'package:flutter/material.dart';
import 'package:tsetrun/screens/pick-up.dart';
import 'package:tsetrun/screens/qr_scan.dart';
import 'package:url_launcher/url_launcher.dart';
import 'home_screen.dart';
import 'map_screen.dart';

class RecyScreen extends StatefulWidget {
  const RecyScreen({Key? key}) : super(key: key);

  @override
  State<RecyScreen> createState() => _RecyScreenState();
}

class _RecyScreenState extends State<RecyScreen> with TickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Recycle'),
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
        backgroundColor: Colors.green,
        bottom: TabBar(
          controller: tabController,
          tabs: [
            Tab(
              text: 'Electronics',
            ),
            Tab(
              text: 'paper',
            ),
            Tab(
              text: 'plastic',
            ),
            Tab(
              text: 'glass',
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: TabBarView(
          controller: tabController,
          children: [
            Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          const url =
                              'https://www.consumerreports.org/recycling/how-to-recycle-electronics-a7432818850/#:~:text=1.,ZIP%20code%20at%20Call2Recycle.org.';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 180.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: const Text(
                            'How to\nrecycle\nelectronics',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapScreen()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 180.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: const Text(
                            'Nearest\nrecycling\nstation',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      const url =
                          'https://www.who.int/news/item/15-06-2021-soaring-e-waste-affects-the-health-of-millions-of-children-who-warns#:~:text=Other%20adverse%20child%20health%20impacts,as%20cancer%20and%20cardiovascular%20disease.';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      width: double.infinity,
                      child: Stack(
                        children: [
                          const Image(
                            width: double.infinity,
                            image: NetworkImage(
                                'https://thumbs.dreamstime.com/b/many-used-modern-electronic-gadgets-use-white-floor-reuse-recycle-concept-top-view-153892434.jpg'),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topCenter,
                              width: double.infinity,
                              color: Colors.green.withOpacity(.5),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 90.0),
                              child: const Text(
                                'E-waste impact',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          const url =
                              'https://earth911.com/home-garden/recycle-your-own-paper/';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 180.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: const Text(
                            'How to\nrecycle\npaper',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapScreen()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 180.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: const Text(
                            'Nearest\nrecycling\nstation',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      const url =
                          'https://www.theworldcounts.com/stories/paper-waste-facts';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      width: double.infinity,
                      child: Stack(
                        children: [
                          const Image(
                            width: double.infinity,
                            image: NetworkImage(
                                'https://industryeurope.com/downloads/4580/download/1357858_ANN-Paper-pic.jpg?cb=eb31a243f7388910bf6cec3134e459a3'),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topCenter,
                              width: double.infinity,
                              color: Colors.green.withOpacity(.5),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 90.0),
                              child: const Text(
                                'Paper waste impact',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          const url =
                              'https://www.nswai.org/docs/plastic_recycling_2009.pdf';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 180.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: const Text(
                            'How to\nrecycle\nplastic',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapScreen()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 180.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: const Text(
                            'Nearest\nrecycling\nstation',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      const url = 'https://humanjourney.us/our-plastic-earth/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      width: double.infinity,
                      child: Stack(
                        children: [
                          const Image(
                            width: double.infinity,
                            image: NetworkImage(
                                'https://www.azocleantech.com/images/Article_Images/ImageForArticle_913(1).jpg'),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topCenter,
                              width: double.infinity,
                              color: Colors.green.withOpacity(.5),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 90.0),
                              child: const Text(
                                'Plastic waste impact',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () async {
                          const url =
                              'https://earth911.com/recycling-guide/how-to-recycle-glass/';
                          if (await canLaunch(url)) {
                            await launch(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 180.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: const Text(
                            'How to\nrecycle\nglass',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MapScreen()),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 180.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: const Text(
                            'Nearest\nrecycling\nstation',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      const url =
                          'https://www.forgerecycling.co.uk/blog/is-glass-harmful-to-the-environment/';
                      if (await canLaunch(url)) {
                        await launch(url);
                      } else {
                        throw 'Could not launch $url';
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      width: double.infinity,
                      child: Stack(
                        children: [
                          const Image(
                            width: double.infinity,
                            image: NetworkImage(
                                'https://climateaction.africa/wp-content/uploads/2021/09/recycling-glass.jpg'),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topCenter,
                              width: double.infinity,
                              color: Colors.green.withOpacity(.5),
                              padding:
                                  const EdgeInsets.symmetric(vertical: 90.0),
                              child: const Text(
                                'Glass waste impact',
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 20.0, color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
