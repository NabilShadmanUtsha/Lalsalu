import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomTextInputField extends StatelessWidget {
  final bool isRequired;
  final String? hintText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final bool? isEnabled;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  const CustomTextInputField({
    Key? key,
    this.hintText,
    this.controller,
    this.validator,
    this.isEnabled,
    this.textInputType,
    this.textInputAction,
    required this.isRequired,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      validator: isRequired
          ? (value) {
              if (value != null && value.isEmpty) {
                return "This field is required!";
              } else {
                return null;
              }
            }
          : (value) {},
      controller: controller,
      textInputAction: textInputAction,
      keyboardType: textInputType,
      style: theme.textTheme.bodyText2,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        filled: true,
        fillColor: Theme.of(context).colorScheme.surface,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        hintText: hintText,
        labelText: hintText,
        hintStyle: TextStyle(color: theme.hintColor),
      ),
    );
  }
}
