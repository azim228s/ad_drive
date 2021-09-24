import 'package:ad_drive/presentation/base/base_presenter.dart';
import 'package:ad_drive/presentation/screens/companies_view_screen/companies_view.dart';
import 'package:ad_drive/presentation/screens/main_screen/main_view_model.dart';
import 'package:ad_drive/presentation/screens/profile_screen/profile_screen.dart';
import 'package:flutter/material.dart';

class MainPresenter extends BasePresenter<MainViewModel> {
  MainPresenter(MainViewModel model) : super(model);

  var currentTab = [
    CompaniesScreen(),
    Scaffold(
      body: Center(
        child: Text("Map"),
      ),
    ),
    ProfileScreen(),
  ];
}
