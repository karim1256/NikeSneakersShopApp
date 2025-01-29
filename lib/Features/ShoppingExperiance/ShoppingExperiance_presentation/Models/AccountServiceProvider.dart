import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'package:nikesneakersshopapp/data.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/Products_View_Container.dart';
import 'package:nikesneakersshopapp/Core/Widgets/ProductsView.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Features/AccountService/AccountService_Presentation/ProfilePage/DiscardChange.dart';
import 'package:provider/provider.dart';

class AccountServiceProvider extends ChangeNotifier {
  bool _checkChange = false;
  bool get GetCheckChange => _checkChange;
  set SetChechChange(bool checkChange) {
    _checkChange = checkChange;
    notifyListeners();
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Map Profile = users[0]; // Profile data from users
  Map ChangedProfile = {};

  void SetprofileChange(String change, String label) {
    ChangedProfile = {
      ...Profile
    }; // Clone the Profile to ensure state is immutable
    ChangedProfile[label] = change;
    notifyListeners();
  }
  // bool _checkChange = false;

  // bool get GetCheckChange => _checkChange;

  // set SetChechChange(bool checkChange) {
  //   _checkChange = checkChange;
  //   notifyListeners();
  // }

  // bool _discard = false;

  // bool get Getdiscard => _checkChange;

  // set Setdiscard(bool discard) {
  //   _discard = discard;
  //   notifyListeners();
  // }

  // Key? FormState;
  // Map Profile = users[0];
  // Map ChangedProfile = {};

  // void SetprofileChange(String change, String label) {
  //   ChangedProfile = Profile;
  //   ChangedProfile[label] = change;

  //   notifyListeners();
  // }

  // void SavePrifileData() {
  //   Profile = ChangedProfile;
  // }

  // void NavigateFromProfile(BuildContext c, int index) {
  //   var p = Provider.of<FeatureProvider>(c, listen: false);
  //   if (GetCheckChange) {
  //     print("********there is changes******************");
  //     DiscardChange(c);
  //   } else {
  //     Navigator.pop(c);
  //   }
  // }
}
