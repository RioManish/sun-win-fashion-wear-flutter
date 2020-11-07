mixin ToAlias {}

@deprecated
class CElement = CountryCode with ToAlias;

/// Country element. This is the element that contains all the information
class CountryCode {
  /// the country code (IT,AF..)
//  String code;
  String code;

//  String dialCode;

  /// the name of the country
//  String name;
  String name;

  /// the flag of the country
//  String flagUri;

  /// the dial code (+39,+93..)
  String dial_code;

//  CountryCode({this.name, this.flagUri, this.code, this.dialCode});
  CountryCode({this.code, this.name, this.dial_code});

  CountryCode.fromJson(Map<String, dynamic> json) {
    code = json['countryId'];
    name = json['countryName'];
    dial_code = json['dialCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['countryId'] = this.code;
    data['countryName'] = this.name;
    data['dialCode'] = this.dial_code;
    return data;
  }

  @override
  String toString() => "$dial_code";

  String toLongString() => "$dial_code $name";

  String toCountryStringOnly() => '$name';

/*  String toString() => "$dialCode";
  String toLongString() => "$dialCode $name";
  String toCountryStringOnly() => '$name';  */
}

// class CountryCode {
//   int countryId;
//   String countryName;
//   String dialCode;
//
//   CountryCode({this.countryId, this.countryName, this.dialCode});
//
//   CountryCode.fromJson(Map<String, dynamic> json) {
//     countryId = json['countryId'];
//     countryName = json['countryName'];
//     dialCode = json['dialCode'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['countryId'] = this.countryId;
//     data['countryName'] = this.countryName;
//     data['dialCode'] = this.dialCode;
//     return data;
//   }
// }
