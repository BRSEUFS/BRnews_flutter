import 'dart:async';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:ovix/models/noticeModel.dart';

class BaseService {
  static final _dio = Dio();

  //Retorna true em caso de sucesso
  Future<bool> _checkStatusResponse(
      BuildContext context, Response response) async {
    switch (response.statusCode) {
      case 200:
        return true;
      default:
        return false;
    }
  }

  Future<T> _handleResponse<T>(BuildContext context, Response response) async {
    var respJson = NoticeResponse.fromJson(response.data);

    return respJson as T;
  }

  @protected
  Future<T> getAsync<T>(BuildContext context, String url) async {
    try {
//      var _headers = await _getHeaders();

      var response = await _dio.get(url);

      if (await _checkStatusResponse(context, response))
        return _handleResponse(context, response);
      else
        return null;
    } on DioError catch (e) {
      //await _handleError(context, e);
    }

    return null;
  }

  @protected
  Future<List<T>> getListAsync<T>(BuildContext context, String url,
      fromJson(Map<String, dynamic> json)) async {
    return null;
  }
}
