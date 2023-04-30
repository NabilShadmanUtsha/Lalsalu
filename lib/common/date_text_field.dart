import 'package:flutter/material.dart';

class DateTextField extends StatefulWidget {
  final onTap;
  final controller;
  final hintText;
  const DateTextField({
    Key? key,
    this.onTap,
    this.controller,
    required this.hintText,
  }) : super(key: key);

  @override
  State<DateTextField> createState() => _DateTextFieldState();
}

class _DateTextFieldState extends State<DateTextField> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return TextFormField(
      controller: widget.controller,
      style: theme.textTheme.bodyText2,
      autofocus: true,
      decoration: InputDecoration(
        suffixIcon: Padding(
          padding: const EdgeInsets.all(10),
          child: Icon(
            Icons.calendar_month_rounded,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
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
        hintText: widget.hintText,
        labelText: widget.hintText,
        hintStyle: TextStyle(color: theme.hintColor),
      ),
      readOnly: true,
      onTap: widget.onTap,
    );
  }
}
