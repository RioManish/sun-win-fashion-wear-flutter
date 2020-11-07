import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:sunwinfashionwear/theme/styles.dart';
import 'package:sunwinfashionwear/utils/constants.dart';

class HomePage extends StatelessWidget {
  HomePage();

  @override
  Widget build(BuildContext context) {
    return _HomePage();
  }
}

class _HomePage extends StatefulWidget {
  // final FirebaseAnalytics analytics;
  // final FirebaseAnalyticsObserver observer;

  _HomePage();

  @override
  State<StatefulWidget> createState() => _HomePageState(
      // analytics, observer
      );
}

class _HomePageState extends State<_HomePage> {
  final List<String> imageList = [
    'https://image.freepik.com/free-photo/happy-asian-pretty-girl-holding-shopping-orange-bags-looking-away-yellow-background-colorful-shopping-concept_35721-177.jpg',
    'https://image.freepik.com/free-photo/beautiful-young-woman-with-shopping-bags-using-her-smart-phone-yellow-background_50889-43.jpg',
    'https://image.freepik.com/free-photo/happy-shopping-woman-yellow-background_33799-4555.jpg',
    'https://thumbs.dreamstime.com/b/shopping-concept-young-woman-holding-credit-card-shopper-bags-yellow-studio-background-free-space-happy-girl-157482973.jpg',
    'https://previews.123rf.com/images/racorn/racorn1403/racorn140300142/26571883-beautiful-young-african-american-woman-reading-a-book-lying-comfortably-on-her-back-on-a-couch-in-th.jpg',
    'https://footage.framepool.com/shotimg/qf/794833937-bravo-magazine-cassette-record-vinyl-16-17-years.jpg',
    'https://previews.123rf.com/images/bogdanbrasoveanu/bogdanbrasoveanu1510/bogdanbrasoveanu151000233/46388983-handsome-man-casual-dressed-celebrating-and-jumping-on-yellow-background.jpg',
    'https://image.freepik.com/free-photo/girl-dressed-thickly-yellow-background_23-2148333111.jpg',
    'https://image.freepik.com/free-photo/portrait-lovely-smiling-girl-pointing-two-fingers-up_171337-4728.jpg',
    'https://img.freepik.com/fotos-gratis/jovem-mulher-no-fundo-amarelo-sorrindo-e-mostrando-sinal-de-vitoria-com-as-duas-maos_1368-33814.jpg?size=626&ext=jpg'
  ];

  _HomePageState();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CarousalSlider(height, width),
          TitleWidget(height, width, trending),
          TrendingWidget(height, width),
          TitleWidget(height, width, newArrival),
          TrendingWidget(height, width),
        ],
      ),
    ));
  }

  Widget CarousalSlider(height, width) {
    return Container(
        child: CarouselSlider.builder(
      options: CarouselOptions(
          aspectRatio: 16 / 9,
          height: height / 3.5,
          enlargeCenterPage: true,
          viewportFraction: 1.0,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          scrollDirection: Axis.horizontal,
          autoPlay: true),
      itemCount: (imageList.length),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: imageList[index],
              imageBuilder: (context, imageProvider) => Container(
                width: width / 1.1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            // child: Image.network(imageList[index],
            //     fit: BoxFit.cover, width: width / 1.2),
          ),
        );
      },
    ));
  }

  Widget TrendingWidget(height, width) {
    return SizedBox(
      height: height / 3.5,
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) => Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 8.0),
          child: Card(
              child: Container(
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
            child: CachedNetworkImage(
              imageUrl:
                  "https://previews.123rf.com/images/mangostar/mangostar1705/mangostar170500442/77905924-happy-pretty-black-girl-walking-with-shopping-bags.jpg",
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage( 
                    image: imageProvider,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              placeholder: (context, url) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            //  child: Image.network('https://www.vhv.rs/dpng/d/528-5281513_alicia-silverstone-clueless-png-download-clueless-outfits-transparent.png', fit: BoxFit.cover,),
            width: width / 3,
          )),
        ),
      ),
    );
  }

  Widget TitleWidget(height, width, title) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        children: [
          Text(title, style: trendingTitleStyle),
          Spacer(),
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: themeColor,
                  )),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 3.0, bottom: 3.0),
                child: Text(
                  viewAll,
                  style: viewAllTextStyle,
                ),
              ))
        ],
      ),
    );
  }
}
