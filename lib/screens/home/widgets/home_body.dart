import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lalsalu/common/constants.dart';
import 'package:lalsalu/screens/cart/cart_page_view.dart';

import 'package:lalsalu/screens/home/home_viewmodel.dart';
import 'package:lalsalu/screens/home/widgets/catProducts.dart';

import 'package:lalsalu/screens/home/widgets/featured.dart';
import 'package:lalsalu/screens/home/widgets/frontProducts.dart';

import 'package:lalsalu/screens/home/widgets/on_sale.dart';
import 'package:lalsalu/screens/home/widgets/category_items.dart';

import 'package:lalsalu/screens/home/widgets/new_arrivals.dart';
import 'package:lalsalu/screens/search/search_page_view.dart';
import 'package:lalsalu/screens/viewmodel.dart';

import 'package:shimmer/shimmer.dart';

class HomeBody extends StatefulWidget {
  final HomeViewmodel viewmodel;

  const HomeBody({Key? key, required this.viewmodel}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  PageController pageController = PageController(initialPage: 0);
  @override
  void initState() {
    super.initState();

    // get from cached data
    widget.viewmodel.getBannerLanding();
    widget.viewmodel.getSliders();
    widget.viewmodel.getNewArrival();
    widget.viewmodel.getOnSale();
    widget.viewmodel.getFeatured();
    widget.viewmodel.getCategories();
    widget.viewmodel.getCategoryProducts();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return widget.viewmodel.isLoading == false
        ? RefreshIndicator(
            onRefresh: () async {
              widget.viewmodel.isLoading = true;
              widget.viewmodel.getBannerLanding();
              widget.viewmodel.getSliders();
              widget.viewmodel.getNewArrival();
              widget.viewmodel.getOnSale();
              widget.viewmodel.getFeatured();
              widget.viewmodel.getCategories();
              widget.viewmodel.getCategoryProducts();
              Future.delayed(const Duration(seconds: 1), () {
                widget.viewmodel.isLoading = false;
              });
            },
            child: Scaffold(
              bottomNavigationBar: widget.viewmodel.cartItems.isNotEmpty
                  ? Padding(
                      padding: const EdgeInsets.all(10),
                      child: MaterialButton(
                        height: 45,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                            color: Theme.of(context).colorScheme.onBackground,
                            width: 0.8,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CartPageView(
                                cartItems: widget.viewmodel.cartItems,
                              ),
                            ),
                          );
                        },
                        minWidth: double.infinity,
                        color: Theme.of(context).colorScheme.primary,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.viewmodel.cartItems.isNotEmpty
                                  ? '${widget.viewmodel.cartItems.map((e) => e.price!.regular).toList().reduce((value, element) => value + element)} TK'
                                  : '',
                              style: theme.textTheme.button!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'View Cart  ',
                              style: theme.textTheme.button!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '${widget.viewmodel.cartItems.length}',
                              style: theme.textTheme.button!.copyWith(
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
              appBar: AppBar(
                  elevation: 0,
                  backgroundColor:
                      Theme.of(context).appBarTheme.backgroundColor,
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 50,
                        child: Image(
                          image: AssetImage('assets/images/lalsalu_logo.png'),
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            child: SvgPicture.asset("assets/svg/search.svg"),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SearchPageView(),
                                ),
                              );
                            },
                          ),
                          const SizedBox(width: 20),
                          SvgPicture.asset("assets/svg/local_mall.svg")
                        ],
                      )
                    ],
                  )),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    widget.viewmodel.appBannerList != null
                        ? Container(
                            height: 204,
                            child: Stack(
                              children: [
                                PageView.builder(
                                  onPageChanged: (index) {
                                    widget.viewmodel.currentPosition = index;
                                  },
                                  controller: pageController,
                                  itemCount: widget
                                      .viewmodel.appBannerList!.data!.length,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: CachedNetworkImageProvider(
                                              imgPrefix +
                                                  widget
                                                      .viewmodel
                                                      .appBannerList!
                                                      .data![index]
                                                      .photo!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Positioned(
                                  top: 120,
                                  left: 10,
                                  right: 10,
                                  bottom: 1,
                                  child: Container(
                                    padding: const EdgeInsets.all(30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: List.generate(
                                        widget.viewmodel.appBannerList!.data!
                                            .length,
                                        (index) => buildDot(index, context),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    const SizedBox(height: 10),
                    widget.viewmodel.categoryList != null
                        ? Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Categories ',
                                      style:
                                          theme.textTheme.headline3!.copyWith(),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                SizedBox(
                                  height: 120,
                                  child: GridView.builder(
                                    padding: EdgeInsets.zero,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    shrinkWrap: true,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 4,
                                            mainAxisSpacing: 0.0,
                                            mainAxisExtent: 130,
                                            childAspectRatio: 2 / 1),
                                    itemCount: widget
                                        .viewmodel.categoryList!.data!.length,
                                    itemBuilder: (context, index) {
                                      return CategoryItem(
                                        categories: widget.viewmodel
                                            .categoryList!.data![index],
                                      );
                                    },
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'New Arrivals',
                                      style:
                                          theme.textTheme.headline3!.copyWith(),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => NewArrivals(
                                              viewmodel: widget.viewmodel,
                                            ),
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Show all',
                                        style: theme.textTheme.bodyText1!
                                            .copyWith(
                                                fontSize: 12,
                                                color: Color(0xffFFAB36)),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                widget.viewmodel.newArrivalList != null
                                    ? AspectRatio(
                                        aspectRatio: 5 / 4,
                                        child: ListView.builder(
                                          physics:
                                              const BouncingScrollPhysics(),
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: widget.viewmodel
                                              .newArrivalList!.data!.length,
                                          itemBuilder: (context, index) {
                                            return Container(
                                              margin: const EdgeInsets.only(
                                                right: 15,
                                              ),
                                              child: FrontProduct(
                                                onTap: () {
                                                  widget.viewmodel
                                                      .addToCartLocal(widget
                                                          .viewmodel
                                                          .newArrivalList!
                                                          .data![index]);
                                                  setState(() {});
                                                },
                                                products: widget
                                                    .viewmodel
                                                    .newArrivalList!
                                                    .data![index],
                                                viewmodel: widget.viewmodel,
                                              ),
                                            );
                                          },
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'On Sale',
                                      style:
                                          theme.textTheme.headline3!.copyWith(),
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
                                            .copyWith(
                                                fontSize: 12,
                                                color: Color(0xffFFAB36)),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 10),
                                widget.viewmodel.onSaleList != null
                                    ? AspectRatio(
                                        aspectRatio: 5 / 4,
                                        child: ListView.builder(
                                            physics:
                                                const BouncingScrollPhysics(),
                                            scrollDirection: Axis.horizontal,
                                            shrinkWrap: true,
                                            itemCount: widget.viewmodel
                                                .onSaleList!.data!.length,
                                            itemBuilder: (context, index) {
                                              return FrontProduct(
                                                onTap: () {
                                                  widget.viewmodel.cartItems
                                                      .add(widget
                                                          .viewmodel
                                                          .onSaleList!
                                                          .data![index]);
                                                  setState(() {});
                                                },
                                                products: widget.viewmodel
                                                    .onSaleList!.data![index],
                                                viewmodel: widget.viewmodel,
                                              );
                                            }),
                                      )
                                    : const SizedBox.shrink(),
                                const SizedBox(height: 20),
                                widget.viewmodel.featuredList != null &&
                                        widget.viewmodel.featuredList!.data!
                                            .isNotEmpty
                                    ? Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Featured',
                                                style: theme
                                                    .textTheme.headline3!
                                                    .copyWith(),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Featured(
                                                        viewmodel:
                                                            widget.viewmodel,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Text(
                                                  'Show all',
                                                  style: theme
                                                      .textTheme.bodyText1!
                                                      .copyWith(
                                                          fontSize: 12,
                                                          color: const Color(
                                                              0xffFFAB36)),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          AspectRatio(
                                            aspectRatio: 5 / 4,
                                            child: ListView.builder(
                                              physics:
                                                  const BouncingScrollPhysics(),
                                              scrollDirection: Axis.horizontal,
                                              shrinkWrap: true,
                                              itemCount: widget.viewmodel
                                                  .featuredList!.data!.length,
                                              itemBuilder: (context, index) {
                                                return FrontProduct(
                                                  onTap: () {
                                                    widget.viewmodel.cartItems
                                                        .add(widget
                                                            .viewmodel
                                                            .featuredList!
                                                            .data![index]);
                                                    setState(() {});
                                                  },
                                                  products: widget
                                                      .viewmodel
                                                      .featuredList!
                                                      .data![index],
                                                  viewmodel: widget.viewmodel,
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                    : const SizedBox.shrink(),
                                const SizedBox(height: 20),
                              ],
                            ),
                          )
                        : const SizedBox.shrink(),
                    widget.viewmodel.appSliderList != null
                        ? CarouselSlider.builder(
                            itemCount:
                                widget.viewmodel.appSliderList!.data!.length,
                            options: CarouselOptions(
                              viewportFraction: 0.8,
                              initialPage: 0,
                              enableInfiniteScroll: true,
                              reverse: false,
                              autoPlay: true,
                              autoPlayInterval: const Duration(seconds: 3),
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enlargeCenterPage: false,
                              scrollDirection: Axis.horizontal,
                            ),
                            itemBuilder: (context, index, int pageViewIndex) =>
                                AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 2000),
                              child: FadeInAnimation(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10, bottom: 10, left: 20),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(0),
                                    child: Image(
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return loadingBannerImage(context);
                                      },
                                      image: CachedNetworkImageProvider(
                                          imgPrefix +
                                              widget.viewmodel.appSliderList!
                                                  .data![index].photo!),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ),
                    const SizedBox(height: 10),
                    widget.viewmodel.cProductList != null
                        ? ListView.builder(
                            padding: EdgeInsets.zero,
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount:
                                widget.viewmodel.cProductList!.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          widget.viewmodel.cProductList!
                                              .data![index].name!,
                                          style: theme.textTheme.headline3!
                                              .copyWith(),
                                        ),
                                        // TextButton(
                                        //   onPressed: () {
                                        //     Navigator.push(
                                        //       context,
                                        //       MaterialPageRoute(
                                        //         builder: (context) => MensClothing(),
                                        //       ),
                                        //     );
                                        //   },
                                        //   child: Text(
                                        //     'Show all',
                                        //     style: theme.textTheme.bodyText1!
                                        //         .copyWith(
                                        //             fontSize: 12,
                                        //             color: const Color(
                                        //                 0xffFFAB36)),
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    AspectRatio(
                                      aspectRatio: 9 / 8,
                                      child: ListView.builder(
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.horizontal,
                                        shrinkWrap: true,
                                        itemCount: widget.viewmodel
                                            .cProductList!.data!.length,
                                        itemBuilder: (context, index2) {
                                          return Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 30),
                                            child: CategoryProductsWidget(
                                              onTap: () {
                                                widget.viewmodel.cartItems.add(
                                                    widget
                                                        .viewmodel
                                                        .cProductList!
                                                        .data![index]
                                                        .products![index2]);
                                                setState(() {});
                                              },
                                              products: widget
                                                  .viewmodel
                                                  .cProductList!
                                                  .data![index]
                                                  .products![index2],
                                              viewmodel: widget.viewmodel,
                                            ),
                                          );
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          )
        : const CircularProgressIndicator();
  }

  SizedBox loadingBannerImage(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[800]!,
        highlightColor: Colors.grey,
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.grey[800],
            borderRadius: BorderRadius.circular(20),
          ),
          child: const Center(
            child: Text(""),
          ),
        ),
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: widget.viewmodel.currentPosition == index ? 25 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: widget.viewmodel.currentPosition == index
            ? Colors.black
            : const Color(0xFFD9D9D9),
      ),
    );
  }
}
