import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static getData() async {
    var res = await http.get(
        Uri.parse(
            "https://staging.apibento.com/api/v1/operator/vendors/list_vendors?vendor_type=restaurant&active=disabled&page=1"),
        headers: {
          HttpHeaders.authorizationHeader:
              "eyJhbGciOiJIUzI1NiJ9.eyJhdXRoX3Rva2VuIjoicGZYNkZUWUJtTUg5cjJWWWhvTlcxeXBGIiwiZXhwaXJ5IjoxNzQxODU3MDMwfQ.Q6HiTFq4LUEnDo5tIewfDiTEZh6T6g0IC1qBezdtYYE"
        });
// print(res.body);
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      return data;
    } else {
      print(res.statusCode);
    }
  }
List<dynamic>? filtered;

  getUserData(int id)async{
    await getData().then((value){
      filtered = value['data'].where((map)=> map['id'] == id).toList();
      return filtered;
    });
  }


  static postData(
    int id,
    String username,
    String email,
    String phone,
    String name,
    String type,
    String time,
    String address,
    String city,
    String bank,
    String account,
    String zone,
    String lat,
    String long,
  ) async {
    final uri = Uri.parse(
        "https://staging.apibento.com/api/v1/operator/vendors/update_vendor?id=${id}");
    final header = {
      HttpHeaders.authorizationHeader:
          "eyJhbGciOiJIUzI1NiJ9.eyJhdXRoX3Rva2VuIjoicGZYNkZUWUJtTUg5cjJWWWhvTlcxeXBGIiwiZXhwaXJ5IjoxNzQxODU3MDMwfQ.Q6HiTFq4LUEnDo5tIewfDiTEZh6T6g0IC1qBezdtYYE"
    };
    Map<String, dynamic> data = {
      'username': username,
      'email': email,
      'phone': phone,
      'vendor_name': name,
      'vendor_type': type,
      'delivery_time': time,
      'address': address,
      'city': city,
      'bank_name': bank,
      'account_number': account,
      'area_id': zone,
      'latitude': lat,
      'longitude': long,
    };
    final jsonData = jsonEncode(data);
    try {
      final response = await http.post(uri, headers: header, body: jsonData);
      if (response.statusCode == 200) {
        // Handle success
        print("POST request successful");
        print("Response: ${response.body}");
      } else {
        // Handle errors
        print("Failed to post data: ${response.statusCode}");
      }
    } catch (e) {
      // Handle exceptions
      print("Exception: $e");
    }
  }
}
