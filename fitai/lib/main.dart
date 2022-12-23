import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banner Carrousel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'FitAI🏋🏽'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ///Base
          BannerCarousel(
            banners: BannerImages.listBanners,
            height: 200,
            onTap: (id) => print(id),
          ),
          /// Carousel Customized
          BannerCarousel(
            banners: BannerImages.listBanners,
            height: 200,
            customizedIndicators: const IndicatorModel.animation(
                width: 20, height: 5, spaceBetween: 2, widthAnimation: 50),
            activeColor: Colors.amberAccent,
            disableColor: Colors.blue,
            animation: true,
            borderRadius: 10,
            onTap: (id) => print(id),
            // width: 250
            indicatorBottom: false,
          ),

          /// Banner Customized Without Indicator
          const SizedBox(
            height: 20,
          )
        ],
      ),
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.stacked_line_chart),
            title: const Text("Performance"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text("Profile"),
            selectedColor: Colors.teal,
          ),
        ],
      ),
    );
  }
}

class BannerImages {
  static const String banner1 =
      "assets/push-up.gif";
  static const String banner2 =
      "assets/isometric-chest-squeeze.gif";
  static const String banner3 = "assets/tricep-dip.gif";
  static const String banner4 =
      "assets/bicycle-crunch.gif";

  static List<BannerModel> listBanners = [
    BannerModel(imagePath: banner1, id: "1"),
    BannerModel(imagePath: banner2, id: "2"),
    BannerModel(imagePath: banner3, id: "3"),
    BannerModel(imagePath: banner4, id: "4"),
  ];
}