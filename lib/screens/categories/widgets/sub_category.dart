import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubCategory extends StatelessWidget {
  const SubCategory({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset('assets/svg/back.svg'),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text(
          'Categories',
          style: theme.textTheme.bodyText1!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
          margin: const EdgeInsets.all(20),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                child: ExpansionTile(
                  childrenPadding: const EdgeInsets.all(20),
                  backgroundColor: Colors.white,
                  collapsedBackgroundColor: Colors.white,
                  title: Text('Shirt'),
                  iconColor: Colors.black,
                  expandedAlignment: Alignment.topLeft,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Full Sleeve Shirt',
                        style: theme.textTheme.bodyText1!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Half Sleeve Shirt',
                        style: theme.textTheme.bodyText1!.copyWith(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
            itemCount: 5,
          )),
    );
  }
}
