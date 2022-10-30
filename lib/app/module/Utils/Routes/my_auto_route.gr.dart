// // **************************************************************************
// // AutoRouteGenerator
// // **************************************************************************

// // GENERATED CODE - DO NOT MODIFY BY HAND

// // **************************************************************************
// // AutoRouteGenerator
// // **************************************************************************
// //
// // ignore_for_file: type=lint

// // ignore_for_file: no_leading_underscores_for_library_prefixes
// import 'package:auto_route/auto_route.dart' as _i4;
// import 'package:flutter/material.dart' as _i5;

// import '../../Screens/DocumentationPages/a_doc_page_overview.dart' as _i2;
// import '../../Screens/DocumentationPages/b_doc_page_overview.dart' as _i3;
// import '../../Screens/DocumentationPages/getting_started_page.dart' as _i1;

// class AppRouter extends _i4.RootStackRouter {
//   AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
//       : super(navigatorKey);

//   @override
//   final Map<String, _i4.PageFactory> pagesMap = {
//     GettingStartedDOCRoute.name: (routeData) {
//       return _i4.MaterialPageX<dynamic>(
//           routeData: routeData, child: const _i1.GettingStartedDOC());
//     },
//     ADocPageOverViewRoute.name: (routeData) {
//       return _i4.MaterialPageX<dynamic>(
//           routeData: routeData, child: const _i2.ADocPageOverView());
//     },
//     BDocPageOverViewRoute.name: (routeData) {
//       return _i4.MaterialPageX<dynamic>(
//           routeData: routeData, child: const _i3.BDocPageOverView());
//     }
//   };

//   @override
//   List<_i4.RouteConfig> get routes => [
//         _i4.RouteConfig('/#redirect',
//             path: '/',
//             redirectTo: '/getting_started_doc_path',
//             fullMatch: true),
//         _i4.RouteConfig(GettingStartedDOCRoute.name,
//             path: '/getting_started_doc_path'),
//         _i4.RouteConfig(ADocPageOverViewRoute.name, path: '/a_doc_path'),
//         _i4.RouteConfig(BDocPageOverViewRoute.name, path: '/b_doc_path')
//       ];
// }

// /// generated route for
// /// [_i1.GettingStartedDOC]
// class GettingStartedDOCRoute extends _i4.PageRouteInfo<void> {
//   const GettingStartedDOCRoute()
//       : super(GettingStartedDOCRoute.name, path: '/getting_started_doc_path');

//   static const String name = 'GettingStartedDOCRoute';
// }

// /// generated route for
// /// [_i2.ADocPageOverView]
// class ADocPageOverViewRoute extends _i4.PageRouteInfo<void> {
//   const ADocPageOverViewRoute()
//       : super(ADocPageOverViewRoute.name, path: '/a_doc_path');

//   static const String name = 'ADocPageOverViewRoute';
// }

// /// generated route for
// /// [_i3.BDocPageOverView]
// class BDocPageOverViewRoute extends _i4.PageRouteInfo<void> {
//   const BDocPageOverViewRoute()
//       : super(BDocPageOverViewRoute.name, path: '/b_doc_path');

//   static const String name = 'BDocPageOverViewRoute';
// }
