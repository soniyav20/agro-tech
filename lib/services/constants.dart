import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool loading = false;
Color primarycolor = Colors.black54;
String name = '';
String token ='';

DateTime formatthis(String input) {
  return DateTime.parse(input);
}

logged(String name,String token) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('name', name);
  prefs.setString('token', token);
  prefs.setInt('login', 1);
}

logout() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('name', '');
  prefs.setString('token', '');
  prefs.setInt('login', 0);
}

Future<int> checklogin() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  int login = prefs.getInt('login') ?? 0;
  return login;
}

Future<String> getname() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String name = prefs.getString('name') ?? '';
  return name;
}

Future<String> gettoken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String token = prefs.getString('token') ?? '';
  return token;
}
