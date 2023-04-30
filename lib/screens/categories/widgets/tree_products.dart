// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:lalsalu/common/constants.dart';
// import 'package:lalsalu/models/category_tree.dart';
// import 'package:lalsalu/screens/products/product_page_view.dart';

// class TreeProducts extends StatefulWidget {
//   final Data products;
//   final int index;
//   const TreeProducts({super.key, required this.products, required this.index});

//   @override
//   State<TreeProducts> createState() => _TreeProductsState();
// }

// class _TreeProductsState extends State<TreeProducts> {
//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);

//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProductPageView(),
//           ),
//         );
//       },
//       child: Container(
//         margin: const EdgeInsets.only(right: 10),
//         height: 290,
//         width: 170,
//         padding: const EdgeInsets.all(7),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           border: Border.all(color: Colors.white),
//           borderRadius: const BorderRadius.all(
//             Radius.circular(10),
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 160,
//               width: 170,
//               child: Image(
//                 image: NetworkImage(
//                     "$imgPrefix${widget.products.file!.gallery!.first.file}"),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(height: 10),
//             Expanded(
//               child: Text(
//                 '${widget.products.name}',
//                 style: theme.textTheme.caption!.copyWith(
//                   fontSize: 12,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 15),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Price : ${widget.products.price!.regular}',
//                     style: theme.textTheme.headline1!.copyWith(
//                       fontSize: 16,
//                     ),
//                   ),
//                   SizedBox(
//                     height: 35,
//                     child: FloatingActionButton(
//                       elevation: 2,
//                       heroTag: 'btn${widget.index}',
//                       onPressed: () {},
//                       backgroundColor: Colors.white,
//                       foregroundColor: const Color(0xFFFFAC36),
//                       splashColor: Colors.amberAccent,
//                       child: const Icon(Icons.add),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }