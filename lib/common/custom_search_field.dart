import 'package:flutter/material.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).hintColor,
        ),
        contentPadding: const EdgeInsets.all(20),
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
        hintText: "Search...",
        hintStyle: TextStyle(color: theme.hintColor),
      ),
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      //controller: phoneNumberController,
      validator: (value) {
        if (value!.isEmpty || value.length < 10) {
          return "A valid phone no. is required!";
        }
        return null;
      },
    );
  }
}
