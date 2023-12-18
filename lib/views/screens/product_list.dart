import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_ui/models/brandModel.dart';
import 'package:shoes_ui/provider/brand_build_provider.dart';
import 'package:shoes_ui/utils/colors.dart';
import 'package:shoes_ui/views/app_textStyle.dart';
import 'package:shoes_ui/views/screens/product_details_screen.dart';
import 'package:shoes_ui/widgets/snackBar_common.dart';

class AddedProductList extends StatefulWidget {
  const AddedProductList({super.key});

  @override
  State<AddedProductList> createState() => _AddedProductListState();
}

class _AddedProductListState extends State<AddedProductList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
        backgroundColor: appBarColor,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Consumer<AddtoProductList>(
            builder: (BuildContext context, value, child) {
              if (value.addToList.isEmpty) {
                return const Center(
                  child: Text('No Products Selected'),
                );
              } else {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: value.addToList.length,
                    itemBuilder: (BuildContext context, index) {
                      final productItem = products[index];
                      return GestureDetector(
                        onTap: (){
                                Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return ProductDetailsScreen(
                              name: productItem['title'],
                              companyName: productItem['company'],
                              price: productItem['price'].toString(),
                              imageUrl: productItem['imageUrl'],
                              rating: 5,
                              size: productItem['sizes'],
                              description: productItem['description'],
                            );
                          }));
                        },
                        child: Container(
                          height: 90,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 226, 225, 225),
                              borderRadius: BorderRadius.circular(12.0)),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10.0,top: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                ClipOval(
                                  child: Image.asset(
                                    productItem['imageUrl'],
                                    fit: BoxFit.contain,
                                    width: 100,
                                    height: 100,
                                  ),
                                ),
                                const SizedBox(
                                  width: 3.0,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      productItem['title'],
                                      style: appStyle(
                                          textColor, FontWeight.bold, 16),
                                    ),
                                    Text(
                                      productItem['company'],
                                      style: appStyle(
                                          textColor, FontWeight.normal, 16),
                                    ),
                                    Text(
                                      '\$ ${productItem['price'].toString()}',
                                      style: appStyle(
                                          Colors.red, FontWeight.normal, 16),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    value.removeProduct(productItem);
                                      ShowCommonSnackBar.showMessage(
                                          context, 'Removed Successfully',
                                        duration: const Duration(seconds: 1)
                                          
                                          );
                                  },
                                  icon: const Icon(
                                    Icons.delete,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, index) =>
                        const SizedBox(
                      height: 10.0,
                    ),
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
