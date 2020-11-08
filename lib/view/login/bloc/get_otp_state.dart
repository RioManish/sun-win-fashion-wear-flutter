part of 'get_otp_bloc.dart';

abstract class GetOtpSate extends Equatable {
  const GetOtpSate();
}

class InitialGetOtpLoadingState extends GetOtpSate {
  @override
  List<Object> get props => [];
}


class LoadScreenState extends GetOtpSate {
  @override
  List<Object> get props => [];
}

class GetOtpSuccess extends GetOtpSate {
  final GetOtpResponseModel responseData;
  const GetOtpSuccess({@required this.responseData});
  @override
  // TODO: implement props
  List<Object> get props => [responseData];
}

class GetOtpFailed extends GetOtpSate {
  final String error;
  final int statusCode;
  const GetOtpFailed({@required this.error,@required this.statusCode});
  @override
  // TODO: implement props
  List<Object> get props => [error,statusCode];
}



class SendOtpSuccess extends GetOtpSate {
  final OtpSuccessLoginResponseModel responseData;
  const SendOtpSuccess({@required this.responseData});
  @override
  // TODO: implement props
  List<Object> get props => [responseData];
}

class SendOtpFailed extends GetOtpSate {
  final String error;
  final int statusCode;
  const SendOtpFailed({@required this.error,@required this.statusCode});
  @override
  // TODO: implement props
  List<Object> get props => [error,statusCode];
}


