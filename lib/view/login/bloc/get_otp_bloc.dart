import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;
import 'package:sunwinfashionwear/model/get_otp_response_model.dart';
import 'package:sunwinfashionwear/model/otp_success_login_response_model.dart';
import 'package:sunwinfashionwear/utils/urls.dart';

part 'get_otp_event.dart';

part 'get_otp_state.dart';

class GetOtpBloc extends Bloc<GetOtpEvent, GetOtpSate> {
  GetOtpBloc() : super(LoadScreenState());

  @override
  Stream<GetOtpSate> mapEventToState(
    GetOtpEvent event,
  ) async* {
    if (event is GetOTPButtonPressedEvent) {
      yield InitialGetOtpLoadingState();
      GetOtpResponseModel responseData;
      try {
        final body = {
          "mobileNumber": event.mobileNumber,
        };
        final result = await http.post(
            ProjectUrls.concatEndPointUrlWithBaseUrl(
                ProjectUrls.GET_OTP_END_POINT),
            body: json.encode(body),
            headers: {
              "Content-Type": "application/json",
              HttpHeaders.contentTypeHeader: "application/json", // or whatever
              HttpHeaders.authorizationHeader: "Bearer token",
            });
        final resBody = json.decode(result.body);
        final message = resBody['message'].toString().trim();
        final code = resBody['statusCode'];
        responseData =
            GetOtpResponseModel.fromJson(resBody['data'], message, code);
        if (code == 200) {
          yield GetOtpSuccess(responseData: responseData);
        } else {
          yield GetOtpFailed(error: message);
        }
      } catch (_) {
        yield GetOtpFailed(error: "Internal server error");
      }
    }
  }
}
