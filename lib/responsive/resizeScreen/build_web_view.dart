import 'package:flutter/material.dart';
import 'package:shoes_ui/models/brandModel.dart';
import 'package:shoes_ui/utils/colors.dart';
import 'package:shoes_ui/views/app_textStyle.dart';
import 'package:shoes_ui/views/screens/add_to_cart_screen.dart';
import 'package:shoes_ui/views/screens/favorite_scree.dart';
import 'package:shoes_ui/views/screens/product_details_screen.dart';

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
                        Positioned(
                          right: 1,
                          child: SizedBox(
                            height: 30,
                            width: 30,
                            child: FloatingActionButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return const FavoriteScreen();
                                  }),
                                );
                              },
                              backgroundColor: Colors.white,
                              child: const Icon(
                                Icons.favorite_border,
                                color: iconColor,
                              ),
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
                            SizedBox(
                              width: 30,
                              height: 30,
                              child: FloatingActionButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) {
                                      return const AddToCartScreen();
                                    }),
                                  );
                                },
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                child: const Icon(Icons.add, size: 20),
                              ),
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
