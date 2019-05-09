import 'package:flutter_web/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text("Ecommerce App"),
          ),
          body: HomeScreen()),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> imageUrl;

  @override
  void initState() {
    super.initState();
    imageUrl = [
      "https://i.pinimg.com/originals/24/7a/0a/247a0a55e5e6aa0cb2215f375b85dc67.png",
      "https://i.pinimg.com/originals/24/7a/0a/247a0a55e5e6aa0cb2215f375b85dc67.png",
      "https://i.pinimg.com/originals/24/7a/0a/247a0a55e5e6aa0cb2215f375b85dc67.png",
      "https://i.pinimg.com/originals/24/7a/0a/247a0a55e5e6aa0cb2215f375b85dc67.png"
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            imageSlider(),
            SizedBox(
              height: 10,
            ),
            topDealsSection(),
            SizedBox(
              height: 10,
            ),
            topDealsSection(),
            SizedBox(
              height: 10,
            ),
            topDealsSection()
          ],
        ),
      ),
    );
  }

  Widget imageSlider() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: imageSliderList(imageUrl),
      ),
    );
  }

  List<Widget> imageSliderList(List<String> imageUrl) {
    return imageUrl.map((i) {
      return Builder(builder: (BuildContext context) {
        return imageSliderItem(i);
      });
    }).toList();
  }

  Widget imageSliderItem(String url) {
    return Card(
      color: Color(0X000000),
      child: Container(
          width: MediaQuery.of(context).size.width / 2,
          padding: EdgeInsets.all(5.0),
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: FutureBuilder(
            builder: (BuildContext context, AsyncSnapshot snapshot) =>
                Image.network(
                  url,
                  fit: BoxFit.fitHeight,
                ),
          )),
    );
  }

  Widget topDealsSection() {
    return Container(
      color: Colors.blue,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  "Deals of the Day",
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 10.0),
                  child: RaisedButton(
                    disabledColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: null,
                    color: Colors.white,
                    child: Text(
                      "View All",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            height: 5,
          ),
          dealsGrid(),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Widget dealsGrid() {
    return Card(
      margin: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        child: GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            dealsItem(),
            dealsItem(),
            dealsItem(),
            dealsItem(),
          ],
        ),
      ),
    );
  }

  Widget dealsItem() {
    return GestureDetector(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.network(
            "https://i.pinimg.com/originals/24/7a/0a/247a0a55e5e6aa0cb2215f375b85dc67.png",
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 2.5,
          ),
          Text(
            "Nike Shoes",
            style: TextStyle(color: Colors.black),
          ),
          Text(
            "Rs 5000",
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
