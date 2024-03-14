// import 'dart:js';
//
// import 'package:api_based_web_app/Routes/route_constants.dart';
// import 'package:api_based_web_app/Screens/EditProfile.dart';
// import 'package:api_based_web_app/Screens/ErrorPage.dart';
// import 'package:api_based_web_app/Screens/dashboard.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
//
// class AppRoutes{
//   GoRouter router = GoRouter(
//     initialLocation: '/',
//     routes: [
//       GoRoute(name: MyAppRoutes.dashboard, path: '/',builder: (context, state)=> Dashboard())
//       ,
//       GoRoute(name: MyAppRoutes.editUser, path: '/edit',builder: (context,state)=> EditProfile(Data: state.uri.queryParameters, index: int.parse(state.path!),),
//       )],
//     errorBuilder: (context,state)=>ErrorPage()
//   );
// }