library gm_core;

import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:sunwinfashionwear/model/Meta.dart';
import 'package:sunwinfashionwear/utils/common_functions/silent_notification_handler.dart';

class GMAPIService {
  static int connectionTimeOut = 30000;
  static int receiveTimeout = 30000;

  static Dio dio;
  var log = new Logger();

  void configAPI() {
    // Set default configs
    dio = new Dio();
    dio.options.connectTimeout = connectionTimeOut;
    dio.options.receiveTimeout = receiveTimeout;
    dio.options.headers["content-type"] = "application/json";
    dio.options.headers["Accept"] = "application/json";
//    dio.options.headers["User-Agent"] = "Android";
//    dio.options.headers["Platform"] = "Android";
  }

  bool validateRequest(String url) {
    if (null != url && url.length > 0) {
      return true;
    }
    return false;
  }

  // Future<Meta> getLevel1Token(String url, Map<String, dynamic> data) async {
  //   return await getLevelOneToken(url, data);
  // }

  // Future<LoginMeta> getLevel2Token(
  //     String url, Map<String, dynamic> data, String authToken) async {
  //   return getLeve2OneToken(url, data, authToken);
  // }

// working code
  Future<Meta> processGetURL(String url, String authToken) async {
    if (validateRequest(url)) {
      bool isNetworkAvailable = await isInternetConnected();
      if (isNetworkAvailable) {
        try {
          dio.options.headers["Authorization"] = "Bearer " + authToken;
          dio.options.headers['Content-Length'] = 0;
//        dio.interceptors.add(LogInterceptor(responseBody: false));

          Response response = await dio.get(url);

          return _getResponse(response);
        } catch (error) {
          return handleError(error);
        }
      } else {
        // Meta meta = new Meta(
        //     statusCode: ErrorCode.INTERNET_ERROR,
        //     statusMsg: SPUtil.getInt(Constants.CURRENT_LANGUAGE) ==
        //             Constants.LANGUAGE_ARABIC
        //         ? Strings.chknetArbStr
        //         : Strings.chknetEngStr);
        // return meta;
      }
    } else {
      Meta meta = new Meta(
          statusCode: ErrorCode.URL_NOT_VALID, statusMsg: "Not a valid URL");
      return meta;
    }
  }

  // Future<Meta> getLevelOneToken(String url, Map<String, dynamic> data) async {
  //   bool isNetworkAvailable = await isInternetConnected();
  //   if (isNetworkAvailable) {
  //     if (validateRequest(url)) {
  //       String bodyData = AESCrypt().encrypt(jsonEncode(data));
  //
  //       dio.options.headers['Content-Length'] = bodyData.length.toString();
  //       // dio.interceptors.add(LogInterceptor(responseBody: false));
  //       try {
  //         Response response = await dio.post(url, data: json.encode(bodyData));
  //         return getToken(response);
  //       } catch (e) {
  //         return handleError(e);
  //       }
  //     } else {
  //       Meta meta = new Meta(
  //           statusCode: ErrorCode.URL_NOT_VALID, statusMsg: "Not a valid URL");
  //       return meta;
  //     }
  //   } else {
  //     Meta meta = new Meta(
  //         statusCode: ErrorCode.INTERNET_ERROR,
  //         statusMsg: SPUtil.getInt(Constants.CURRENT_LANGUAGE) ==
  //                 Constants.LANGUAGE_ARABIC
  //             ? Strings.chknetArbStr
  //             : Strings.chknetEngStr);
  //     return meta;
  //   }
  // }

  // Future<LoginMeta> getLeve2OneToken(
  //     String url, Map<String, dynamic> data, String authToken) async {
  //   bool isNetworkAvailable = await isInternetConnected();
  //   if (isNetworkAvailable) {
  //     if (validateRequest(url)) {
  //       String bodyData = AESCrypt().encrypt(jsonEncode(data));
  //       dio.options.headers["Authorization"] = "Bearer " + authToken;
  //       dio.options.headers['Content-Length'] = bodyData.length.toString();
  //       // dio.interceptors.add(LogInterceptor(responseBody: false));
  //       try {
  //         Response response = await dio.post(url, data: json.encode(bodyData));
  //         return getLoginToken(response);
  //       } catch (e) {
  //         return handleLoginError(e);
  //       }
  //     } else {
  //       LoginMeta meta = new LoginMeta(
  //           statusCode: ErrorCode.URL_NOT_VALID, statusMsg: "Not a valid URL");
  //       return meta;
  //     }
  //   } else {
  //     LoginMeta meta = new LoginMeta(
  //         statusCode: ErrorCode.INTERNET_ERROR,
  //         statusMsg: SPUtil.getInt(Constants.CURRENT_LANGUAGE) ==
  //                 Constants.LANGUAGE_ARABIC
  //             ? Strings.chknetArbStr
  //             : Strings.chknetEngStr);
  //     return meta;
  //   }
  // }

  Future<Meta> processPostURL(
      String url, Map<String, dynamic> data, String authToken) async {
    bool isNetworkAvailable = await isInternetConnected();
    if (isNetworkAvailable) {
      if (validateRequest(url)) {
        String bodyData = "AESCrypt().encrypt(jsonEncode(data))";
        dio.options.headers["Authorization"] = "Bearer " + authToken;
        dio.options.headers['Content-Length'] = bodyData.length.toString();
        // dio.interceptors.add(LogInterceptor(responseBody: false));
        try {
          Response response = await dio.post(url, data: jsonEncode(bodyData));

          return _getResponse(response);
        } catch (e) {
          return handleError(e);
        }
      } else {
        Meta meta = new Meta(
            statusCode: ErrorCode.URL_NOT_VALID, statusMsg: "Not a valid URL");
        return meta;
      }
    } else {
      // Meta meta = new Meta(
      //     statusCode: ErrorCode.INTERNET_ERROR,
      //     statusMsg: SPUtil.getInt(Constants.CURRENT_LANGUAGE) ==
      //             Constants.LANGUAGE_ARABIC
      //         ? Strings.chknetArbStr
      //         : Strings.chknetEngStr);
      // return meta;
    }
  }

  Future<Meta> processPutURL(
      String url, Map<String, dynamic> data, String authToken) async {
    bool isNetworkAvailable = await isInternetConnected();
    if (isNetworkAvailable) {
      if (validateRequest(url)) {
        String bodyData = "AESCrypt().encrypt(jsonEncode(data))";
        dio.options.headers["Authorization"] = "Bearer " + authToken;
        dio.options.headers['Content-Length'] = bodyData.length.toString();
        try {
          Response response = await dio.put(url, data: jsonEncode(bodyData));

          return _getResponse(response);
        } catch (e) {
          return handleError(e);
        }
      } else {
        Meta meta = new Meta(
            statusCode: ErrorCode.URL_NOT_VALID, statusMsg: "Not a valid URL");
        return meta;
      }
    } else {
      // Meta meta = new Meta(
      //     statusCode: ErrorCode.INTERNET_ERROR,
      //     statusMsg: SPUtil.getInt(Constants.CURRENT_LANGUAGE) ==
      //             Constants.LANGUAGE_ARABIC
      //         ? Strings.chknetArbStr
      //         : Strings.chknetEngStr);
      // return meta;
    }
  }

  // ignore: missing_return
  Future<Meta> processDeleteURL(
      String url, String data, String authToken) async {
    bool isNetworkAvailable = await isInternetConnected();
    if (isNetworkAvailable) {
      if (validateRequest(url)) {
        String bodyData = "AESCrypt().encrypt(data.toString())";
        dio.options.headers["Authorization"] = "Bearer " + authToken;
        dio.options.headers['Content-Length'] = bodyData.length.toString();
        try {
          Response response = await dio.delete(url, data: data);

          return _getResponse(response);
        } catch (e) {
          handleError(e);
        }
      } else {
        Meta meta = new Meta(
            statusCode: ErrorCode.URL_NOT_VALID, statusMsg: "Not a valid URL");
        return meta;
      }
    } else {
     /* Meta meta = new Meta(
          statusCode: ErrorCode.INTERNET_ERROR,
          statusMsg: SPUtil.getInt(Constants.CURRENT_LANGUAGE) ==
                  Constants.LANGUAGE_ARABIC
              ? Strings.chknetArbStr
              : Strings.chknetEngStr);
      return meta;*/
    }
  }

  // ignore: missing_return
  Future<Meta> imageUpload(
      String url, String filePath, String authToken) async {
    bool isNetworkAvailable = await isInternetConnected();
    if (isNetworkAvailable) {
      if (validateRequest(url)) {
        dio.options.headers["Authorization"] = "Bearer " + authToken;
        try {
          var formData = FormData();
          formData.files.add(MapEntry(
            "file",
            await MultipartFile.fromFile(filePath),
          ));
          Response response = await dio.post(url, data: formData);

          return _getResponse(response);
        } catch (e) {
          handleError(e);
        }
      } else {
        Meta meta = new Meta(
            statusCode: ErrorCode.URL_NOT_VALID, statusMsg: "Not a valid URL");
        return meta;
      }
    } else {
      // Meta meta = new Meta(
      //     statusCode: ErrorCode.INTERNET_ERROR,
      //     statusMsg: SPUtil.getInt(Constants.CURRENT_LANGUAGE) ==
      //             Constants.LANGUAGE_ARABIC
      //         ? Strings.chknetArbStr
      //         : Strings.chknetEngStr);
      // return meta;
    }
  }

  // ignore: missing_return
  Future<Meta> imageUploadWithParam(String url, Map<String, String> params,
      String filePath, String authToken) async {
    bool isNetworkAvailable = await isInternetConnected();
    if (isNetworkAvailable) {
      if (validateRequest(url)) {
        dio.options.headers["Authorization"] = "Bearer " + authToken;
        try {
          String parameters = "?";
          params.forEach((k, v) => (parameters += k + "=" + v + "&"));
          var formData = FormData();
          formData.files.add(MapEntry(
            "file",
            await MultipartFile.fromFile(filePath),
          ));
          Response response = await dio.post(url + parameters, data: formData);

          return _getResponse(response);
        } catch (e) {
          handleError(e);
        }
      } else {
        Meta meta = new Meta(
            statusCode: ErrorCode.URL_NOT_VALID, statusMsg: "Not a valid URL");
        return meta;
      }
    } else {
      // Meta meta = new Meta(
      //     statusCode: ErrorCode.INTERNET_ERROR,
      //     statusMsg: SPUtil.getInt(Constants.CURRENT_LANGUAGE) ==
      //             Constants.LANGUAGE_ARABIC
      //         ? Strings.chknetArbStr
      //         : Strings.chknetEngStr);
      // return meta;
    }
  }

  Meta throwError(int errorCode, String errorMsg) {
    Meta meta = new Meta(statusCode: errorCode, statusMsg: errorMsg);
    return meta;
  }

  // LoginMeta throwLoginError(int errorCode, String errorMsg) {
  //   LoginMeta meta = new LoginMeta(statusCode: errorCode, statusMsg: errorMsg);
  //   return meta;
  // }

  Meta handleError(error) {
    if (error.type == DioErrorType.RECEIVE_TIMEOUT ||
        error.type == DioErrorType.CONNECT_TIMEOUT) {
      return throwError(ErrorCode.CONNECTION_TIMEOUT, "Connection Timeout!");
    } else if (error.type == DioErrorType.RESPONSE) {
      if (error.response.statusCode == 401 &&
          error.response.data == 'TOKEN EXPIRED') {
        SilentNotificationHandler silentNotificationHandler =
            SilentNotificationHandler.instance;
        // silentNotificationHandler.updateData(
        //     {Constants.NOTIFICATION_KEY: Constants.NOTIFICATION_TOKEN_EXPIRED});
      }
      return throwError(error.response.statusCode, error.response.toString());
    } else {
      return throwError(ErrorCode.COMMUNICATION_ERROR, "Communication Error");
    }
  }

  // ignore: missing_return
  // LoginMeta handleLoginError(error) {
  //   if (error.type == DioErrorType.RECEIVE_TIMEOUT ||
  //       error.type == DioErrorType.CONNECT_TIMEOUT) {
  //     return throwLoginError(
  //         ErrorCode.CONNECTION_TIMEOUT, "Connection Timeout!");
  //   } else if (error.type == DioErrorType.RESPONSE) {
  //     if (error.response.statusCode == 401 &&
  //         error.response.data == 'TOKEN EXPIRED') {
  //       SilentNotificationHandler silentNotificationHandler =
  //           SilentNotificationHandler.instance;
  //       silentNotificationHandler.updateData(
  //           {Constants.NOTIFICATION_KEY: Constants.NOTIFICATION_TOKEN_EXPIRED});
  //       return throwLoginError(
  //           ErrorCode.UNAUTHORZIED_USER, error.response.data);
  //     } else {
  //       switch (error.response.statusCode) {
  //         case 401:
  //           return throwLoginError(
  //               ErrorCode.UNAUTHORZIED_USER, "User not Authorized");
  //         case 403:
  //           return throwLoginError(403, "Forbidden");
  //         case 404:
  //           return throwLoginError(404, "Not Found");
  //         case 409:
  //           return throwLoginError(ErrorCode.THROTTLE_ERROR, "Throttle Error");
  //         case 500:
  //           return throwLoginError(500, "Internal Server Error");
  //       }
  //     }
  //   } else {
  //     return throwLoginError(
  //         ErrorCode.COMMUNICATION_ERROR, "Communication Error");
  //   }
  // }

  void logPrinting(String response) {
    log.v(response);
  }

  Meta _getResponse(Response response) {
    Meta data = new Meta();
    if (response.statusCode == 200) {
      if (response.data.toString().isNotEmpty) {
        // data = getData(response);
      }
    } else if (response.statusCode == 409) {
      data.statusMsg = response.data.toString();
      data.statusCode = response.statusCode;
    } else {
      if (response.data != null && response.data.toString().length > 0) {
        // data = getData(response);
      } else {
        data.statusMsg = response.data.toString();
        data.statusCode = response.statusCode;
      }
    }
    return data;
  }

  // Meta getToken(Response response) {
  //   Meta data = new Meta();
  //   if (response.statusCode == 200) {
  //     if (response.data.toString().isNotEmpty) {
  //       data = getTokenData(response);
  //     }
  //   } else if (response.statusCode == 409) {
  //     data.statusMsg = response.data.toString();
  //     data.statusCode = response.statusCode;
  //   } else {
  //     if (response.data != null && response.data.toString().length > 0) {
  //       var data = getTokenData(response);
  //       data.statusMsg = response.data.toString();
  //       data.statusCode = response.statusCode;
  //     } else {
  //       data.statusMsg = response.data.toString();
  //       data.statusCode = response.statusCode;
  //     }
  //   }
  //   return data;
  // }

  // LoginMeta getLoginToken(Response response) {
  //   LoginMeta data = new LoginMeta();
  //   if (response.statusCode == 200) {
  //     if (response.data.toString().isNotEmpty) {
  //       data = getLevel2TokenData(response);
  //     }
  //   } else if (response.statusCode == 409) {
  //     data.statusMsg = response.data.toString();
  //     data.statusCode = response.statusCode;
  //   } else {
  //     if (response.data != null && response.data.toString().length > 0) {
  //       var data = getLevel2TokenData(response);
  //       data.statusMsg = response.data.toString();
  //       data.statusCode = response.statusCode;
  //     } else {
  //       data.statusMsg = response.data.toString();
  //       data.statusCode = response.statusCode;
  //     }
  //   }
  //   return data;
  // }

  // Meta getData(Response response) {
  //   // GMAPIResponse gmResponse = new GMAPIResponse.fromJson(response.data);
  //   Meta data = new Meta();
  //
  //   if (null != gmResponse.result && gmResponse.result.length > 0) {
  //     data.statusMsg = "AESCrypt().decrypt(gmResponse.result)";
  //     data.statusCode = 200;
  //   } else {
  //     data.statusMsg =
  //         "GMError.fromJson(jsonDecode(AESCrypt().decrypt(gmResponse.error))).message";
  //     data.statusCode = 201;
  //   }
  //   logPrinting(data.toJson().toString());
  //   return data;
  // }

  // Meta getTokenData(Response response) {
  //   GMAPIResponse gmResponse = new GMAPIResponse.fromJson(response.data);
  //   Meta data = new Meta();
  //   if (null != gmResponse.token && gmResponse.token.length > 0) {
  //     data.statusMsg = gmResponse.token;
  //     data.statusCode = 200;
  //   } else {
  //     data.statusMsg =
  //         GMError.fromJson(jsonDecode(AESCrypt().decrypt(gmResponse.error)))
  //             .message;
  //     data.statusCode = 201;
  //   }
  //   logPrinting(data.toJson().toString());
  //   return data;
  // }

  // LoginMeta getLevel2TokenData(Response response) {
  //   GMAPIResponse gmResponse = new GMAPIResponse.fromJson(response.data);
  //   LoginMeta data = new LoginMeta();
  //   if (null != gmResponse.token && gmResponse.token.length > 0) {
  //     data.level2token = gmResponse.token;
  //     data.statusMsg = AESCrypt().decrypt(gmResponse.result);
  //     data.statusCode = 200;
  //   } else if (null != gmResponse.result && gmResponse.result.length > 0) {
  //     data.statusMsg = AESCrypt().decrypt(gmResponse.result);
  //     data.statusCode = 200;
  //   } else {
  //     data.statusMsg =
  //         GMError.fromJson(jsonDecode(AESCrypt().decrypt(gmResponse.error)))
  //             .message;
  //     data.statusCode = 201;
  //   }
  //   logPrinting(data.toJson().toString());
  //   return data;
  // }

  Future<double> getNetSpeed(String url) async {
    double finalDownloadRate = 0.0;
    var startTime = new DateTime.now().millisecondsSinceEpoch;
    try {
      Response response = await dio.get(
        url,
        //Received data with List<int>
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
        ),
      );
      print(response.headers);
      var endTime = new DateTime.now().millisecondsSinceEpoch;
      var downloadElapsedTime = (endTime - startTime) / 1000.0;
      var contentLength = response.headers.value("content-length");
      var kbs = (int.parse(contentLength)) / (1024);
      finalDownloadRate = (kbs / downloadElapsedTime);
      return finalDownloadRate;
    } catch (e) {
      print(e);
      return finalDownloadRate;
    }
  }


  Future<bool> isInternetConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }

}

class ErrorCode {
  // ignore: non_constant_identifier_names
  static int URL_NOT_VALID = 100;

  // ignore: non_constant_identifier_names
  static int COMMUNICATION_ERROR = 100;

  // ignore: non_constant_identifier_names
  static int EMPTY_RESPONSE = 101;

  // ignore: non_constant_identifier_names
  static int INTERNET_ERROR = 102;

  // ignore: non_constant_identifier_names
  static int UNAUTHORZIED_USER = 401;

  // ignore: non_constant_identifier_names
  static int CONNECTION_TIMEOUT = 408;

  // ignore: non_constant_identifier_names
  static int THROTTLE_ERROR = 409;

  // ignore: non_constant_identifier_names
  static int COMMON_ERROR = 201;

  // ignore: non_constant_identifier_names
  static String TRY_AGAIN = "Please try again later";
}

