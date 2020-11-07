class OtpValidation {
  int userId;
  String otp;

  OtpValidation({this.userId, this.otp});

  OtpValidation.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['otp'] = this.otp;
    return data;
  }
}