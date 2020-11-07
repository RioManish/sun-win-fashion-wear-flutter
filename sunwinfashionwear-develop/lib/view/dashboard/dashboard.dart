
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunwinfashionwear/common_widgets/Dashboard/default_scaffold.dart';
import 'package:sunwinfashionwear/theme/styles.dart';
import 'package:sunwinfashionwear/utils/constants.dart';
import 'package:sunwinfashionwear/view/categories/categories.dart';
import 'package:sunwinfashionwear/view/home/home_page.dart';
import 'package:sunwinfashionwear/view/myAccount/account.dart';
import 'package:sunwinfashionwear/view/myCart/mycart.dart';


// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  int selectedIndex;

  Dashboard({this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: [
    //     // BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
    //     // BlocProvider<CustomAppBarBloc>(
    //     //     create: (context) =>
    //     //         CustomAppBarBloc()..add(GetNotificationBadgeStatus())),
    //   ],
    //   child: 
     return _Dashboard(
        selectedIndex: this.selectedIndex,
      );
   // );
  }
}

// ignore: must_be_immutable
class _Dashboard extends StatefulWidget {
  int selectedIndex;

  _Dashboard({this.selectedIndex});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _DashboardPage();
  }
}

class _DashboardPage extends State<_Dashboard> with TickerProviderStateMixin {
  int selectedIndex = 0;
  final PageStorageBucket bucket = PageStorageBucket();
  bool itemselect = true;
  double statusBarHeight = 0;
  final List<Widget> pages = [
    DefaultScaffold(
      PageStorageKey(home),
      home,
      HomePage(),
      0,
      false,
      false
    ),
    DefaultScaffold(PageStorageKey(categories), categories, CategoriesPage(), 1, true, false),
    DefaultScaffold(PageStorageKey(myCart), myCart, MyCartPage(), 2, false, true),
    DefaultScaffold(PageStorageKey(account), account, MyAccountPage(), 3, false, false),
  ];
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    if (widget.selectedIndex != null && widget.selectedIndex > 0) {
      selectedIndex = widget.selectedIndex;
      SchedulerBinding.instance.addPostFrameCallback((_) => {_onItemTapped(2)});
    }
  }

  void _onItemTapped(int index) {
    //this is to reset the event chiose chip selection
   // Constants.eventsCurrentSelectedChoiseChip = 0;

    pageController.jumpToPage(index);
    selectedIndex = index;
    itemselect = false;
    setState(() {
      
    });
  }

  // ignore: missing_return
  // Map<String, String> prepareSilentNotification(int type) {
  //   switch (type) {
  //     case 0:
  //       {
  //         if (SPUtil.getBool(Constants.LANGUAGE_CHANGE_REFRESH_HOME)) {
  //           return {
  //             Constants.NOTIFICATION_KEY: Constants.LANGUAGE_CHANGE_REFRESH_HOME
  //           };
  //         }
  //       }
  //       break;

  //     case 1:
  //       {
  //         if (SPUtil.getBool(Constants.LANGUAGE_CHANGE_REFRESH_EVENT)) {
  //           return {
  //             Constants.NOTIFICATION_KEY:
  //                 Constants.LANGUAGE_CHANGE_REFRESH_EVENT
  //           };
  //         }
  //       }
  //       break;
  //     case 2:
  //       {
  //         if (SPUtil.getBool(Constants.LANGUAGE_CHANGE_REFRESH_SURVEY)) {
  //           return {
  //             Constants.NOTIFICATION_KEY:
  //                 Constants.LANGUAGE_CHANGE_REFRESH_SURVEY
  //           };
  //         }
  //       }
  //       break;

  //     default:
  //       {
  //         return {Constants.NOTIFICATION_KEY: 'empty'};
  //       }
  //       break;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).padding.top;
    //SPUtil.putDouble(Constants.STATUSBAR_HEIGHT, statusBarHeight);

    Future<void> _onPageChanged(int index) async {
      // BlocProvider.of<CustomAppBarBloc>(context)
      //   ..add(GetNotificationBadgeStatus());

      // setState(() {
      //   SilentNotificationHandler silentNotificationHandler =
      //       SilentNotificationHandler.instance;
      //   silentNotificationHandler.updateData(prepareSilentNotification(index));
      // });
    }

    return Scaffold(
      bottomNavigationBar: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          boxShadow: <BoxShadow>[
            BoxShadow(color: Colors.black12, spreadRadius: 5, blurRadius: 1)
          ],
        ),
        child: DefaultTabController(
          initialIndex: selectedIndex,
          length: 4,
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Container(
              // height: 50,
              padding: EdgeInsets.only(left: 5, right: 5),
              //padding: EdgeInsets.only(top: 0,bottom: 0,left: 5,right: 5),
              child: TabBar(
                labelPadding: EdgeInsets.only(right: 10, left: 10),
                indicator: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.elliptical(50, 50),
                        topRight: Radius.elliptical(50, 50),
                        bottomLeft: Radius.elliptical(50, 50),
                        bottomRight: Radius.elliptical(50, 50)),
                    color: Color.fromRGBO(239, 243, 248, 1)),
                onTap: _onItemTapped,
                tabs: [
                  Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        selectedIndex == 0
                            ? Image.asset(home_selected_img,
                                color: themeColor)
                            : Image.asset(home_img,
                                color: tabBarUnselectedColor),
                             Container(
                            child: new Text(home,
                              textAlign: TextAlign.center,
                              style: selectedIndex == 0 ? navigationBarTitle : navigationBarTitleUnselected
                            ),
                              )
                      ],
                    ),
                  ),
                     Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        selectedIndex == 1
                            ? Image.asset(categories_selected_img,
                                color: themeColor)
                            : Image.asset(categories_img,
                                color: tabBarUnselectedColor),
                             Container(
                            child: new Text(categories,
                              textAlign: TextAlign.center,
                              style: selectedIndex == 1 ? navigationBarTitle : navigationBarTitleUnselected
                            ),
                              )
                      ],
                    ),
                  ),
                     Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        selectedIndex == 2
                            ? Image.asset(mycart_selected_img,
                                color: themeColor)
                            : Image.asset(mycart_img,
                                color: tabBarUnselectedColor),
                             Container(
                            child: new Text(myCart,
                              textAlign: TextAlign.center,
                              style: selectedIndex == 2 ? navigationBarTitle : navigationBarTitleUnselected
                            ),
                              )
                      ],
                    ),
                  ),
                     Tab(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        selectedIndex == 3
                            ? Image.asset(account_img,
                                color: themeColor)
                            : Image.asset(account_img,
                                color: tabBarUnselectedColor),
                             Container(
                            child: new Text(account,
                              textAlign: TextAlign.center,
                              style: selectedIndex == 3 ? navigationBarTitle : navigationBarTitleUnselected
                            ),
                              )
                      ],
                    ),
                  ),
                  // Tab(
                  //   child: Column(
                  //    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: <Widget>[
                  //       selectedIndex == 1
                  //           ? Padding(
                  //               padding: EdgeInsets.only(top: 5),
                  //               child: new Icon(Icons.category,
                  //                   color: themeColor),
                  //             )
                  //           : Padding(
                  //               padding: EdgeInsets.only(top: 0),
                  //               child: new Icon(Icons.category,
                  //                   color: tabBarUnselectedColor),
                  //             ),
                  //            Container(
                  //             padding: EdgeInsets.only(top: 0),
                  //             child: new Text(categories,
                  //                 textAlign: TextAlign.center,
                  //                 style: navigationBarTitle),
                  //           )
                  //     ],
                  //   ),
                  // ),
                  // Tab(
                  //   child: Column(
                  //    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: <Widget>[
                  //       selectedIndex == 2
                  //           ? new Icon(
                  //               Icons.shopping_cart,
                  //               color: themeColor,
                  //               size: 25,
                  //             )
                  //           : new Icon(
                  //               Icons.shopping_cart,
                  //               color: tabBarUnselectedColor,
                  //               size: 25,
                  //             ),
                  //            Container(
                  //           padding: EdgeInsets.only(top: 6),
                  //           child: new Text(
                  //             "My Cart",
                  //             textAlign: TextAlign.center,
                  //             style: navigationBarTitle
                  //           ),
                  //             )
                  //     ],
                  //   ),
                  // ),
                  // Tab(
                  //   child: Column(
                  //   //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: <Widget>[
                  //       selectedIndex == 3
                  //           ? new Icon(
                  //               Icons.account_circle,
                  //               color: themeColor,
                  //               size: 25,
                  //             )
                  //           : new Icon(
                  //               Icons.account_circle,
                  //               color: tabBarUnselectedColor,
                  //               size: 25,
                  //             ),
                  //            Container(
                  //           padding: EdgeInsets.only(top: 6),
                  //           child: new Text(
                  //               account,
                  //               textAlign: TextAlign.center,
                  //               style: navigationBarTitle),
                  //             )
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        onPageChanged: _onPageChanged,
        children: pages,
        physics: NeverScrollableScrollPhysics(),
      ),
    );
  }
}
