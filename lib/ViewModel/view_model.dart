import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:secondtask_for_school_info/JSONdata/readJsonData/jsondatasevices.dart';
import 'package:secondtask_for_school_info/Model/model.dart';
import 'package:secondtask_for_school_info/constant.dart';

class viewModel with ChangeNotifier {
  String _schoolName = "School Name";
  String get schoolName => _schoolName;

  String _schoolAddress = "School Address";
  String get schoolAddress => _schoolAddress;

  String _studentsNo = "Number of Students";
  String get studentsNo => _studentsNo;

  String _teachersNo = "Number of Teachers";
  String get teachersNo => _teachersNo;
  Color _Colorofdata = EmptyColorData;
  Color get Colorofdata => _Colorofdata;

  bool _isdataShowed = false;
  bool get isdataShowed => _isdataShowed;

//Method for fetchDatafromJson
  Future<List<JsonDataModel>> fetchDatafromJson(
      {required BuildContext context, @required Color? color}) async {
    //for toggel between showData and reset
    _isdataShowed = !_isdataShowed;
    notifyListeners();

    try {
      // method for readDatafromJason convert to String and decode it.... etc
      List<Map<String, dynamic>> data =
          await JsonConverterClass.readDatafromJason(context,
              pathJasonFile: constPathJsonfile);

      List<JsonDataModel> _schoolModels = [];
      for (var school in data) {
        // Use the factory constructor to create a JsonDataModel instance
        JsonDataModel model = JsonDataModel.fromJson(school);
        _schoolModels.add(model);
      }
      _schoolName = _isdataShowed ? _schoolModels[0].schoolName : "School Name";
      _schoolAddress =
          _isdataShowed ? _schoolModels[0].schoolAddress : "School Address";
      _studentsNo = _isdataShowed
          ? _schoolModels[0].numberOfStudents
          : "Number of Students";
      _teachersNo = _isdataShowed
          ? _schoolModels[0].numberOfTeachers
          : "Number of Teachers";
      _Colorofdata = _isdataShowed ? Primarycolor : EmptyColorData;
      notifyListeners();
      return _schoolModels!;
    } catch (e) {
      print("Error fetching data: $e");
      return [];
    }
  }

//this method For rest Felids from json Data but  not use maybe use it in Future
}
