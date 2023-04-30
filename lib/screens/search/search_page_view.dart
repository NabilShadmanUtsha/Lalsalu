import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:lalsalu/screens/search/search_page_viewmodel.dart';
import 'package:lalsalu/screens/search/widgets/search_page.dart';
import 'package:lalsalu/screens/view.dart';

class SearchPageView extends StatelessWidget {
  const SearchPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return View(
      builder: (_, viewmodel, __) {
        return SearchPageBody(
          viewmodel: viewmodel,
        );
      },
      viewmodel: SearchPageViewmodel(),
    );
  }
}
