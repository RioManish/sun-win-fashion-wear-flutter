import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sunwinfashionwear/theme/styles.dart';
import 'package:sunwinfashionwear/utils/constants.dart';
import 'package:sunwinfashionwear/view/myCart/custmListTile.dart' as prefix0;


class MyCartPage extends StatelessWidget {
  MyCartPage();

  @override
  Widget build(BuildContext context) {
    return _MyCartPage();
  }
}

class _MyCartPage extends StatefulWidget {
  // final FirebaseAnalytics analytics;
  // final FirebaseAnalyticsObserver observer;

  _MyCartPage();

  @override
  State<StatefulWidget> createState() => _MyCartPageState(
      // analytics, observer
      );
}

class _MyCartPageState extends State<_MyCartPage> {
  List<String> litems = ["1", "2", "Third", "4"];

  _MyCartPageState();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
            height: height * 0.05,
            width: width,
            color: themeColorLight,
            child: Center(child: Text("5 items Added!"))),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: litems.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return Card(
      elevation: 0,
    //  shape: RoundedRectangleBorder(
        // side: BorderSide(
        //   width: 0.1,color: blackColor
        // ),
       //   borderRadius: BorderRadius.all(Radius.circular(5))
      // ),
      child: Container(
          padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
          height: 150.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
                  child: prefix0.ListTile(
                    dense: false,
                    leading: Container(
                      width: width * 0.4,
                      height: 150,
                     // child: CartImage(height, width),
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                              child: Container(
                          margin: const EdgeInsets.all(2.0),
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: lightGreyColor,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Icon(Icons.remove, size: 10),
                        ),
                            ),
                            CartImage(height, width)
                        ],
                      ),
                    ),
                    title: CartDescription(index),
                  ),
                  )
                  );
              }),
        )
      ],
    ));
  }

  Widget CartDescription(index) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5.0, 5.0, 10.0, 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 0.0, right: 5.0),
            child: Text(cartDescription,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                style: cartTitleStyle),
          ),
          RichText(
              text: TextSpan(children: [
            TextSpan(text: "$color : ", style: cartStyle),
            TextSpan(text: "Pink", style: navigationBarTitleUnselected)
          ])),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: "$size : ", style: cartStyle),
                TextSpan(text: "XL", style: navigationBarTitleUnselected)
              ])),
              Spacer(),
              Align(
                alignment: Alignment.topRight,
                child: Text("In Progress"),
              )
            ],
          ),
          Row(
            children: [
              Text(
                "₹ 999",
                style: wishItemPriceStyle,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "₹ 1099",
                  style: wishItemPriceOfferStrikedStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text("30% off", style: wishItemPriceOfferStyle),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                child: Row(
                  children: [
                    Container(
                          margin: const EdgeInsets.all(2.0),
                          padding: const EdgeInsets.all(5.0),
                          height: 10,
                            width: 10,
                          decoration: BoxDecoration(
                              color: index / 2 == 0 ? greenColor : redColor,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Text("")
                        ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: index / 2 == 0 ? Text(inStock, style: inStockTextStyle,) : Text(outOfStock, style: outOfStockTextStyle,),
                    ),
                  ],
                )
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget CartImage(height, width) {
    print(height.toString());

    return CachedNetworkImage(
      // height: height * height,
      width: width * 0.3,
      height: height,
      imageUrl:
          "https://www.62a.net/tbimg/img/tfscom/i4/96165975/TB2Z.LKXBzkJKJjSspiXXXd4XXa-96165975.jpg",
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
          ),
        ),
      ),
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
