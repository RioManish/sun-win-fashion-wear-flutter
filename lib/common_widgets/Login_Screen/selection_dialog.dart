import 'package:flutter/material.dart';
import 'package:sunwinfashionwear/common_widgets/Login_Screen/custom_country_code_list.dart';
import 'package:sunwinfashionwear/common_widgets/Login_Screen/flutter_masked_text.dart';
import 'package:sunwinfashionwear/theme/styles.dart';
import 'package:sunwinfashionwear/utils/constants.dart';


/// selection dialog used for selection of the country code
class SelectionDialog extends StatefulWidget {
  final List<CountryCode> elements;
  final bool showCountryOnly;
  final InputDecoration searchDecoration;
  final TextStyle searchStyle;
  final WidgetBuilder emptySearchBuilder;
  final bool showFlag;

  /// elements passed as favorite
  final List<CountryCode> favoriteElements;

  SelectionDialog(this.elements, this.favoriteElements,
      {Key key,
      this.showCountryOnly,
      this.emptySearchBuilder,
      InputDecoration searchDecoration = const InputDecoration(),
      this.searchStyle,
      this.showFlag})
      : assert(searchDecoration != null, 'searchDecoration must not be null!'),
        this.searchDecoration =
            searchDecoration.copyWith(prefixIcon: Icon(Icons.search)),
        super(key: key);

  @override
  State<StatefulWidget> createState() => _SelectionDialogState();
}

class _SelectionDialogState extends State<SelectionDialog> {
  /// this is useful for filtering purpose
  List<CountryCode> filteredElements;
  MaskedTextController searchController =
      new MaskedTextController(mask: maskEngValidationStr);

  @override
  Widget build(BuildContext context) {


    return SimpleDialog(
      title: Column(
        children: <Widget>[
          TextField(
            controller: searchController,
            style: widget.searchStyle,
            decoration: widget.searchDecoration,
            onChanged: _filterElements,
          ),
        ],
      ),
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: filteredElements.length == 0
                ? 35.0
                : filteredElements.length * 35.0 >
                        MediaQuery.of(context).size.height -
                            (MediaQuery.of(context).size.height / 3.3)
                    ? MediaQuery.of(context).size.height -
                        (MediaQuery.of(context).size.height / 3.3)
                    : filteredElements.length * 35.0,
            //  MediaQuery.of(context).size.height -
            //         (MediaQuery.of(context).size.height / 3.3),
            child: ListView(
                children: [
              widget.favoriteElements.isEmpty
                  ? const DecoratedBox(decoration: BoxDecoration())
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[]
                        ..addAll(widget.favoriteElements
                            .map(
                              (f) => SimpleDialogOption(
                                child: _buildOption(f),
                                onPressed: () {
                                  _selectItem(f);
                                },
                              ),
                            )
                            .toList())
                        ..add(const Divider())),
            ]..addAll(filteredElements.isEmpty
                    ? [_buildEmptySearchWidget(context)]
                    : filteredElements.map((e) => SimpleDialogOption(
                          key: Key(e.toLongString()),
                          child: _buildOption(e),
                          onPressed: () {
                            _selectItem(e);
                          },
                        ))))),
      ],
    );
  }

  Widget _buildOption(CountryCode e) {
    return Container(
      width: 400,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
              flex: 4,
              child: RichText(
                text: TextSpan(
                  // text: 'Hello ',
                  // style: DefaultTextStyle.of(context).style,
                  style: new TextStyle(
                    fontSize: 10.0,
                    fontFamily:  poppinsRegular,
                    color: blackColor
                  ),
                  children: <TextSpan>[
                    TextSpan(text: e.toString() + " "),
                    TextSpan(
                        text: e.toCountryStringOnly(),
                            ),
                  ],
                ),
              )),
        ],
      ),
    );
  }

  Widget _buildEmptySearchWidget(BuildContext context) {
    if (widget.emptySearchBuilder != null) {
      return widget.emptySearchBuilder(context);
    }

    return Center(
        child: Text(
      "No Data Found"

    ));
  }

  @override
  void initState() {
    filteredElements = widget.elements;
    super.initState();
  }

  void _filterElements(String s) {
    s = searchController.text.toUpperCase();
    setState(() {
      filteredElements = widget.elements
          .where((e) =>
//              e.countryId.toString().contains(s) ||
              e.dial_code.contains(s) || e.name.toUpperCase().contains(s))
          .toList();
    });
  }

  void _selectItem(CountryCode e) {
    Navigator.pop(context, e);
  }
}
