import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String mobilenumber;
  final int countryId;
  final int applicationId;

  const LoginButtonPressed({
    @required this.mobilenumber,
    @required this.countryId,
    @required this.applicationId,
  });

  @override
  // TODO: implement props
  List<Object> get props => [];
}

class OnLanguagechange extends LoginEvent {
  final BuildContext context;

  const OnLanguagechange({
    @required this.context,
  });

  @override
  // TODO: implement props
  List<Object> get props => null;
}
