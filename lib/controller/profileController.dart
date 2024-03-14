import 'dart:js';

import 'package:api_based_web_app/Routes/route_constants.dart';
import 'package:api_based_web_app/components/CustomButton.dart';
import 'package:api_based_web_app/components/CustonInputField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../Services/ApiService.dart';

class ProfileController extends GetxController {
  List<dynamic>? Data;
  Map<String, dynamic>? filteredList;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController accountController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController timeController = TextEditingController();

  getUSerData() {
    return Data == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: EdgeInsets.only(
              top: 32,
            ),
            child: ListView.builder(
                itemCount: Data!.length,
                itemBuilder: (context, index) {
                  nameController.text = Data![index]["vendor_info"]['vendor_name'];
                  emailController.text = Data![index]['email'];
                  phoneController.text = Data![index]["vendor_info"]['vendor_phone_number'];
                  cityController.text = Data![index]["vendor_info"]['city'];
                  addressController.text = Data![index]["vendor_info"]['address'];
                  typeController.text = Data![index]["vendor_info"]['vendor_type'];
                  timeController.text = Data![index]["vendor_info"]['delivery_time'];
                  accountController.text = Data![index]["vendor_info"]['account_number'];
                  // filteredList = Data![index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 38),
                    child: Card(
                      child: ListTile(
                        title: Text(
                          Data![index]['vendor_info']['vendor_name'],
                          style: TextStyle(
                              color: Colors.deepOrangeAccent, fontSize: 22),
                        ),
                        subtitle: Text(Data![index]['email']),
                        trailing: IconButton(
                          onPressed: () {
                            context.goNamed(MyAppRoutes.editUser,
                                pathParameters: {
                                  'id': Data![index]['id'].toString()
                                },
                                extra: Data![index]);
                            print(Data![index]);
                            // updateFields(index);
                          },
                          icon: Icon(Icons.edit),
                        ),
                      ),
                    ),
                  );
                }),
          );
  }

  updateFields(int index) {
    nameController.text = Data![index]["vendor_info"]['vendor_name'];
    emailController.text = Data![index]['email'];
    phoneController.text = Data![index]["vendor_info"]['vendor_phone_number'];
    cityController.text = Data![index]["vendor_info"]['city'];
    addressController.text = Data![index]["vendor_info"]['address'];
    typeController.text = Data![index]["vendor_info"]['vendor_type'];
    timeController.text = Data![index]["vendor_info"]['delivery_time'];
    accountController.text = Data![index]["vendor_info"]['account_number'];
    update();
  }

  updateProfile() {}

  editUserProfile(BuildContext context,Map<String, dynamic> data) {
    return ListView(children: [
      Text(
        "Vendor Info: ",
        style: TextStyle(
            fontSize: 22,
            color: Colors.deepOrangeAccent,
            fontWeight: FontWeight.bold),
      ),
      Row(
        children: [
          Expanded(
            child: InputField(
              hint: "Vender Name",
              label: "Vendor Name",
              controller: nameController,
            ),
          ),
          Expanded(
            child: InputField(
              hint: "Vender Email",
              label: "Vendor Email",
              controller: emailController,
            ),
          )
        ],
      ),
      Row(
        children: [
          Expanded(
              child: InputField(
            hint: "Enter type",
            label: "Vendor Type",
            controller: typeController,
          )),
          Expanded(
              child: InputField(
            hint: "Enter Phone",
            label: "Phone",
            controller: phoneController,
          ))
        ],
      ),
      Row(
        children: [
          Expanded(
              child: InputField(
            hint: "Enter City",
            label: "City",
            controller: cityController,
          )),
          Expanded(
              child: InputField(
            hint: "Enter Time",
            label: "Delivery Time",
            controller: timeController,
          )),
          Expanded(
              child: InputField(
            hint: "Enter Account No.",
            label: "Account No.",
            controller: accountController,
          ))
        ],
      ),
      InputField(
        hint: "Enter Address",
        label: "Address",
        controller: addressController,
      ),
      Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0, top: 10),
            child: CustomButton(
              label: "Update",
              onTap: () {
                ApiService.postData(
                    data['id'],
                    data['username'].toString(),
                    emailController.text,
                    phoneController.text,
                    nameController.text,
                    typeController.text,
                    timeController.text,
                    addressController.text,
                    cityController.text,
                    data['settlement_bank'].toString(),
                    accountController.text,
                    data['area_id'].toString(),
                    data['latitude'].toString(),
                    data['longitude'].toString());
                // getSpecificMap();
                context.go("/");
              },
            ),
          )),
    ]);
  }

  getSpecificMap() {
    List<dynamic> filteredList = Data!.where((map) => map['id'] == 64).toList();
    print(filteredList);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    ApiService.getData().then((value) {
      Data = value['data'];
      update();
    });
    super.onInit();
  }
}
