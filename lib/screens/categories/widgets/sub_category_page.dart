import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:lalsalu/models/all_products.dart';
import 'package:lalsalu/models/category_tree.dart';
import 'package:lalsalu/screens/categories/categories_viewmodel.dart';
import 'package:lalsalu/screens/categories/widgets/child_category_item.dart';
import 'package:lalsalu/screens/categories/widgets/child_category_page.dart';
import 'package:lalsalu/screens/categories/widgets/product_card.dart';

class SubCategoryPage extends StatefulWidget {
  final String tittle;
  final CategoriesViewmodel viewmodel;
  final SubCategories subCategories;
  const SubCategoryPage({
    super.key,
    required this.viewmodel,
    required this.tittle,
    required this.subCategories,
  });

  @override
  State<SubCategoryPage> createState() => _MainCategoriesState();
}

class _MainCategoriesState extends State<SubCategoryPage> {
  final PagingController<int, Products> _pagingController =
      PagingController(firstPageKey: 1);

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      _fetchPages(pageKey);
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  Future<void> _fetchPages(int pageNo) async {
    try {
      await widget.viewmodel
          .getAllProducts(pageNo, '', widget.subCategories.sId!, '');
      final isLastPage =
          widget.viewmodel.allProductList!.data!.products!.length < 10;
      if (isLastPage) {
        _pagingController
            .appendLastPage(widget.viewmodel.allProductList!.data!.products!);
      } else {
        final nextPageKey = pageNo + 1;
        _pagingController.appendPage(
            widget.viewmodel.allProductList!.data!.products!, nextPageKey);
      }
    } catch (error) {
      _pagingController.error = error;
      print(error.toString());
    }
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
          widget.tittle,
          style: theme.textTheme.bodyText1!.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          children: [
            widget.subCategories.childCategories!.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: widget.subCategories.childCategories!.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ChildCategoryPage(
                                  viewmodel: widget.viewmodel,
                                  tittle: widget.subCategories
                                      .childCategories![index].name!,
                                  subCategories: widget
                                      .subCategories.childCategories![index],
                                ),
                              ),
                            );
                          },
                          child: ChildCategoryItem(
                            childCat:
                                widget.subCategories.childCategories![index],
                          ),
                        );
                      },
                    ),
                  )
                : const SizedBox.shrink(),
            Expanded(
              flex: 4,
              child: PagedGridView<int, Products>(
                padding: EdgeInsets.zero,
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 20,
                  childAspectRatio: 0.62,
                ),
                shrinkWrap: true,
                pagingController: _pagingController,
                builderDelegate: PagedChildBuilderDelegate<Products>(
                  animateTransitions: true,
                  noMoreItemsIndicatorBuilder: (context) => const Center(
                    child: Text(
                      "No more products found!",
                    ),
                  ),
                  firstPageProgressIndicatorBuilder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  newPageProgressIndicatorBuilder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                  itemBuilder: (context, item, index) => ProductCard(
                    products: item,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
