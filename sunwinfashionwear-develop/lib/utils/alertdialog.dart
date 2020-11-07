import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './constants.dart' as Constants;

class CustomAlert {
//  TextEditingController number = TextEditingController();

  Future<Widget> customPopups(
      {@required BuildContext context,
      @required bool isSecondButtonNeed,
      @required String alertCalledFrom,
      @required String titleTxt,
      @required String firstBtnTxt,
      @required String secondBtnTxt,
      TextEditingController ctrl,
      String firstBtnData,
      String secondBtnData,
      Function firstBtnCallBck,
      Function secondBtnCallBck}) {
    return showDialog<Widget>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {},
            child: StatefulBuilder(builder: (context, setState) {
              return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15)),
                  child: Container(
                      height: 140.0,
                      margin: EdgeInsets.only(left: 10.0),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.center,

                              child: alertCalledFrom == Constants.orderStatusTxt
                                  ? Text(
                                      titleTxt,
//                                      style: TextStyle(fontSize: 26),
                                    )
                                  : TextFormField(
                                      controller: ctrl,
                                      decoration: InputDecoration(
                                        labelText: titleTxt,
                                      ),
                                    ),

                              //child: Image.asset(_icon),
                            ),
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: isSecondButtonNeed
                                ? MainAxisAlignment.spaceEvenly
                                : MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(8.0),
                                  ),
                                  color: Colors.blue,
                                  child: Text(
                                    firstBtnTxt,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
//                                  addActivity(null, 'Accident');
                                    Navigator.of(context).pop();
                                    firstBtnCallBck();
//
                                  }),
                              Visibility(
                                visible: isSecondButtonNeed,
                                child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(8.0),
                                    ),
                                    color: Colors.blue,
                                    child: Text(
                                      secondBtnTxt,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                      secondBtnCallBck();
                                    }),
                              ),
                            ],
                          ))
                        ],
                      )));
            }),
          );
        });
  }

  Future<Widget> customPopupsPhoneSign(
      {@required BuildContext context,
      @required bool isSecondButtonNeed,
      @required String alertCalledFrom,
      @required String titleTxt,
      @required String firstBtnTxt,
      @required String secondBtnTxt,
      TextEditingController ctrl,
      String firstBtnData,
      String secondBtnData,
      Function firstBtnCallBck,
      Function secondBtnCallBck}) {
    return showDialog<Widget>(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return WillPopScope(
            onWillPop: () {},
            child: StatefulBuilder(builder: (context, setState) {
              return Dialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(15)),
                  child: Container(
                      height: 140.0,
                      margin: EdgeInsets.only(left: 10.0),
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: Container(
                              alignment: Alignment.center,

                              child: alertCalledFrom == Constants.orderStatusTxt
                                  ? Text(
                                      titleTxt,
                                      style: TextStyle(fontSize: 26),
                                    )
                                  : TextFormField(
                                      keyboardType: TextInputType.number,
                                      controller: ctrl,
                                      inputFormatters: inputFormatterFn(10),
                                      decoration: InputDecoration(
                                        labelText: titleTxt,
                                      ),
                                    ),

                              //child: Image.asset(_icon),
                            ),
                          ),
                          Expanded(
                              child: Row(
                            mainAxisAlignment: isSecondButtonNeed
                                ? MainAxisAlignment.spaceEvenly
                                : MainAxisAlignment.center,
                            children: <Widget>[
                              RaisedButton(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(8.0),
                                  ),
                                  color: Colors.blue,
                                  child: Text(
                                    firstBtnTxt,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  onPressed: () {
//                                  addActivity(null, 'Accident');
//                                        Navigator.of(context).pop();
                                    FocusScope.of(context)
                                        .requestFocus(new FocusNode());

                                    firstBtnCallBck();
//
                                  }),
                              Visibility(
                                visible: isSecondButtonNeed,
                                child: RaisedButton(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(8.0),
                                    ),
                                    color: Colors.blue,
                                    child: Text(
                                      secondBtnTxt,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      FocusScope.of(context)
                                          .requestFocus(new FocusNode());
                                      Navigator.of(context).pop();
                                      secondBtnCallBck();
                                    }),
                              ),
                            ],
                          ))
                        ],
                      )));
            }),
          );
        });
  }

  inputFormatterFn(len) {
    return <TextInputFormatter>[
      WhitelistingTextInputFormatter.digitsOnly,
      LengthLimitingTextInputFormatter(len)
    ];
  }
}
