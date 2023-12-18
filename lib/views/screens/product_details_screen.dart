import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shoes_ui/provider/brand_build_provider.dart';
import 'package:shoes_ui/utils/colors.dart';
import 'package:shoes_ui/views/app_textStyle.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String name;
  final String companyName;
  final String price;
  final String imageUrl;
  final double rating;
  final List<int> size;
  final String description;

  const ProductDetailsScreen({
    Key? key,
    required this.name,
    required this.companyName,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.size,
    required this.description,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    EdgeInsets contentPadding = screenWidth > 768
        ? const EdgeInsets.all(40.0)
        : const EdgeInsets.all(10.0);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.name,
          style: appStyle(textColor, FontWeight.bold, 20),
        ),
        centerTitle: true,
        backgroundColor: appBarColor,
        automaticallyImplyLeading: true,
        //  actions: [
        //      Padding(
        //       padding: screenWidth > 768
        //           ? const EdgeInsets.only(right: 20.0)
        //           : const EdgeInsets.all(0.0),
        //       child: Consumer<FavoriteProducts>(
        //         builder: (context, value, child) {
        //           return IconButton(
        //             onPressed: () {
        //               if (value.favProduct.contains(widget)) {
        //                 value.removeFav(widget);
        //               } else {
        //                 value.addFavProduct(widget);
        //               }
        //             },
        //             icon: value.favProduct.contains(widget)
        //                 ? const Icon(Icons.favorite)
        //                 : const Icon(Icons.favorite_border),
        //             color: value.favProduct.contains(widget)
        //                 ? Colors.red
        //                 : Colors.black,
        //           );
        //         },
        //       ),
        //     ),
        //   ],

        // ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: contentPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 300,
                child: Center(child: Image.asset(widget.imageUrl)),
              ),
              Row(
                children: [
                  Text(
                    'Rating:',
                    style: appStyle(textColor, FontWeight.normal, 16),
                  ),
                  Consumer<RatingProvider>(
                      builder: (BuildContext context, value, child) {
                    return RatingBar.builder(
                      maxRating: 5.0,
                      itemSize: 25.0,
                      initialRating: widget.rating,
                      minRating: 0.0,
                      allowHalfRating: false,
                      direction: Axis.horizontal,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                      itemBuilder: (context, index) {
                        return const Icon(
                          Icons.star,
                          color: Colors.amber,
                        );
                      },
                      onRatingUpdate: (updateRating) {
                        value.rateProducts(updateRating);
                      },
                    );
                  }),
                  SizedBox(
                    width: screenWidth > 768
                        ? screenWidth * 0.24
                        : screenWidth * 0.06,
                  ),
                  Text(
                    '\$ ${widget.price}',
                    style: appStyle(Colors.red, FontWeight.bold, 20),
                  ),
                ],
              ),
              Text(widget.name,
                  style: appStyle(textColor, FontWeight.bold, 20)),
              Text('Brand: ${widget.companyName}',
                  style: appStyle(textColor, FontWeight.normal, 15)),
              const SizedBox(
                height: 14,
              ),
              Text('Sizes', style: appStyle(textColor, FontWeight.bold, 16)),
              Consumer<ShoeSizeProvider>(
                builder: (BuildContext context, value, child) {
                  return SizedBox(
                    height: 50,
                    child: ListView.separated(
                      itemCount: widget.size.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            value.selectSize(index);
                          },
                          child: SizedBox(
                            height: 50,
                            width: 50,
                            child: Card(
                              elevation: 3,
                              color: value.currentIndex == index
                                  ? Colors.blue
                                  : cardColor,
                              child: Center(
                                child: Text(
                                  widget.size[index].toString(),
                                  style: appStyle(
                                      Colors.white, FontWeight.bold, 16),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, index) =>
                          const SizedBox(
                        width: 10.0,
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Description:',
                style: appStyle(textColor, FontWeight.bold, 16),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                widget.description,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.justify,
                maxLines: 5,
                style: appStyle(textColor, FontWeight.normal, 14),
              ),
              const SizedBox(
                height: 15.0,
              ),
              Consumer<AddtoProductList>(
                builder: (BuildContext context, value, child) {
                  return Center(
                    child: GestureDetector(
                      onTap: () {
                        //  if (value.addToCart.contains(productItem)) {
                        //               value.removeCart(productItem);
                        //                 ShowCommonSnackBar.showMessage(
                        //                 context, 'Removed from Cart',
                        //               duration: const Duration(seconds: 1)

                        //                 );
                        //             } else {
                        //               value.addCart(productItem);
                        //                 ShowCommonSnackBar.showMessage(
                        //                 context, 'Added to Cart',
                        //               duration: const Duration(seconds: 1)

                        //                 );
                        //             }
                      },
                      child: Container(
                        height: 50,
                        width: screenWidth > 768 ? 300 : double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: const Color.fromARGB(255, 141, 167, 245),
                        ),
                        child: Center(
                          child: Text(
                            'Add to Cart',
                            style: appStyle(textColor, FontWeight.bold, 20),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
