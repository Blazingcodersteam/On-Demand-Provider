
import 'dart:io';
import 'package:dio/dio.dart' ;
import 'package:flutter/material.dart';
// import '../Export/export.dart';
import '../Apiservice/api_service.dart';
import '../Apiclient/api_client.dart';
class ApiService {
  static final ApiService _genericApiService = ApiService._internal();
  factory ApiService() {
    return _genericApiService;
  }
  ApiService._internal();
  var basicAuth;
  // get method service call
  Future<Response> get({endpoint, adminBloc = 0, id = '0'}) async {
    var apiClient = await ApiClient().getApiClient();
    apiClient.options.headers = getHeaders();
    return apiClient.get(endpoint);
  }

  //post method service call
  Future<Response> post({endpoint, queryParameters, adminBloc = 0, id = '0'}) async {
    var apiClient = await ApiClient().getApiClient();
    apiClient.options.headers = getHeaders();
    // apiClient.options.headers["Content-Type"] = "multipart/form-data";
    return apiClient.post(endpoint, data:FormData.fromMap(queryParameters));
  }

  //post method service call

  Future<Response> formData({endpoint, queryParameters, File? file, filename}) async {
    debugPrint(queryParameters.toString());
    var documentFormData = <String, dynamic>{};
    queryParameters.forEach((k, v) {
      documentFormData[k] = v;
    });
    var formData = FormData.fromMap(documentFormData);
    var apiClient = await ApiClient().getApiClient();
    apiClient.options.headers["Content-Type"] ="multipart/form-data";
    return apiClient.post(endpoint, data: formData);
  }
  static const String CONTENT_TYPE_KEY = 'Content-type';
  static const String CONTENT_TYPE_JSON = 'multipart/form-data';
  Map<String, dynamic> getHeaders() {
    var header = <String, dynamic>{};
    header[CONTENT_TYPE_KEY] = CONTENT_TYPE_JSON;
    return header;
  }
}