// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:friendly_talks/controller/HomeBloc/home_bloc.dart';

// class AppPage {
//   static List<BlocEntity> routes() {
//     return [
//       BlocEntity(
//         bloc: BlocProvider(create: (context) => HomeBloc()),
//       ),
//     ];
//   }

//   static List<dynamic> blocer(BuildContext context) {
//     List<dynamic> blocList = <dynamic>[];
//     for (var blocer in routes()) {
//       blocList.add(blocer.bloc);
//     }
//     return blocList;
//   }
// }

// class BlocEntity {
//   dynamic bloc;

//   BlocEntity({
//     required this.bloc,
//   });
// }
