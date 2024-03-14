// import 'package:api_based_web_app/Routes/route_constants.dart';
// import 'package:go_router/go_router.dart';
//
// class Dashboard extends GoRouter {
//
//   List routes = [
//     GoRoute(name: MyAppRoutes.dashboard, path: '/',builder: (context, state)=> Dashboard())
//
//   ];
// }
//
// class EditScreen extends GoRouter {
//   final String parameter1;
//   final String parameter2;
//   // Define more parameters as needed
//
//   Screen2Route({
//     required this.parameter1,
//     required this.parameter2,
//     // Add more parameters as needed
//   });
//
//   @override
//   String? location = '/screen2';
//
//   @override
//   List<GoRouterChild> routes = [
//     GoRouterChild(
//       path: '/screen2',
//       builder: (BuildContext context, GoRouterState state) => Screen2(
//         parameter1: state.params['parameter1'] ?? '',
//         parameter2: state.params['parameter2'] ?? '',
//         // Extract more parameters as needed
//       ),
//     ),
//   ];
// }
