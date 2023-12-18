import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_ui/models/brandModel.dart';
import 'package:shoes_ui/provider/brand_build_provider.dart';
import 'package:shoes_ui/utils/colors.dart';
import 'package:shoes_ui/views/app_textStyle.dart';
import 'package:shoes_ui/views/screens/product_details_screen.dart';
import 'package:shoes_ui/widgets/snackBar_common.dart';

class PopularMobileView extends StatefulWidget {
  const PopularMobileView({super.key});

  @override
  State<PopularMobileView> createState() => _PopularMobileViewState();
}

class _PopularMobileViewState extends State<PopularMobileView> {
  @override
  Widget build(BuildContext context) {
   return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: products.length,
      itemBuilder: (BuildContext context, index) {
        final productItem = products[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
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
            height: 150,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              children: [
                SizedBox(
                  height: 140,
                  width: 150,
                  child: Card(
                    color: cardColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        productItem['imageUrl'],
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          productItem['title'],
                          style: appStyle(textColor, FontWeight.bold, 20),
                        ),
                        Text(
                          productItem['company'],
                          style: appStyle(textColor, FontWeight.normal, 15),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '\$ ${productItem['price'].toString()}',
                              style: appStyle(Colors.red, FontWeight.bold, 20),
                            ),
                            const Spacer(
                              flex: 1,
                            ),
                             Consumer<AddtoProductList>(
                            builder: (BuildContext context, value, child) {
                              return SizedBox(
                                width: 30,
                                height: 30,
                                child: FloatingActionButton(
                                  onPressed: () {
                                    if (value.addToList.contains(productItem)) {
                                      value.removeProduct(productItem);
                                        ShowCommonSnackBar.showMessage(
                                        context, 'Removed from Cart',
                                      duration: const Duration(seconds: 1)
                                        
                                        );
                                    } else {
                                      value.addProduct(productItem);
                                        ShowCommonSnackBar.showMessage(
                                        context, 'Added to Cart',
                                      duration: const Duration(seconds: 1)
                                        
                                        );
                                    }
                                  },
                                  backgroundColor:
                                      value.addToList.contains(productItem)
                                          ? const Color.fromARGB(255, 0, 0, 0)
                                          : Colors.blue,
                                  child: Icon(
                                    value.addToList.contains(productItem)
                                        ? Icons.check
                                        : Icons.add,
                                    color: Colors.white,
                                  ),
                                ),
                              );
                            },
                          ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, index) {
        return const SizedBox(
          height: 10,
        );
      },
    );
  }
}