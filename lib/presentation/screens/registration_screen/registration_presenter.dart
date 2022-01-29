import 'package:ad_drive/data/firestore.dart';
import 'package:ad_drive/data/shared_preferences.dart';
import 'package:ad_drive/model/card.dart';
import 'package:ad_drive/model/user.dart';
import 'package:ad_drive/presentation/base/base_presenter.dart';
import 'package:ad_drive/presentation/screens/main_screen/main_screen.dart';
import 'package:ad_drive/presentation/screens/registration_screen/registration_view_model.dart';
import 'package:flutter/material.dart';

class RegistrationPresenter extends BasePresenter<RegistrationViewModel> {
  RegistrationPresenter(RegistrationViewModel model) : super(model);

  TextEditingController fullNameController = TextEditingController();

  late final String phoneNumber;
  late final String uid;

  final formKey = GlobalKey<FormState>();

  var cities = [
    "Almaty",
    "Nur-Sultan",
    "Shymkent",
  ];

  late String selectedCity;

  @override
  void onInitWithContext() async {
    super.onInitWithContext();
  }

  void onChanged(String newValue) {
    selectedCity = newValue;
    updateView();
  }

  void addUserToDatabase() {
    model.entering = true;
    model.userModel = UserData(
      uid: uid,
      city: selectedCity,
      username: fullNameController.text,
      phoneNumber: phoneNumber,
      //TODO: add opportunity to add avatar from camera and gallery
      avatarUrl: "",
      documents: [],
      cardModel: CardModel.empty(),
    );
    userScope.userData = model.userModel;
    addUser();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (builder) => MainScreen(user: model.userModel),
      ),
    );
  }

  void addUser() async {
    await SharedPreferencesRepository().addUserData(model.userModel);
    FireStoreInstance().addUser(model.userModel);
  }
}
