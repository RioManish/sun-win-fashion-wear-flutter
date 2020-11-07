import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:sunwinfashionwear/common_widgets/Login_Screen/country_codes.dart';
import 'package:sunwinfashionwear/common_widgets/Login_Screen/custom_country_code_list.dart';
import 'package:sunwinfashionwear/common_widgets/Login_Screen/selection_dialog.dart';
import 'package:sunwinfashionwear/theme/styles.dart';


// ignore: must_be_immutable
class CountryCodePicker extends StatefulWidget {
  final ValueChanged<CountryCode> onChanged;

  //Exposed new method to get the initial information of the country
  final ValueChanged<CountryCode> onInit;
  final String initialSelection;
  final List<String> favorite;
  final TextStyle textStyle;
  final EdgeInsetsGeometry padding;
  final bool showCountryOnly;
  final InputDecoration searchDecoration;
  final TextStyle searchStyle;
  final WidgetBuilder emptySearchBuilder;
  final Function(CountryCode) builder;

  /// shows the name of the country instead of the dialcode
  final bool showOnlyCountryWhenClosed;

  /// aligns the flag and the Text left
  ///
  /// additionally this option also fills the available space of the widget.
  /// this is especially usefull in combination with [showOnlyCountryWhenClosed],
  /// because longer countrynames are displayed in one line
  final bool alignLeft;

  /// shows the flag
  final bool showFlag;

  /// contains the country codes to load only the specified countries.
  final List<String> countryFilter;

  bool isCountryCodeReadOnly;

  CountryCodePicker({
    this.onChanged,
    this.onInit,
    this.initialSelection,
    this.favorite = const [],
    this.countryFilter = const [],
    this.textStyle,
    this.padding = const EdgeInsets.all(0.0),
    this.showCountryOnly = false,
    this.searchDecoration = const InputDecoration(),
    this.searchStyle,
    this.emptySearchBuilder,
    this.showOnlyCountryWhenClosed = false,
    this.alignLeft = false,
    this.showFlag = true,
    this.builder,
    this.isCountryCodeReadOnly = false,
  });

  @override
  State<StatefulWidget> createState() {
    return new _CountryCodePickerState(getCountryCode());
  }

  getCountryCode() {
    List<Map> jsonList = codes;

    List<CountryCode> elements = jsonList
        .map((s) => CountryCode(
              name: s['countryName'],
//              code: s['code'],
              dial_code: s['dialCode'],
//              flagUri: 'flags/${s['code'].toLowerCase()}.png',
            ))
        .toList();

    if (countryFilter.length > 0) {
      elements =
          elements.where((c) => countryFilter.contains(c.dial_code)).toList();
    }

    return elements;
  }
}

class _CountryCodePickerState extends State<CountryCodePicker> {
  CountryCode selectedItem;
  List<CountryCode> elements = [];
  List<CountryCode> favoriteElements = [];

  //ProgressBarHandler _handler;

  _CountryCodePickerState(this.elements);

  @override
  Widget build(BuildContext context) {
    Widget _widget;
    if (widget.builder != null)
      _widget = InkWell(
        onTap: _showSelectionDialog,
        child: widget.builder(selectedItem),
      );
    else {
      _widget = FlatButton(
        padding: widget.padding,
        onPressed: _showSelectionDialog,
        child: Flex(
          direction: Axis.horizontal,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Flexible(
              fit: widget.alignLeft ? FlexFit.tight : FlexFit.loose,
              child: Container(
                child: Text(
                  (widget.showOnlyCountryWhenClosed
                      ? selectedItem.toCountryStringOnly()
                      : selectedItem.toString()),
                  // widget.initialSelection,
                 // style: widget.textStyle ?? Theme.of(context).textTheme.button,
                 style: TextStyle(fontFamily: poppinsMedium, color: mobileNumberFieldTextColor),
                
                ),
              ),
            ),
            verticalLine(),
          ],
        ),
      );
    }
    return _widget;
  }

  verticalLine() {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: Text("-"),
    );
  }

  @override
  initState() {
    selectedItem = elements[0];
    if (widget.initialSelection != null) {
      selectedItem.dial_code = widget.initialSelection;
    }

    //Change added: get the initial entered country information
    _onInit(selectedItem);

    super.initState();
  }


  Future<void> _showSelectionDialog() async {
    if (!widget.isCountryCodeReadOnly) {
      List<Map> jsonList = codes;

      List<CountryCode> elements = jsonList
          .map((s) => CountryCode(
                code: s['code'],
                name: s['name'],
//              code: s['code'],
                dial_code: s['dial_code'],
//              flagUri: 'flags/${s['code'].toLowerCase()}.png',
              ))
          .toList();

      showDialog(
        context: context,
        builder: (_) => SelectionDialog(elements, favoriteElements,
            showCountryOnly: widget.showCountryOnly,
            emptySearchBuilder: widget.emptySearchBuilder,
            searchDecoration: widget.searchDecoration,
            searchStyle: widget.searchStyle,
            showFlag: widget.showFlag),
      ).then((e) {
        if (e != null) {
          setState(() {
            selectedItem = e;
          });

          _publishSelection(e);
        }
      });
    }
  }

  void _publishSelection(CountryCode e) {
    if (widget.onChanged != null) {
      widget.onChanged(e);
    }
  }

  void _onInit(CountryCode initialData) {
    if (widget.onInit != null) {
      widget.onInit(initialData);
    }
  }
}
