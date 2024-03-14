import 'package:api_based_web_app/Routes/app_routes.dart';
import 'package:api_based_web_app/Routes/route_constants.dart';
import 'package:api_based_web_app/Screens/EditProfile.dart';
import 'package:api_based_web_app/Screens/ErrorPage.dart';
import 'package:api_based_web_app/Screens/dashboard.dart';
import 'package:api_based_web_app/controller/userController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
SharedPreferences? prefs;
void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
builder: EasyLoading.init(),
      // routerConfig: _router,
      debugShowCheckedModeBanner: false,
      routeInformationProvider: _router.routeInformationProvider,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      // home:Dashboard()
    );
  }
}
final GoRouter _router = GoRouter(
initialLocation: "/",
  routes:[
  GoRoute(name: "Dashboard", path: '/',builder: (BuildContext context, GoRouterState state) {
    return const Dashboard();
  },)
  ,
    GoRoute(name: MyAppRoutes.editUser, path: '/edit/:id',builder: (context,state) {


      final int id = int.parse(state.pathParameters['id']!);
      final data = state.extra as Map<String, dynamic>;
      return EditProfile(id: id,data: data);
    },

    )],
);

