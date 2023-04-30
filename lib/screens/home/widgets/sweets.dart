// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:lalsalu/screens/home/widgets/frontProducts.dart';

// class Sweets extends StatelessWidget {
//   const Sweets({super.key});

//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: SvgPicture.asset('assets/svg/back.svg'),
//         ),
//         backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
//         title: Text(
//           'Sweets',
//           style: theme.textTheme.bodyText1!.copyWith(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         elevation: 0,
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           margin: EdgeInsets.all(20),
//           child: GridView.builder(
//             padding: EdgeInsets.zero,
//             physics: const NeverScrollableScrollPhysics(),
//             shrinkWrap: true,
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 31,
//                 mainAxisExtent: 300,
//                 childAspectRatio: 2 / 1),
//             itemCount: 20,
//             itemBuilder: (context, index) {
//               return FrontProduct(index: index);
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
