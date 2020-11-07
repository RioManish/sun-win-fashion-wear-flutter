import 'package:flutter/material.dart';
import 'package:sunwinfashionwear/theme/styles.dart';

// ignore: must_be_immutable
class DefaultScaffold extends StatefulWidget {
  String title;
  Widget body;
  int index;
  Key key;
  bool isTrailing;
  bool isBackgroundColor;

  DefaultScaffold(this.key, this.title, this.body, this.index, this.isTrailing, this.isBackgroundColor)
      : super(key: key);

  @override
  _DefaultScaffoldState createState() => _DefaultScaffoldState();
}

class _DefaultScaffoldState extends State<DefaultScaffold>
    with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return Container(
      color: themeColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: widget.isBackgroundColor ? themeColorLight : whiteColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(AppBar().preferredSize.height + 5.0),
            child: AppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(20),
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  padding: EdgeInsets.all(1.0),
                  decoration: BoxDecoration(
                      color: whiteColor,
                      borderRadius: BorderRadius.circular(20.0)),
                  child: CircleAvatar(
                      radius: 20,
                      backgroundImage: NetworkImage(
                          'https://cdn.vox-cdn.com/thumbor/wI3iu8sNbFJSQB4yMLsoPMNzIHU=/0x0:3368x3368/1200x800/filters:focal(1188x715:1726x1253)/cdn.vox-cdn.com/uploads/chorus_image/image/62994726/AJ_Finn_author_photo_color_photo_courtesy_of_the_author.0.jpg')),
                ),
              ),
              title: Text(
                widget.title,
                style: appBarTitleTextStyle,
              ),
              centerTitle: true,
              actions: [
                widget.isTrailing
                    ? IconButton(icon: Icon(Icons.search), onPressed: () {})
                    : Text(""),
              ],
            ),
          ),
          body: Container(
            child: widget.body,
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
