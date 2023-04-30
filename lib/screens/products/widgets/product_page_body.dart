import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lalsalu/common/custom_button.dart';

class ProductPageBody extends StatefulWidget {
  const ProductPageBody({super.key, required viewmodel});

  @override
  State<ProductPageBody> createState() => _ProductPageBodyState();
}

class _ProductPageBodyState extends State<ProductPageBody> {
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
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 24),
              child: Center(
                child: Container(
                  height: 300,
                  width: 200,
                  child: Image(
                    image: AssetImage('assets/images/pant2.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Container(
              height: 440,
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Denim (32 - 34) - Jules',
                    style: theme.textTheme.bodyText1!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'TK 2050',
                    style: theme.textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                      'Peptides & Isolate Primary Source Support Recovery Enhance Lean Muscle Gluten Free 24g Protein | 5.4g BCAAs* | 4g Glutamine & Precursor (Per Serving) Natural & Artificial FlavorsDietary Supplement',
                      style: theme.textTheme.bodyText2),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Varient',
                        style: theme.textTheme.bodyText2!.copyWith(
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 15),
                      SizedBox(
                        width: 250,
                        height: 60,
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: 2,
                          itemBuilder: (context, index) {
                            return varientType(context);
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomButton(
                    buttonColor: Theme.of(context).colorScheme.secondary,
                    textColor: Colors.white,
                    onPressed: () {},
                    buttonText: 'Add to Cart',
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container varientType(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: ChoiceChip(
          padding: EdgeInsets.all(12),
          backgroundColor: Color(0xFFEFEFEF),
          selectedColor: Color(0xFFFEAF41),
          label: Text('32'),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(5),
            ),
          ),
          selected: true),
    );
  }
}
