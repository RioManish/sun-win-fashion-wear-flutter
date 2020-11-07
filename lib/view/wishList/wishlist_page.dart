import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sunwinfashionwear/theme/styles.dart';
import 'package:sunwinfashionwear/utils/constants.dart';

class MyWishListPage extends StatelessWidget {
  MyWishListPage();

  @override
  Widget build(BuildContext context) {
    return _MyWishListPage();
  }
}

class _MyWishListPage extends StatefulWidget {
  // final FirebaseAnalytics analytics;
  // final FirebaseAnalyticsObserver observer;

  _MyWishListPage();

  @override
  State<StatefulWidget> createState() => __MyWishListPageState(
      // analytics, observer
      );
}

class __MyWishListPageState extends State<_MyWishListPage> {
  bool isLike = true;
  __MyWishListPageState();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    print(height);
    print(width);

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height + 5.0),
            child: appBar()),
            bottomNavigationBar: addToCartButton(height, width),
        body: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 10.0,
            padding: EdgeInsets.all(8.0),
            childAspectRatio: 7.5 / 10.0,
            children: List.generate(50, (index) {
              return wishItemCard(height, width);
            })));
  }

  Widget addToCartButton(height, width) {
    return Container(
      height: height * 0.06,
      margin: const EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 5.0),
      decoration: BoxDecoration(
        color: greenColor,
       // borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))
       borderRadius: BorderRadius.circular(5.0)
      ),
      child: Center(
        child: Text(addToCart, style: addToCartButtonStyle,),
      ),
    );
  }

  Widget wishItemCard(height, width) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 8.0, 5.0),
      child: Card(
        semanticContainer: false,
        borderOnForeground: false,
        margin: EdgeInsets.all(0.0),
        elevation: 1.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AspectRatio(
              aspectRatio: 0.9,
              child: CachedNetworkImage(
                imageUrl:
                    "https://image.freepik.com/free-photo/young-girl-pointing-up-yellow-background_23-2148168289.jpg",
                imageBuilder: (context, imageProvider) => Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: imageProvider,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                        onTap: () {
                          if (isLike) {
                            isLike = false;
                          } else {
                            isLike = true;
                          }

                          setState(() {});
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10.0),
                          padding: const EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Image.asset(
                            like_img,
                            height: 10,
                            width: 10,
                            color: isLike ? themeColor : blackColor,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                placeholder: (context, url) =>
                    Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 2.0),
              child: Text(cartDescription,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: wishItemTitle),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 5.0, right: 5.0, bottom: 2.0),
              child: Row(
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
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Image.asset(
                      mycart_img,
                      height: 12,
                      width: 12,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget appBar() {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
              icon: Icon(Icons.keyboard_arrow_left),
              onPressed: () {
                Navigator.pop(context);
              })),
      title: Text(
        myWishList,
        style: appBarTitleTextStyle,
      ),
      centerTitle: true,
    );
  }
}
