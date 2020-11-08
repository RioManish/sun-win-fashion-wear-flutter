class GetOtpResponseModel{
  final String successMsg;
  final int otp;
  final String mobileNumber;
  final int statusCode;
   GetOtpResponseModel({ this.successMsg, this.otp, this.mobileNumber,this.statusCode});

  static GetOtpResponseModel fromJson(Map<String,dynamic> mapString,String successMsg,int statusCode) {
    return GetOtpResponseModel(successMsg: successMsg,otp: mapString['otp'],mobileNumber: mapString['mobileNumber'],statusCode: statusCode );
  }

}