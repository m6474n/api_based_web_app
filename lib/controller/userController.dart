// import 'package:api_based_web_app/Services/ApiService.dart';
// import 'package:api_based_web_app/components/CustomButton.dart';
// import 'package:api_based_web_app/components/CustonInputField.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class UserController extends ChangeNotifier{
//  UserController(){
//    getDataFromApi();
//  }
//
//   final TextEditingController nameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController typeController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController accountController = TextEditingController();
//   final TextEditingController addressController = TextEditingController();
//   final TextEditingController cityController = TextEditingController();
//   final TextEditingController timeController = TextEditingController();
// final service = ApiService();
//   String? name, email, phone, address, type, city, time , account;
//   List<dynamic>? Data;
//
// getDataFromApi(){
//
//   notifyListeners();
// }
// getListOfData(){
//   return
// }
//
// passParams(int index){
//   nameController.text = Data![index]["vendor_info"]['vendor_name'];
//   // emailController.text = Data![index]['email'];
//   // phoneController.text = Data![index]['phone'];
//   // addressController.text = Data![index]['address'];
//   // cityController.text = Data![index]['city'];
//   // accountController.text = Data![index]['account'];
//   // typeController.text = Data![index]['account'];
//   // timeController.text = Data![index]['account'];
//   notifyListeners();
// }
//
//
//
//
//
// }