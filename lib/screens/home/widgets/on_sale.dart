import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lalsalu/screens/home/home_viewmodel.dart';
import 'package:lalsalu/screens/home/widgets/frontProducts.dart';

class OnSale extends StatefulWidget {
  final HomeViewmodel viewmodel;
  const OnSale({super.key, required this.viewmodel});

  @override
  State<OnSale> createState() => _OnSaleState();
}

class _OnSaleState extends State<OnSale> {
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
          'On Sale',
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
                childAspectRatio: 2 / 1),
            itemCount: widget.viewmodel.onSaleList!.data!.length,
            itemBuilder: (context, index) {
              return FrontProduct(
                viewmodel: widget.viewmodel,
                products: widget.viewmodel.onSaleList!.data![index],
              );
            },
          ),
        ),
      ),
    );
  }
}
