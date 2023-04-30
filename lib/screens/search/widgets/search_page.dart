import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lalsalu/common/custom_search_field.dart';
import 'package:lalsalu/screens/categories/categories_view.dart';
import 'package:lalsalu/screens/home/home_viewmodel.dart';
import 'package:lalsalu/screens/home/widgets/featured.dart';
import 'package:lalsalu/screens/home/widgets/frontProducts.dart';
import 'package:lalsalu/screens/home/widgets/on_sale.dart';
import 'package:lalsalu/screens/home/widgets/category_items.dart';
import 'package:lalsalu/screens/home/widgets/new_arrivals.dart';

class SearchPageBody extends StatefulWidget {
  final HomeViewmodel viewmodel;
  const SearchPageBody({super.key, required this.viewmodel});

  @override
  State<SearchPageBody> createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 10),
                CustomSearchField(
                  theme: theme,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Categories ',
                      style: theme.textTheme.headline3!.copyWith(),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => CategoriesView(
                        //       tittle: '',
                        //     ),
                        //   ),
                        // );
                      },
                      child: Text(
                        'Show all',
                        style: theme.textTheme.bodyText1!
                            .copyWith(fontSize: 12, color: Color(0xffFFAB36)),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // SizedBox(
                //   height: 120,
                //   child: GridView.builder(
                //     padding: EdgeInsets.zero,
                //     physics: const NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     gridDelegate:
                //         const SliverGridDelegateWithFixedCrossAxisCount(
                //             crossAxisCount: 4,
                //             mainAxisSpacing: 0.0,
                //             mainAxisExtent: 130,
                //             childAspectRatio: 2 / 1),
                //     itemCount: 4,
                //     itemBuilder: (context, id) {
                //       return ProductItem();
                //     },
                //   ),
                // ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'On Sale',
                      style: theme.textTheme.headline3!.copyWith(),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OnSale(
                              viewmodel: widget.viewmodel,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Show all',
                        style: theme.textTheme.bodyText1!
                            .copyWith(fontSize: 12, color: Color(0xffFFAB36)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // AspectRatio(
                //   aspectRatio: 5 / 4,
                //   child: ListView.builder(
                //       physics: const BouncingScrollPhysics(),
                //       scrollDirection: Axis.horizontal,
                //       shrinkWrap: true,
                //       itemCount: 5,
                //       itemBuilder: (context, index) {
                //         return FrontProduct(index: index);
                //       }),
                // ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Featured',
                      style: theme.textTheme.headline3!.copyWith(),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Featured(
                              viewmodel: widget.viewmodel,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Show all',
                        style: theme.textTheme.bodyText1!
                            .copyWith(fontSize: 12, color: Color(0xffFFAB36)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                // AspectRatio(
                //   aspectRatio: 5 / 4,
                //   child: ListView.builder(
                //       physics: const BouncingScrollPhysics(),
                //       scrollDirection: Axis.horizontal,
                //       shrinkWrap: true,
                //       itemCount: 5,
                //       itemBuilder: (context, index) {
                //         return FrontProduct(index: index);
                //       }),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
