import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

String username = 'demo-client';
String password = 'demo-secret';
String basicAuth = 'Basic ${base64.encode(utf8.encode('$username:$password'))}';

class RestService {
  final String _baseUrl;

  const RestService({@required baseUrl}) : _baseUrl = baseUrl;

  Future get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {
        'Authorization': basicAuth,
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw response.statusCode;
  }

  Future getWithToken(String endpoint) async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    final response = await http.get(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 202) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      return jsonDecode(response.body);
    }
    throw response.statusCode;
  }

  Future post(String endpoint, {dynamic data}) async {
    final response = await http.post(Uri.parse('$_baseUrl/$endpoint'),
        headers: {
          'Authorization': basicAuth,
          'Content-Type': 'application/json'
        },
        body: json.encode(data));
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 201) {
      //debugPrint(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else if (response.statusCode == 422) {
      final data = jsonDecode(response.body);
      debugPrint(data['stack'].toString());
      return jsonDecode(response.body);
    } else if (response.statusCode == 202) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 406) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 400) {
      return jsonDecode(response.body);
    } else {
      throw response.statusCode;
    }
  }

  Future postWithToken(String endpoint, {dynamic data}) async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    final response = await http.post(Uri.parse('$_baseUrl/$endpoint'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json'
        },
        body: json.encode(data));
    if (response.statusCode == 202) {
      //debugPrint(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else if (response.statusCode == 201) {
      //debugPrint(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else if (response.statusCode == 422) {
      final data = jsonDecode(response.body);
      debugPrint(data['stack']);
      return data['stack'];
    } else if (response.statusCode == 406) {
      final data = jsonDecode(response.body);
      return data;
    } else {
      debugPrint(response.body);
      throw response.statusCode;
    }
  }

  Future refrshToken(String endpoint) async {
    const storage = FlutterSecureStorage();
    String? rtoken = await storage.read(key: 'rtoken');
    String? token = await storage.read(key: 'token');
    final response = await http.post(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {
        'Authorization': basicAuth,
        //'Content-Type': 'application/json',
      },
      body: {
        'access': '$token',
        'refresh': '$rtoken',
      },
    );
    debugPrint(response.statusCode.toString());
    if (response.statusCode == 201) {
      //debugPrint(jsonDecode(response.body));
      return jsonDecode(response.body);
    } else if (response.statusCode == 422) {
      final data = jsonDecode(response.body);
      //debugPrint(data);
      return data;
    } else {
      throw response.statusCode;
    }
  }

  Future put(String endpoint, {dynamic data}) async {
    const storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    //debugPrint(token);
    final response = await http.put(Uri.parse('$_baseUrl/$endpoint'),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: json.encode(data));

    //debugPrint(response.body);
    if (response.statusCode == 202) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 422) {
      final data = jsonDecode(response.body);
      debugPrint(data['stack']);
      return data;
    } else if (response.statusCode == 400) {
      final data = jsonDecode(response.body);
      debugPrint(data['stack']);
      return data;
    } else {
      throw response.statusCode;
    }
  }

  Future putWithBasic(String endpoint, {dynamic data}) async {
    final response = await http.put(Uri.parse('$_baseUrl/$endpoint'),
        headers: {
          'Authorization': basicAuth,
          'Content-Type': 'application/json',
        },
        body: json.encode(data));

    //debugPrint(response.body);
    if (response.statusCode == 202) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 406) {
      final data = jsonDecode(response.body);
      return data;
    } else if (response.statusCode == 422) {
      final data = jsonDecode(response.body);
      debugPrint(data['stack']);
      return data;
    } else if (response.statusCode == 400) {
      final data = jsonDecode(response.body);
      debugPrint(data['stack']);
      return data;
    } else {
      throw response.statusCode;
    }
  }

  Future logout(String endpoint) async {
    final storage = FlutterSecureStorage();
    String? token = await storage.read(key: 'token');
    final response = await http.delete(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 202) {
      storage.deleteAll();
      return jsonDecode(response.body);
    } else {
      storage.deleteAll();
      return jsonDecode(response.body);
    }
  }
}
