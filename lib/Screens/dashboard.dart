import 'package:api_based_web_app/Routes/route_constants.dart';
import 'package:api_based_web_app/Services/ApiService.dart';
import 'package:api_based_web_app/controller/profileController.dart';
import 'package:api_based_web_app/controller/userController.dart';
import 'package:api_based_web_app/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return GetBuilder(
      init: ProfileController(),
      builder: (controller){return Scaffold(drawer: NavigationDrawer(
        backgroundColor: Colors.deepOrangeAccent,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Dashboard",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        title: Text('All Users'), backgroundColor: Colors.deepOrangeAccent,
      ),
      body: controller.getUSerData());
    });
  }
}

