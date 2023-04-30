import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomDialogue extends StatelessWidget {
  final bool? isError;
  final bool? isSuccess;
  final bool? isAlert;
  final String? message;
  final Function()? onPressed;
  const CustomDialogue({
    Key? key,
    this.isError,
    this.isSuccess,
    this.isAlert,
    this.message,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).colorScheme.surface,
      scrollable: true,
      content: Column(
        children: [
          isSuccess == true
              ? const FaIcon(FontAwesomeIcons.circleCheck,
                  color: Colors.green, size: 60)
              : isError == true
                  ? const FaIcon(FontAwesomeIcons.circleXmark,
                      color: Colors.red, size: 60)
                  : isAlert == true
                      ? FaIcon(FontAwesomeIcons.triangleExclamation,
                          color: Colors.yellow[800], size: 60)
                      : const SizedBox.shrink(),
          const SizedBox(height: 25),
          Text(
            message ?? '',
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ],
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          onPressed: onPressed,
          child: Text(
            'Okay',
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }
}
