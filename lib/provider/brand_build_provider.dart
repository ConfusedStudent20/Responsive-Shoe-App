import 'package:flutter/material.dart';

//provider that helps to select the brand containing logo
class BrandBuildProvider with ChangeNotifier {
  int selectedIndex = -1;
  void selectBrand(int changeIndex) {
    selectedIndex = changeIndex;
    notifyListeners();
  }
}

class FavoriteProducts with ChangeNotifier {
  List<Map<String, dynamic>> favProduct = [];

  void addFavProduct(Map<String, dynamic> addProduct) {
    favProduct.add(addProduct);
    notifyListeners();
  }

  void removeFav(Map<String, dynamic> removeProduct) {
    favProduct.remove(removeProduct);
    notifyListeners();
  }
}

class RatingProvider with ChangeNotifier {
  double initialRating = 0;

  void rateProducts(double giveRating) {
    initialRating = giveRating;
    notifyListeners();
  }
}

class AddtoProductList with ChangeNotifier {
  List<Map<String, dynamic>> addToList = [];

  void addProduct(Map<String, dynamic> includeProduct) {
    addToList.add(includeProduct);
    notifyListeners();
  }

  void removeProduct(Map<String, dynamic> deleteProduct) {
    addToList.remove(deleteProduct);
    notifyListeners();
  }
}

class ShoeSizeProvider with ChangeNotifier {
  int currentIndex = -1;
  void selectSize(int selectedIndex) {
    currentIndex = selectedIndex;
    notifyListeners();
  }
}
