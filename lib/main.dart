import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:secondtask_for_school_info/View/school_info.dart';
import 'package:secondtask_for_school_info/ViewModel/view_model.dart';
import 'package:secondtask_for_school_info/constant.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<viewModel>(
      create: (context) => viewModel(),
      child: MaterialApp(
          title: 'know our school',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          initialRoute: "$InfoRoutePage",
          routes: {"$InfoRoutePage": (context) => SchoolInfo()}),
    );
  }
}
