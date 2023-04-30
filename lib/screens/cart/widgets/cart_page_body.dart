import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lalsalu/common/constants.dart';
import 'package:lalsalu/common/custom_button.dart';
import 'package:lalsalu/models/all_products.dart';
import 'package:lalsalu/screens/cart/cart_page_viewmodel.dart';
import 'package:lalsalu/screens/mobile_number/mobile_number_view.dart';

import 'package:lalsalu/screens/registration_screen.dart/registration_view.dart';
import 'package:lalsalu/services/auth_services/auth_wrapper.dart';

class CartPageBody extends StatefulWidget {
  final List<Products> cartItems;
  final String phoneNumber;
  final CartPageViewmodel viewmodel;

  const CartPageBody(
      {super.key,
      required this.cartItems,
      required this.phoneNumber,
      required this.viewmodel});

  @override
  State<CartPageBody> createState() => _CartPageBodyState();
}

class _CartPageBodyState extends State<CartPageBody> {
  @override
  void initState() {
    super.initState();
  }

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
          'Cart',
          style: theme.textTheme.bodyText1!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Subtotal',
                  style: theme.textTheme.bodyText1!.copyWith(fontSize: 19),
                ),
                Text(
                  widget.cartItems.isNotEmpty
                      ? widget.cartItems
                              .map((e) => e.price!.regular)
                              .toList()
                              .reduce((value, element) => value + element)
                              .toString() +
                          ' TK'
                      : '0 TK',
                  style: theme.textTheme.bodyText1!
                      .copyWith(fontSize: 19, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 15),
            CustomButton(
              buttonColor: Theme.of(context).colorScheme.secondary,
              textColor: Colors.white,
              onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => AuthWrapper(
                            cartItems: widget.cartItems,
                          ))),
              buttonText: 'Checkout',
            ),
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: widget.viewmodel.cartItems.length,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Dismissible(
              confirmDismiss: (DismissDirection direction) async {
                return await showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirm"),
                      content: const Text(
                          "Are you sure you wish to delete this item?"),
                      actions: [
                        TextButton(
                            onPressed: () {
                              widget.cartItems.remove(widget.cartItems[index]);
                              Navigator.of(context).pop(true);
                              setState(() {});
                            },
                            child: const Text("DELETE")),
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text("CANCEL"),
                        ),
                      ],
                    );
                  },
                );
              },
              key: UniqueKey(),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.white),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 90,
                      width: 90,
                      child: CachedNetworkImage(
                        imageUrl:
                            "$imgPrefix${widget.viewmodel.cartItems[index].file!.gallery!.first.file}",
                        fit: BoxFit.cover,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.viewmodel.cartItems[index].name!,
                          style: theme.textTheme.bodyText1!.copyWith(
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "1 x TK ${widget.viewmodel.cartItems[index].price!.regular}",
                          style:
                              theme.textTheme.bodyText1!.copyWith(fontSize: 15),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  // total(List<Products> cartItems) {
  //   double sum = 0;

  //   for (var i = 0; i < cartItems.length; i++) {
  //     sum += cartItems[i].price!.regular;
  //   }
  //   return sum;
  // }
}
