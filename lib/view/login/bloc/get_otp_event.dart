part of 'get_otp_bloc.dart';

abstract class GetOtpEvent extends Equatable {
  const GetOtpEvent();
}

class GetOTPButtonPressedEvent extends GetOtpEvent {
  final String mobileNumber;
  final int countryId;
  final int applicationId;

  const GetOTPButtonPressedEvent({
    @required this.mobileNumber,
    @required this.countryId,
    @required this.applicationId,
  });

  @override
  // TODO: implement props
  List<Object> get props => [mobileNumber,countryId,applicationId];
}

class OnLanguageChange extends GetOtpEvent {
  final BuildContext context;

  const OnLanguageChange({
    @required this.context,
  });

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class SendOTPButtonPressedEvent extends GetOtpEvent {
  final String mobileNumber;
  final String otp;


  const SendOTPButtonPressedEvent({
    @required this.mobileNumber,
    @required this.otp,
  });

  @override
  // TODO: implement props
  List<Object> get props => [mobileNumber,otp];
}

class ReSendOTPButtonPressedEvent extends GetOtpEvent {
  final String mobileNumber;
  final String otp;


  const ReSendOTPButtonPressedEvent({
    @required this.mobileNumber,
    @required this.otp,
  });

  @override
  // TODO: implement props
  List<Object> get props => [mobileNumber,otp];
}
