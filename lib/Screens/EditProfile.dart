import 'package:api_based_web_app/components/CustomButton.dart';
import 'package:api_based_web_app/components/CustonInputField.dart';
import 'package:api_based_web_app/controller/profileController.dart';
import 'package:api_based_web_app/controller/userController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class EditProfile extends StatefulWidget {
  final Map<String,dynamic> data;
final int id;
  const EditProfile({super.key, required this.id, required this.data,});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  ProfileController controller = Get.put(ProfileController());
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
}
  @override
  Widget build(BuildContext context) {

    return Scaffold(body: Padding(
      padding: const EdgeInsets.all(18.0),
      child:controller.editUserProfile(context ,widget.data!)
    ),);
  }
}
