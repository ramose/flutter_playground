import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget _homeTopSlider() {
      return Container(
        padding: EdgeInsets.only(top: 10, bottom: 10),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Card(
                  margin: EdgeInsets.all(5),
                  elevation: 5,
                  borderOnForeground: true,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Column(
                      children: <Widget>[
                        Image.asset(
                          'assets/images/scene1.png',
                          height: 80,
                          width: 150,
                        ),
                        Text(
                          'Lorem Ipsum',
                          style: Theme.of(context).textTheme.caption,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Container(
              height: 150,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, pos) {
                    return _homeTopSlider();
                  }),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Container(height: 150, color: Colors.green),
              Container(height: 100, color: Colors.blue),
              Container(height: 200, color: Colors.yellow),
            ]),
          ),
        ],
      )),
    );
  }
}

class HomeTopArea extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10, bottom: 10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(5),
                elevation: 5,
                borderOnForeground: true,
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        'assets/images/scene1.png',
                        height: 80,
                        width: 150,
                      ),
                      Text(
                        'Lorem Ipsum',
                        style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
