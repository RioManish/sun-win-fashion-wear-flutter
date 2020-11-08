class OtpSuccessLoginResponseModel{
  final String successMsg;
  final int statusCode;
  final String userId;
  final String bearerToken;
  OtpSuccessLoginResponseModel({ this.successMsg, this.userId, this.bearerToken,this.statusCode});

  static OtpSuccessLoginResponseModel fromJson(Map<String,dynamic> mapString,String message,int statusCode) {
    return OtpSuccessLoginResponseModel(successMsg: message,userId: mapString['userId'],bearerToken: mapString['bearerToken'],statusCode: statusCode);
  }

}