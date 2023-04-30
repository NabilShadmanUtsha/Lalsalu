import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class CustomOAuthButton extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  final Color buttonColor;

  final Color textColor;
  final String svgLoc;
  const CustomOAuthButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.buttonColor,
    required this.textColor,
    required this.svgLoc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        onPressed: onPressed,
        color: buttonColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.onBackground,
            width: 0.8,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgLoc,
              color: Theme.of(context).colorScheme.onBackground,
            ),
            const SizedBox(
              width: 20,
            ),
            Text(
              buttonText,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }
}
