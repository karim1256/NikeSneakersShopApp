import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/AccountServiceProvider.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';

class ProfileField extends StatefulWidget {
  final String label;
  final String value;
  final BuildContext c;

  ProfileField({
    Key? key,
    required this.label,
    required this.value,
    required this.c,
  }) : super(key: key);

  @override
  State<ProfileField> createState() => _ProfileFieldState();
}

class _ProfileFieldState extends State<ProfileField> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) {
    var p = Provider.of<AccountServiceProvider>(context);
    String? Function(String?)? validator;

    // Validator logic based on the label
    switch (widget.label) {
      case "firstName":
        validator = (value) => value == null || value.isEmpty
            ? 'Please enter your first name'
            : null;
        break;
      case "lastName":
        validator = (value) => value == null || value.isEmpty
            ? 'Please enter your last name'
            : null;
        break;
      case 'address':
        validator = (value) =>
            value == null || value.isEmpty ? 'Please enter your address' : null;
        break;
      case 'mobileNumber':
        validator = (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your mobile number';
          }
          if (RegExp(r'^[0-9]$').hasMatch(value)) {
            return 'Please enter a valid mobile number';
          }
          if (value.length < 8) {
            return 'mobile number is to short';
          }
          return null;
        };
        break;
      default:
        validator = (value) => value == null || value.isEmpty
            ? 'This field cannot be empty'
            : null;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Bluetheme,
            ),
          ),
          const SizedBox(height: 4),
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              fillColor: MainColor,
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: BorderSide.none,
              ),
              suffixIcon: Icon(
                Icons.check,
                color:
                    validator(widget.label) != null ? Colors.red : Colors.green,
              ),
            ),
            validator: validator,
            onChanged: (v) {
              p.SetChechChange = true;
              p.SetprofileChange(v, widget.label);
            },
          ),
        ],
      ),
    );
  }
}
