import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:secondtask_for_school_info/View/Components/reusebaleTextField.dart';
import 'package:secondtask_for_school_info/ViewModel/view_model.dart';
import 'package:secondtask_for_school_info/constant.dart';

class SchoolInfo extends StatelessWidget {
  SchoolInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
// Import this for DefaultAssetBundle
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: Primarycolor,
        leading: Icon(
          Icons.menu,
          size: 30,
        ),
        title: const Text(
          'School Info',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(60),
          ),
        ),
      ),
      body: Consumer<viewModel>(
        builder: (context, ProviderController, child) => SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset(
                  'assets/images/school.png',
                  width: 250,
                ),
              ),
              reusableTextField(ProviderController.schoolName, Icons.school,
                  ProviderController.Colorofdata),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 15,
              ),
              reusableTextField(ProviderController.schoolAddress,
                  Icons.location_on_rounded, ProviderController.Colorofdata),
              const SizedBox(
                height: 15,
              ),
              reusableTextField(ProviderController.studentsNo, Icons.person,
                  ProviderController.Colorofdata),
              const SizedBox(
                height: 15,
              ),
              reusableTextField(ProviderController.teachersNo, Icons.person,
                  ProviderController.Colorofdata),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Container(
                    width: 300,
                    height: 70,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      boxShadow: [
                        const BoxShadow(
                            color: Colors.black54,
                            offset: Offset(0, 1),
                            blurRadius: 12.0)
                      ],
                      borderRadius: BorderRadius.circular(30.0),
                      color: ProviderController.isdataShowed
                          ? Primarycolor
                          : Color(0xffe9b637),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ButtonTheme(
                        minWidth: 300,
                        child: TextButton(
                          onPressed: () async {
                            ProviderController.fetchDatafromJson(
                                context: context,
                                color: ProviderController.Colorofdata);
                            //TODO: Hint: Replace the class attributes with the data fetched from the JSON file
                          },
                          child: ProviderController.isdataShowed
                              ? Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.done,
                                        color: Colors.white,
                                        size: 30,
                                        opticalSize: 15,
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        'Showed',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 27,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )
                              : const Text(
                                  'Show Data',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 27,
                                      fontWeight: FontWeight.bold),
                                ),
                        ),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
