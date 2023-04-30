import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final bool isDigit;
  final String hintText;
  final bool isObscured;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final iconData;
  final iconData2;
  final Widget? sufixText;
  final Function()? onPressed;
  final Function()? onEditingComplete;
  final Function(String)? onChanged;
  final bool? isEnabled;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final int? number;
  final Iterable<String>? autofillHints;
  final String? lable;
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.controller,
    this.validator,
    required this.isObscured,
    this.iconData,
    this.sufixText,
    this.iconData2,
    this.onPressed,
    this.onChanged,
    this.isEnabled,
    this.textInputType,
    this.number = 1,
    this.textInputAction,
    this.autofillHints,
    this.onEditingComplete,
    this.lable,
    required this.isDigit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(top: 10, bottom: 10),
      child: isObscured == false
          ? TextFormField(
              inputFormatters: isDigit == true
                  ? [FilteringTextInputFormatter.digitsOnly]
                  : null,
              onEditingComplete: onEditingComplete,
              autofillHints: autofillHints,
              maxLines: number,
              minLines: number,
              keyboardType: textInputType,
              textInputAction: textInputAction,
              enabled: isEnabled,
              onChanged: onChanged,
              obscureText: isObscured,
              controller: controller,
              validator: validator,
              style: Theme.of(context).textTheme.bodyText1,
              decoration: InputDecoration(
                errorMaxLines: 1,
                errorStyle: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.red),
                contentPadding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 20,
                ),
                filled: false,
                fillColor: Theme.of(context).colorScheme.onBackground,
                prefixIcon: iconData,
                suffixIcon: iconData2,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                hintText: hintText,
                hintStyle: Theme.of(context)
                    .textTheme
                    .bodyText2!
                    .copyWith(color: Colors.grey),
                suffix: sufixText,
                labelText: lable != null ? lable : hintText,
                labelStyle: Theme.of(context).textTheme.bodyText2,
              ),
            )
          : TextFormField(
              onEditingComplete: onEditingComplete,
              textInputAction: textInputAction,
              keyboardType: textInputType,
              enabled: isEnabled,
              onChanged: onChanged,
              obscureText: isObscured,
              controller: controller,
              validator: validator,
              style: Theme.of(context).textTheme.bodyText1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 20,
                  bottom: 20,
                ),
                filled: true,
                fillColor:
                    Theme.of(context).colorScheme.background.withOpacity(0.6),
                prefixIcon: iconData,
                suffixIcon: iconData2,
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
                errorStyle: Theme.of(context).textTheme.subtitle1,
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context)
                        .colorScheme
                        .primaryVariant
                        .withOpacity(0.6),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context)
                        .colorScheme
                        .background
                        .withOpacity(0.6),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    width: 2,
                    color: Theme.of(context)
                        .colorScheme
                        .primaryVariant
                        .withOpacity(0.6),
                  ),
                ),
                hintText: hintText,
                hintStyle: Theme.of(context).textTheme.bodyText2,
                suffix: sufixText,
                labelText: lable != null ? lable : hintText,
                labelStyle: Theme.of(context).textTheme.bodyText2,
              ),
            ),
    );
  }
}
