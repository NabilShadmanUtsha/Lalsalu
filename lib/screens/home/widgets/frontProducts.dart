import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:lalsalu/common/constants.dart';
import 'package:lalsalu/models/all_products.dart';

import 'package:lalsalu/screens/home/home_viewmodel.dart';
import 'package:lalsalu/screens/products/product_page_view.dart';
import 'package:lalsalu/screens/view.dart';

class FrontProduct extends StatefulWidget {
  final Products products;
  final HomeViewmodel viewmodel;
  final Function()? onTap;
  const FrontProduct(
      {super.key, required this.products, required this.viewmodel, this.onTap});

  @override
  State<FrontProduct> createState() => _FrontProductState();
}

class _FrontProductState extends State<FrontProduct> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductPageView(),
          ),
        );
      },
      child: Container(
        //margin: const EdgeInsets.only(right: 10),
        height: 290,
        width: 170,
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.white),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 160,
              width: 170,
              child: CachedNetworkImage(
                imageUrl:
                    "$imgPrefix${widget.products.file!.gallery!.first.file}",
                fit: BoxFit.cover,
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Text(
                '${widget.products.name}',
                style: theme.textTheme.caption!.copyWith(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Price : ${widget.products.price!.regular}',
                    style: theme.textTheme.headline1!.copyWith(
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            offset: Offset.fromDirection(1, 3.5),
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 3.0,
                          ),
                        ],
                        color: Colors.white,
                        border: Border.all(color: Colors.white),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.add,
                          color: Color(0xffFFAC36),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
