import 'package:flutter/material.dart';
import 'package:lalsalu/common/custom_button.dart';
import 'package:lalsalu/common/custom_text_field.dart';
import 'package:lalsalu/models/all_products.dart';
import 'package:lalsalu/screens/checkout/chekout_viewmodel.dart';

class CheckOut extends StatefulWidget {
  final List<Products> cartItems;
  final CheckoutViewmodel viewmodel;

  const CheckOut({super.key, required this.viewmodel, required this.cartItems});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  // for updating user data
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController town = TextEditingController();

  var subtotal = 0;

  @override
  void initState() {
    super.initState();
    firstName.text = widget.viewmodel.userInfo!.firstName!;
    lastName.text = widget.viewmodel.userInfo!.lastName!;
    email.text = widget.viewmodel.userInfo!.email!;
    phone.text = widget.viewmodel.userInfo!.phone!;
    subtotal = widget.cartItems
        .map((e) => e.price!.regular)
        .toList()
        .reduce((value, element) => value + element);
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Billing Address',
                  style: theme.textTheme.headline2!.copyWith(
                      fontSize: 25, decoration: TextDecoration.underline),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextFormField(
                  textInputType: TextInputType.name,
                  controller: firstName,
                  hintText: "First Name *",
                  isObscured: false,
                  isDigit: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  textInputType: TextInputType.name,
                  controller: lastName,
                  hintText: "Last Name *",
                  isObscured: false,
                  isDigit: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormField(
                      textInputType: TextInputType.emailAddress,
                      controller: email,
                      hintText: "Email *",
                      isObscured: false,
                      isDigit: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      textInputType: TextInputType.number,
                      controller: phone,
                      hintText: "Phone Number *",
                      isObscured: false,
                      isDigit: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      textInputType: TextInputType.streetAddress,
                      controller: address,
                      hintText: "Address *",
                      isObscured: false,
                      isDigit: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      textInputType: TextInputType.streetAddress,
                      controller: country,
                      hintText: "Country *",
                      isObscured: false,
                      isDigit: false,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomTextFormField(
                      textInputType: TextInputType.streetAddress,
                      controller: town,
                      hintText: "City *",
                      isObscured: false,
                      isDigit: false,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Cart Total',
                      style: theme.textTheme.headline2!.copyWith(
                          fontSize: 25, decoration: TextDecoration.underline),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(20),
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Product',
                                style: theme.textTheme.headline2!.copyWith(
                                  fontSize: 19,
                                ),
                              ),
                              Text(
                                'Total',
                                style: theme.textTheme.headline2!.copyWith(
                                  fontSize: 19,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            height: 20,
                            child: ListView.builder(
                              itemCount: widget.cartItems.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      widget.cartItems[index].name!,
                                      style:
                                          theme.textTheme.bodyText1!.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      "1 x TK ${widget.cartItems[index].price!.regular}",
                                      style:
                                          theme.textTheme.bodyText1!.copyWith(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 67, 67, 65),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Subtotal',
                                style: theme.textTheme.bodyText1!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                widget.cartItems.isNotEmpty
                                    ? subtotal.toString() + ' TK'
                                    : '0 TK',
                                style: theme.textTheme.bodyText1!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 67, 67, 65),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Minimum Shipping Fee',
                                style: theme.textTheme.bodyText1!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'TK 80',
                                style: theme.textTheme.bodyText1!.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            'Shipping fee can be increased due to weight and location',
                            style: theme.textTheme.bodyText1!.copyWith(
                              fontSize: 15,
                            ),
                          ),
                          const Divider(
                            color: Color.fromARGB(255, 67, 67, 65),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Grand Total',
                                style: theme.textTheme.headline2!.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                              Text(
                                widget.cartItems.isNotEmpty
                                    ? (subtotal + widget.viewmodel.shippingFee)
                                            .toString() +
                                        ' TK'
                                    : '0 TK',
                                style: theme.textTheme.headline2!.copyWith(
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      'Payment Method',
                      style: theme.textTheme.headline2!.copyWith(
                          fontSize: 25, decoration: TextDecoration.underline),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      color: Theme.of(context).scaffoldBackgroundColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Theme(
                                data: ThemeData(
                                  toggleableActiveColor: Colors.black,
                                  unselectedWidgetColor: Colors.black,
                                ),
                                child: Radio(
                                  activeColor: Colors.black,
                                  value: 1,
                                  groupValue: widget.viewmodel.paymentSelector,
                                  onChanged: (int? val) {
                                    //print(val);
                                    widget.viewmodel.paymentSelector = val!;
                                  },
                                ),
                              ),
                              const Text("PAYMENT DIGITAL"),
                            ],
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Row(
                            children: [
                              Theme(
                                data: ThemeData(
                                  toggleableActiveColor: Colors.black,
                                  unselectedWidgetColor: Colors.black,
                                ),
                                child: Radio(
                                  activeColor: Colors.black,
                                  value: 2,
                                  groupValue: widget.viewmodel.paymentSelector,
                                  onChanged: (int? val) {
                                    //print(val);
                                    widget.viewmodel.paymentSelector = val!;
                                  },
                                ),
                              ),
                              const Text("CASH ON DELIVERY"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    widget.viewmodel.paymentSelector == 1
                        ? Column(
                            children: [
                              Text(
                                'Payment Option',
                                style: theme.textTheme.headline2!.copyWith(
                                    fontSize: 25,
                                    decoration: TextDecoration.underline),
                              ),
                              const SizedBox(height: 15),
                              Container(
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                                padding: const EdgeInsets.all(15),
                                child: Text('bKash Merchant: 01648449539'),
                              ),
                            ],
                          )
                        : const SizedBox.shrink(),
                  ],
                ),
                const SizedBox(height: 20),
                widget.viewmodel.isLoading == false
                    ? CustomButton(
                        buttonText: "Place Order",
                        onPressed: () {},
                        buttonColor: theme.colorScheme.primary,
                        textColor: Colors.white,
                      )
                    : CustomButton(
                        loading: true,
                        buttonColor: theme.colorScheme.primary,
                        textColor: Colors.white,
                      ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
