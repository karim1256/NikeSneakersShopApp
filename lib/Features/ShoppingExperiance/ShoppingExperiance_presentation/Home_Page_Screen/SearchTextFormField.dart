import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'SearchBody.dart';

bool search = false;

class SearchTextFormField extends StatefulWidget {
  SearchTextFormField({Key? key}) : super(key: key);

  @override
  State<SearchTextFormField> createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  final FocusNode _focusNode = FocusNode();
  @override
  @override
  void initState() {
    super.initState();

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          setState(() {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => SearchBody()));
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Container(
        width: 255,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(15)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              spreadRadius: 2, // Spread the shadow
              blurRadius: 10, // Blur effect
              offset: Offset(0, 5), // Vertical shadow position
            ),
          ],
        ),
        child: TextField(
          focusNode: _focusNode, // Attach the FocusNode

          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(15)),
              borderSide: BorderSide.none,
            ),
            label: Row(
              children: <Widget>[
                Icon(Icons.search_outlined),
                SizedBox(width: 5),
                Text("Looking for shoes"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
