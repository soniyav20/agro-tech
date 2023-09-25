import 'dart:convert';
import 'dart:io';

import 'package:agri/models/orders.dart';
import 'package:agri'
    '/services/services.dart';
import 'package:built_collection/built_collection.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';

String url = 'http://192.168.54.184:8080';

class ServiceImp implements Services {
  Future<int?> logIn({required String regno, required String password}) async {
    try {
      print(regno);
      print(password);
      final response = await http.post(
        Uri.parse('$url/api/login/'),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: jsonEncode(
            <String, String>{"username": "test", "password": "PQZM@1234"}),
      );
      final data = json.decode(response.body);
      print(data);
      print(data['message']);
      print("message");
      return data['message'];
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<BuiltList<Orders>?> getHistory() async {
    try {
      print("waiting for response...");
      print('http://192.168.54.184:8080/api/availableorders/');
      final response = await http.get(
        Uri.parse('http://192.168.54.184:8080/api/availableorders/'),
      );

      print(response);

      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        final List<Orders> l = <Orders>[];
        for (final dynamic data in list) {
          final Map<String, dynamic> d = data as Map<String, dynamic>;
          l.add(Orders.fromJson(d));
        }
        print(l);
        return l.toBuiltList();
      } else {
        print(response);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  @override
  Future<BuiltList<Orders>?> getHistory1() async {
    try {
      print("waiting for response...");
      print('http://192.168.54.184:8080/api/acceptedorders/?username=test');
      final response = await http.get(
        Uri.parse(
            'http://192.168.54.184:8080/api/acceptedorders/?username=test'),
      );

      print(response);

      if (response.statusCode == 200) {
        List<dynamic> list = json.decode(response.body);
        final List<Orders> l = <Orders>[];
        for (final dynamic data in list) {
          final Map<String, dynamic> d = data as Map<String, dynamic>;
          l.add(Orders.fromJson(d['order']));
        }
        print(l);
        return l.toBuiltList();
      } else {
        print(response);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  Future<void> approve({required int code}) async {
    try {
      final response = await http.post(
        Uri.parse('http://192.168.54.184:8080/api/availableorders/'),
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body:
            jsonEncode(<String, dynamic>{"username": "test", "order_id": code}),
      );
      final data = json.decode(response.body);
      print(data['detail']);
      return data['detail'];
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<void> reject({required int code}) async {
    try {
      final response = await http.post(
        Uri.parse('$url/api/faculty_requests/?faculty_id=$name'),
        body: jsonEncode(
            <String, dynamic>{"order_id": code, "status": "delivered"}),
      );
      final data = json.decode(response.body);
      print(data['detail']);
      return data['detail'];
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<int?> change({required String password}) async {
    try {
      final response = await http.post(
        Uri.parse('$url/api/change_password/'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'token $token',
        },
        body: jsonEncode(<String, dynamic>{
          "username": name,
          "type": 2,
          "password": password
        }),
      );
      final data = json.decode(response.body);
      print(data['detail']);
      return data['detail'];
    } catch (e) {
      print(e);
    }
    return null;
  }
}
