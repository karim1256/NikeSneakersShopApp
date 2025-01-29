import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/data.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/Products_View_Container.dart';
import 'package:nikesneakersshopapp/Core/Widgets/ProductsView.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Features/AccountService/AccountService_Presentation/ProfilePage/Profile_Screen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Cart_Screen/Cart_Screen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/FavouriteProducts_Screen/FavouriteProducts_Screen.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Home_Page_Screen/Home_Page_screen.dart';
import 'package:provider/provider.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/AccountServiceProvider.dart';
import 'package:nikesneakersshopapp/Features/AccountService/AccountService_Presentation/ProfilePage/ProfileView_Screen.dart';

class FeatureProvider extends ChangeNotifier {
// Offer Page/////////////////////////////////////
  bool get GetOfferReadMore {
    return offerReadMore;
  }

  bool offerReadMore = false;

  set SetOfferReadMore(bool val) {
    offerReadMore = val;
    notifyListeners();
  }

///////Filter Products////////////////////////////////////////////////
  String get PriceFromGET {
    return PriceFrom;
  }

  String PriceFrom = '';

  set priceFromSet(String val) {
    PriceFrom = val;
    notifyListeners();
  }

  String? get priceToGET {
    return PriceTo;
  }

  String? PriceTo = '';

  set priceToSet(String val) {
    PriceTo = val;
    notifyListeners();
  }

////Single Product /////////////////////////////////////////////////////
  int? sigleProductId;

  Map? SingleProduct() {
    dynamic Product = {};
    for (var i in Products) {
      if (i['id'] == sigleProductId) {
        Product = i;

        return Product;
      }
    }
  }

  bool get GetSingleProductReadMore {
    return singleProductReadMore;
  }

  bool singleProductReadMore = false;
  set SetSingleProductReadMore(bool val) {
    singleProductReadMore = val;
    notifyListeners();
  }

  ////Filter Category/////////////////////////////////////////////

  String _selectedCategory = 'All Shoes';

  String get SelactedCategory => _selectedCategory;

  set SelactedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  String _filterValue = "";
  String get GETFilterValue => _filterValue;

  set SETfilterValue(String category) {
    _filterValue = category;
    notifyListeners();
  }

  List<Map> FilterCategories() {
    List<Map> filteredCategories = [];
    // Assuming you have ToOnsave and FromOnsave variables available

    for (Map product in Products) {
      if (SelactedCategory == 'All Shoes') {
        filteredCategories.add(product);
      }
      if (product['Category'] == SelactedCategory) {
        filteredCategories.add(product);
      }
    }
    if (GETFilterValue.isNotEmpty) {
      if (GETFilterValue == "Price") {
        // Sort by price
        filteredCategories.sort((a, b) => a['price'].compareTo(b['price']));
      } else {
        // Filter by feature
        filteredCategories = filteredCategories
            .where((product) => product['feature'] == GETFilterValue)
            .toList();
      }
    }

    return filteredCategories;
  }

  ////Navigation bar////////////////////////////////////////////////////////
  int _selectedPage = 0;
  int get SelectedPage => _selectedPage;

  void ChangePage(int index) {
    _selectedPage = index;
    notifyListeners();
  }

  Widget NavigationWidget = HomePage();
  // void BottomNavigationCondation(BuildContext context) {
  //   if (NavigationWidget == ProfileScreen) {
  //     print("********Navigate from profile page******************");

  //     Provider.of<AccountServiceProvider>(context, listen: false)
  //         .NavigateFromProfile(context);
  //   } else {
  //     print("********Navigate from other pages******************");

  //     BottomNavigation(context);
  //   }
  //   notifyListeners();
  // }

  void BottomNavigation(context) {
    if (SelectedPage == 0) {
      NavigationWidget = HomePage();
    } else if (SelectedPage == 1) {
      NavigationWidget = FavouriteProductsScreen();
    } else if (SelectedPage == 2) {
      NavigationWidget = const ProfileViewScreen();
    }
    Navigator.push(
      context,
      MaterialPageRoute<void>(
        builder: (BuildContext context) => NavigationWidget,
      ),
    );
    notifyListeners();
  }

  //////Search Shoes //////////////////////////////////////////////////////
  List get SearchGET {
    return _foundShoes;
  }

  List _foundShoes = Products;

  set SearchSet(List val) {
    _foundShoes = val;
    notifyListeners();
  }

  /////Cart Page////////////////////////////////////////////////////////////////
  bool _applydiscount = false;
  bool get Getapplydiscount {
    return _applydiscount;
  }

  set SetApplyDiscount(bool applyState) {
    _applydiscount = applyState;
    notifyListeners();
  }

  double? dispersentage;
  double S = 0;

  double getSubTotal() {
    S = 0;

    for (var i in Cart) {
      S = S + i['quantity'] * i['price'];
    }
    Cart.isEmpty ? S = 0 : null;
    return S;
    notifyListeners();
  }

  double TotalCost() {
    Getapplydiscount ? S = S - (S / 100 * dispersentage!) : null;
    return S + 60.20;
  }

  List<Map> Cart = [];
  double Total = 0;
  List<double> SubTotal = [];

  void IncOrDecQuantity(String Action, int index) {
    Action == 'Inc' ? ++Cart[index]["quantity"] : --Cart[index]["quantity"];

    notifyListeners();
  }

  void AddSubTotal(double total, int index) {
    /* for (int i = 0; i <= Cart.length - 1; ++i) {
      SubTotal.add(0);
    }*/
    SubTotal[index] = total;
    notifyListeners();
  }

  TotalPrice(double total) {
    //  for (int i=0 ; i<=Cart.length-1;++i) {
    Total += total;
    notifyListeners();
  }

  void CartProductDelete(int id, int size) {
    Cart.removeWhere((item) => item["id"] == id && item['size'] == size);

    notifyListeners();
  }

  CartProductADD(
    int id,
    size,
    double price,
  ) {
    Cart.add({
      "id": id,
      "size": size,
      "quantity": 1,
      'price': price,
    });
    notifyListeners();
  }

  int? productSize = 0;
  SETproductSize(int size) {
    if (productSize == size) {
      productSize = 0;
    } else {
      productSize = size;
    }

    notifyListeners();
  }

  // if (k.contains(id)) {

  //   if (Cart[index]['size'] == size) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // } else {
  //   return false;
  // }

  // for (int i = 0; i <= Cart.length; i++) {
  //   if (id == Cart[i]["id"]) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
  // return false;

  /////Favourite products/////////////////////////////////////////////////////
  List<dynamic> foundShoes = [];
  List<int> favouriteProductId = [];

  List filterFavouritProducts() {
    List FavouriteProducts = [];
    for (int i = 0; i <= favouriteProductId.length - 1; i++) {
      for (int j = 0; j <= Products.length - 1; j++) {
        if (Products[j]['id'] == favouriteProductId[i]) {
          FavouriteProducts.add(Products[j]);
        }
      }
    }
    print(FavouriteProducts);
    return FavouriteProducts;
    notifyListeners();
  }

  void AddFavouriteProduct(int id) {
    favouriteProductId.add(id);
    notifyListeners();
  }

  void FavouriteProductDelete(int id) {
    favouriteProductId.remove(id);
    notifyListeners();
  }

  ///Check Out//////////////////////////
  String selectedPaymentMethod = 'Cash';
  void SetselectedPaymentMethod(String value) {
    selectedPaymentMethod = value;
    notifyListeners();
  }
}
