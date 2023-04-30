import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CityDropdown extends StatelessWidget with ChangeNotifier {
  final viewmodel;
  final isError;
  final maxWidth;
  final List<String> items;
  final city;
  final Function(String?)? onChanged;
  CityDropdown(
      {Key? key,
      this.viewmodel,
      required this.items,
      required this.isError,
      this.maxWidth,
      this.onChanged,
      this.city})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          height: 63,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surface,
            // border: Border.all(
            //   width: 2,
            //   color: isError == false
            //       ? Theme.of(context).colorScheme.background.withOpacity(0.6)
            //       : Theme.of(context).colorScheme.error,
            // ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.black,
                    ),
                value: city,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                elevation: 16,
                onChanged: onChanged,
                items: items.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Theme.of(context).hintColor,
                            ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
        isError == true
            ? Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Please select from dropdown!",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}

class CityDropdown2 extends StatelessWidget with ChangeNotifier {
  final viewmodel;
  final isError;
  final maxWidth;
  final List<String> items;
  final Function(String?)? onChanged;
  CityDropdown2(
      {Key? key,
      this.viewmodel,
      required this.items,
      required this.isError,
      this.maxWidth,
      this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          height: 60,
          constraints: BoxConstraints(
            minWidth: 100,
            maxWidth: maxWidth,
          ),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            border: Border(
              bottom: BorderSide(
                width: 2,
                color: isError == false
                    ? Theme.of(context).colorScheme.onBackground
                    : Theme.of(context).colorScheme.error,
              ),
              top: BorderSide(
                width: 2,
                color: isError == false
                    ? Theme.of(context).colorScheme.onBackground
                    : Theme.of(context).colorScheme.error,
              ),
              right: BorderSide(
                width: 2,
                color: isError == false
                    ? Theme.of(context).colorScheme.onBackground
                    : Theme.of(context).colorScheme.error,
              ),
              left: BorderSide(
                width: 2,
                color: isError == false
                    ? Theme.of(context).colorScheme.onBackground
                    : Theme.of(context).colorScheme.error,
              ),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                isExpanded: true,
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      color: Colors.white,
                    ),
                value: viewmodel.dropDownValue,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                elevation: 16,
                onChanged: onChanged,
                items: items.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: Theme.of(context).textTheme.bodyText2!.copyWith(
                              color: Colors.white,
                            ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
        ),
        isError == true
            ? Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Please select from dropdown!",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ),
                ],
              )
            : Container(),
      ],
    );
  }
}
