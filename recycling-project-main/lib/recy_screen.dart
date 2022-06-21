import 'dart:ffi';

import 'package:flutter/material.dart';

class RecyScreen extends StatefulWidget {
  @override
  State<RecyScreen> createState() => _RecyScreenState();
}

class _RecyScreenState extends State<RecyScreen> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 4, vsync: this);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Recycle'),
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
                        onTap: () {
                          print('container clicked');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 160.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Text(
                            'How to\nrecycle\nelectronics',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          print('container clicked');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 160.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Text(
                            'Nearest\nrecycling\nstation',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Image(
                            width: double.infinity,
                            image: NetworkImage(
                                'https://thumbs.dreamstime.com/b/many-used-modern-electronic-gadgets-use-white-floor-reuse-recycle-concept-top-view-153892434.jpg'),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topCenter,
                              width: double.infinity,
                              color: Colors.green.withOpacity(.5),
                              padding: EdgeInsets.symmetric(vertical: 90.0),
                              child: Text(
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
                        onTap: () {
                          print('container clicked');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 160.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Text(
                            'How to\nrecycle\npaper',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          print('container clicked');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 160.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Text(
                            'Nearest\nrecycling\nstation',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Image(
                            width: double.infinity,
                            image: NetworkImage(
                                'https://industryeurope.com/downloads/4580/download/1357858_ANN-Paper-pic.jpg?cb=eb31a243f7388910bf6cec3134e459a3'),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topCenter,
                              width: double.infinity,
                              color: Colors.green.withOpacity(.5),
                              padding: EdgeInsets.symmetric(vertical: 90.0),
                              child: Text(
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
                        onTap: () {
                          print('container clicked');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 160.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Text(
                            'How to\nrecycle\nplastic',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          print('container clicked');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 160.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Text(
                            'Nearest\nrecycling\nstation',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Image(
                            width: double.infinity,
                            image: NetworkImage(
                                'https://www.azocleantech.com/images/Article_Images/ImageForArticle_913(1).jpg'),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topCenter,
                              width: double.infinity,
                              color: Colors.green.withOpacity(.5),
                              padding: EdgeInsets.symmetric(vertical: 90.0),
                              child: Text(
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
                        onTap: () {
                          print('container clicked');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 160.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Text(
                            'How to\nrecycle\nglass',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ),
                      ),
                      Spacer(),
                      InkWell(
                        onTap: () {
                          print('container clicked');
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: 160.0,
                          height: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(5.0)),
                          child: Text(
                            'Nearest\nrecycling\nstation',
                            style:
                                TextStyle(fontSize: 25.0, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0)),
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Image(
                            width: double.infinity,
                            image: NetworkImage(
                                'https://climateaction.africa/wp-content/uploads/2021/09/recycling-glass.jpg'),
                          ),
                          Expanded(
                            child: Container(
                              alignment: Alignment.topCenter,
                              width: double.infinity,
                              color: Colors.green.withOpacity(.5),
                              padding: EdgeInsets.symmetric(vertical: 90.0),
                              child: Text(
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
    );
  }
}
