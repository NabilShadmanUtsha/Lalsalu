import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String? buttonText;
  final Function()? onPressed;
  final Color buttonColor;
  final Color textColor;
  final bool? loading;
  final Widget? icon;
  const CustomButton({
    Key? key,
    this.buttonText,
    this.onPressed,
    required this.buttonColor,
    required this.textColor,
    this.loading,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return loading != true
        ? SizedBox(
            height: 50,
            child: MaterialButton(
              elevation: 0,
              minWidth: MediaQuery.of(context).size.width,
              onPressed: onPressed,
              color: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  icon != null
                      ? Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: icon,
                        )
                      : Container(),
                  Text(
                    buttonText ?? "",
                    style: Theme.of(context).textTheme.bodyText2!.copyWith(
                          color: textColor,
                        ),
                  ),
                ],
              ),
            ),
          )
        : SizedBox(
            height: 50,
            child: MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () {},
              color: buttonColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(color: textColor),
                ),
              ),
            ),
          );
  }
}
