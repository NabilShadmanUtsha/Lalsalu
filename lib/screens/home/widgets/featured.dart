import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:lalsalu/screens/home/home_viewmodel.dart';
import 'package:lalsalu/screens/home/widgets/frontProducts.dart';

class Featured extends StatefulWidget {
  final HomeViewmodel viewmodel;
  const Featured({super.key, required this.viewmodel});

  @override
  State<Featured> createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
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
          'Featured',
          style: theme.textTheme.bodyText1!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: GridView.builder(
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 31,
              mainAxisExtent: 300,
              childAspectRatio: 2 / 1,
            ),
            itemCount: widget.viewmodel.featuredList!.data!.length,
            itemBuilder: (context, index) {
              return FrontProduct(
                viewmodel: widget.viewmodel,
                products: widget.viewmodel.featuredList!.data![index],
              );
            },
          ),
        ),
      ),
    );
  }
}
