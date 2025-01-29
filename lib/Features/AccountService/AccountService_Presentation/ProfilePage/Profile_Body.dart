import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/Home_Page_screen.dart';
import 'package:nikesneakersshopapp/data.dart';
import 'ProfileTextFiled.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/AccountServiceProvider.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'DiscardChange.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  @override
  @override
  Widget build(BuildContext context) {
    var p = Provider.of<AccountServiceProvider>(context);

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: p.formKey, // The form key is assigned here
          child: Column(
            children: [
              // Profile Picture
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                    ),
                    const SizedBox(height: 8),
                    TextButton(
                      onPressed: () {
                        // Functionality to change profile picture
                      },
                      child: const Text(
                        "Change Profile Picture",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),

              // Profile Fields
              ProfileField(
                  label: "firstName",
                  value: p.Profile["firstName"],
                  c: context),
              ProfileField(
                  label: "lastName", value: p.Profile["lastName"], c: context),
              ProfileField(
                  label: "address", value: p.Profile["address"], c: context),
              ProfileField(
                  label: "mobileNumber",
                  value: p.Profile["mobileNumber"],
                  c: context),

              SizedBox(height: 20),

              // Save Changes Button
              MaterialButton(
                onPressed: () {
                  // Check if the form is valid before proceeding
                  if (p.formKey.currentState?.validate() ?? false) {
                    // Save changes if form is valid
                    p.Profile = p.ChangedProfile;
                    p.SetChechChange = false;
                    print(p.GetCheckChange);
                    print(p.ChangedProfile);
                  } else {
                    // If the form is not valid, show an error message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Please correct the errors')),
                    );
                  }
                },
                child: Container(
                  width: 190,
                  height: 50,
                  decoration: BoxDecoration(
                    color: p.GetCheckChange ? Bluetheme : MainColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Save Changes',
                    style: TextStyle(
                      color: p.GetCheckChange ? ContainersColor : Bluetheme,
                      fontSize: 17,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
