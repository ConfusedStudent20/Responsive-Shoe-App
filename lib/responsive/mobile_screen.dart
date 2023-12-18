import 'package:flutter/material.dart';
import 'package:shoes_ui/utils/colors.dart';
import 'package:shoes_ui/views/app_textStyle.dart';
import 'package:shoes_ui/views/screens/drawer_screen.dart';
import 'package:shoes_ui/views/screens/favorite_scree.dart';
import 'package:shoes_ui/views/screens/product_list.dart';
import 'package:shoes_ui/widgets/product_widgets/company_build.dart';
import 'package:shoes_ui/widgets/product_widgets/popular_products.dart';
import 'package:shoes_ui/widgets/product_widgets/product_card_view.dart';
import 'package:shoes_ui/widgets/textField_input.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  TextEditingController textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: mobilebackgroundColor,
      appBar: AppBar(
        title: Text(
          'Conxf Shoes',
          style: appStyle(textColor, FontWeight.bold, 20),
        ),
        centerTitle: true,
        backgroundColor: appBarColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const AddedProductList();
              }));
            },
            icon: const Icon(Icons.list_alt_outlined),
          ),
          // IconButton(
          //   onPressed: () {
          //     Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          //       return const AddToProductList();
          //     }));
          //   },
          //   icon: const Icon(Icons.shopping_cart_checkout_outlined),
          // ),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return const FavoriteScreen();
              }));
            },
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      drawer: const DrawerScreen(),
      body: SingleChildScrollView(
        //  scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              TextFieldInput(
                controller: textEditingController,
                hintText: 'Search anything',
              ),
              const BuildCompanyBuilder(),
              const ProductViewCard(),
              const PopularProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
