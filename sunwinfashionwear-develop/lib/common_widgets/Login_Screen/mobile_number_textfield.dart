import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunwinfashionwear/common_widgets/Login_Screen/country_code_picker.dart';
import 'package:sunwinfashionwear/theme/styles.dart';
import 'package:sunwinfashionwear/utils/constants.dart';
import 'package:sunwinfashionwear/common_widgets/Login_Screen/custom_list_tile.dart' as prefix0;


class LoginPageFields extends StatefulWidget {
  final TextEditingController _customTextEditingController;
  final String _customLabelString;
  final String _defaultCountryCode;
  final IconData _customLeadIcon;
  final TextInputType _customTextInputType;
  final TextInputAction _keyboardAction;
  final Function _onTapCountryCode;
  final Function onTap;
  bool isCountryCodeReadOnly;

  LoginPageFields(
      this._customTextEditingController,
      this._customLabelString,
      this._defaultCountryCode,
      this._customLeadIcon,
      this._customTextInputType,
      this._keyboardAction,
      this._onTapCountryCode,
      this.onTap,
      {Key key,
      isCountryCodeReadOnly: false})
      : super(key: key);

  @override
  _LoginPageFieldsState createState() {
    return _LoginPageFieldsState();
  }
}

class _LoginPageFieldsState extends State<LoginPageFields> {

  String _dialCode = "91";

  double elevationPoint = 0.0;

  @override
  void initState() {
    super.initState();

    _dialCode = widget._defaultCountryCode;

    // widget._customTextEditingController.addListener(() {
    //   if (widget._customTextEditingController.text != Strings.txtMT)
    //     elevationPoint = 5.0;
    // });

  }

  @override
  Widget build(BuildContext context) {
    //var themeStyle = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: blackColor, width: 0.1),
        borderRadius: BorderRadius.circular(5.0)
      ),
          child: prefix0.ListTile(
            dense: true,
            leading: countryPickerfn(),
            title: FormBuilderTextField(
              attribute: widget._customLabelString,
              controller: widget._customTextEditingController,
              keyboardType: widget._customTextInputType,
              textInputAction: widget._keyboardAction,
              inputFormatters: inputFormatterfn(_dialCode == '+91' ? 10 : 10),
              autofocus: false,
              enableInteractiveSelection: false,
              maxLines: 1,
              style: TextStyle(fontFamily: poppinsMedium, color: blackColor),
              decoration: InputDecoration(
               // labelText: widget._customLabelString,
                border: underLineShow(),
                suffixIcon: suffixIconfn(),
                // contentPadding: EdgeInsets.only(
                //     left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
              ),
            ),
          ),
    );
  }

  underLineShow() {
      return InputBorder.none;
  }

  countryPickerfn() {
    return CountryCodePicker(
      isCountryCodeReadOnly: widget.isCountryCodeReadOnly == null
          ? false
          : widget.isCountryCodeReadOnly,
      onChanged: (country) => {
        widget._onTapCountryCode(country),
        setState(() {
          _dialCode = country.dial_code;
        }),
      },
      initialSelection: widget._defaultCountryCode,
      searchStyle: TextStyle(
          fontFamily: poppinsMedium,
          color: blackColor
    ));
  }

  inputFormatterfn(len) {
    if (widget._customTextInputType == TextInputType.number)
      return <TextInputFormatter>[
        WhitelistingTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(len)
      ];
  }

  suffixIconfn() {
    return Padding(
      padding: const EdgeInsets.all(paddingFifteen),
      child: SvgPicture.asset(
        phone_img, 
        color: phoneNumberTextColor,
),
    );
  }
}
