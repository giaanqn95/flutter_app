import 'dart:convert';

class BaseResponse {
  final String code;
  final String message;
  final dynamic data;

  BaseResponse({this.code, this.message, this.data});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      code: json['code'],
      message: json['message'],
      data: json['data'],
    );
  }
}