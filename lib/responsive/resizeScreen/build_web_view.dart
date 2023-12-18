import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_ui/models/brandModel.dart';
import 'package:shoes_ui/provider/brand_build_provider.dart';
import 'package:shoes_ui/utils/colors.dart';
import 'package:shoes_ui/views/app_textStyle.dart';
import 'package:shoes_ui/views/screens/add_product_list.dart';
import 'package:shoes_ui/views/screens/product_details_screen.dart';
import 'package:shoes_ui/widgets/snackBar_common.dart';

class BuildWebView extends StatefulWidget {
  const BuildWebView({Key? key}) : super(key: key);

  @override
  State<BuildWebView> createState() => _BuildWebViewState();
}

class _BuildWebViewState extends State<BuildWebView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: products.length,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2,
          crossAxisSpacing: 20.0,
          mainAxisSpacing: 20.0,
          mainAxisExtent: 400,
        ),
        itemBuilder: (BuildContext context, index) {
          final productItem = products[index];
          return SizedBox(
            height: 400,
            child: Container(
              width: 250,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 204, 203, 203),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) {
                                  return ProductDetailsScreen(
                                    name: productItem['title'],
                                    companyName: productItem['company'],
                                    price: productItem['price'].toString(),
                                    imageUrl: productItem['imageUrl'],
                                    rating: 5,
                                    size: productItem['sizes'],
                                    description: productItem['description'],
                                  );
                                },
                              ),
                            );
                          },
                          child: Card(
                            elevation: 2.0,
                            color: cardColor,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                productItem['imageUrl'],
                                height: 250,
                                width: 400,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),

                        //provider for add to cart screen
                        Positioned(
                          right: 1,
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: Consumer<FavoriteProducts>(
                              builder: (BuildContext context, value, child) {
                                return FloatingActionButton(
                                  onPressed: () {
                                    if (value.favProduct
                                        .contains(productItem)) {
                                      value.removeFav(productItem);

                                      ShowCommonSnackBar.showMessage(
                                          context, 'Removed Successfully',
                                          duration: const Duration(seconds: 1));
                                    } else {
                                      value.addFavProduct(productItem);

                                      ShowCommonSnackBar.showMessage(
                                          context, 'Added Successfully',
                                          duration: const Duration(seconds: 1));
                                    }
                                  },
                                  backgroundColor: Colors.white,
                                  child: Icon(
                                    value.favProduct.contains(productItem)
                                        ? Icons.favorite
                                        : Icons.favorite_outline,
                                    color:
                                        value.favProduct.contains(productItem)
                                            ? Colors.red
                                            : Colors.black,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Text(
                          productItem['title'],
                          style: appStyle(textColor, FontWeight.bold, 16),
                        ),
                        Text(
                          productItem['company'],
                          style: appStyle(textColor, FontWeight.normal, 12),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              '\$ ${productItem['price'].toString()}',
                              style:
                                  appStyle(Colors.red, FontWeight.normal, 16),
                            ),
                            //provider for add to product list screen
                            Consumer<AddtoProductList>(
                              builder: (BuildContext context, value, child) {
                                return SizedBox(
                                  width: 30,
                                  height: 30,
                                  child: FloatingActionButton(
                                    onPressed: () {
                                      if (value.addToList
                                          .contains(productItem)) {
                                        value.removeProduct(productItem);
                                        ShowCommonSnackBar.showMessage(
                                            context, 'Removed from Cart',
                                            duration:
                                                const Duration(seconds: 1));
                                      } else {
                                        value.addProduct(productItem);
                                        ShowCommonSnackBar.showMessage(
                                            context, 'Added to Cart',
                                            duration:
                                                const Duration(seconds: 1));
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
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
