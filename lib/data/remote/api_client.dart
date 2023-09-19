import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:lume_ox_app/data/remote/api_contracts.dart';
import 'package:http/http.dart' as http;
import 'package:lume_ox_app/data/remote/app_exception.dart';

class APIClient extends APIContracts {
  @override
  Future signOff(String url, String userID) async {
    dynamic responseJSON;
    try {
      if (kDebugMode) {
        print("URL: $url");
        print("User ID: $userID");
      }
      var query = {"user_id": userID};
      var uri = Uri.http(baseURL, url, query);
      final response = await http.get(uri);
      responseJSON = formatResponse(response);
    } catch (e) {
      if (e is AppException) {
        throw GenericException(e.toString());
      } else if (e is SocketException) {
        throw GenericException("Socket Exception : ${e.toString()}");
      }
    }

    return responseJSON;
  }

  @override
  Future signOn(String url, String username, String password) async {
    dynamic responseJSON;
    try {
      if (kDebugMode) {
        print("URL: $url");
        print("Username: $username");
      }
      var query = {"username": username, "password": password};
      var uri = Uri.http(baseURL, url, query);
      final response = await http.get(uri);
      responseJSON = formatResponse(response);
    } catch (e) {
      if (e is AppException) {
        throw GenericException(e.toString());
      } else if (e is SocketException) {
        throw GenericException("Socket Exception : ${e.toString()}");
      }
    }
    return responseJSON;
  }

  dynamic formatResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJSON = jsonDecode(response.body);
        return responseJSON;
      case 404:
        dynamic responseJSON = jsonDecode(response.body);
        throw GenericException(responseJSON['message']);
      default:
        throw GenericException(
            'Error occurred with status code : ${response.statusCode}');
    }
  }
}
