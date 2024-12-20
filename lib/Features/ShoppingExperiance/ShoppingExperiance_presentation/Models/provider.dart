import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/data.dart';

class FeatureProvider extends ChangeNotifier {
//Filter/////////////////////////////////////
  GlobalKey<FormState> priceFromKey = GlobalKey<FormState>();
  GlobalKey<FormState> priceToKey = GlobalKey<FormState>();
  TextEditingController priceToController = TextEditingController();
  TextEditingController priceFromController = TextEditingController();

  /*submitFromPrice() {
    if (priceFromKey.currentState!.validate()) {
      priceFromKey.currentState!.save();
    }
  }
  submitToPrice() {
    if (priceToKey.currentState!.validate()) {
      priceToKey.currentState!.save();
    }
  }
  */
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

////Single Product /////////////////////////////////////////////////
  int? sigleProductId;

  set SigleProductIdSet(int? id) {
    sigleProductId = id;
    notifyListeners();
  }

  Map SingleProduct() {
    Map Product = {};
    for (int i = 0; i <= Products.length - 1; i++) {
      if (Products[i]["id"] == sigleProductId) {
        Product = Products[i];
      }
    }

    return Product;
  }

  ////Filter Category/////////////////////////////////////////////

  String _selectedCategory = 'All Shoes';

  String get SelactedCategory => _selectedCategory;

  set SelactedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }

  ////Navigation bar////////////////////////////////////////////////////////
  int _selectedPage = 0;
  int get SelectedPage => _selectedPage;

  void ChangePage(int index) {
    _selectedPage = index;
    notifyListeners();
  }

  //////Search Shoes //////////////////////////////////////////////////////
  bool? get SearchGET {
    return search;
  }

  bool search = false;

  set SearchSet(bool val) {
    search = val;
    notifyListeners();
  }

  /////Cart Page///////////////////////////////////////////////////

  double getSubTotal() {
    return SubTotal.reduce(
        (sum, item) => sum + item); // Sum all items in SubTotal
  }

  List<Map> Cart = [];
  double Total = 0;
  List<double> SubTotal = [];

  void AddSubTotal(double total, int index) {
    /* for (int i = 0; i <= Cart.length - 1; ++i) {
      SubTotal.add(0);
    }*/
    SubTotal[index] = total;
    notifyListeners();
  }

  /*double? GetSubTotal() {
    double? sum;
    for (var i in SubTotal) {
      sum = sum! + i;
    }
    return sum;
    notifyListeners();
  }
*/
  TotalPrice(double total) {
    //  for (int i=0 ; i<=Cart.length-1;++i) {
    Total += total;
    notifyListeners();
  }

  /*
  int Inc() {
    ++q;
    return q;

    notifyListeners();
  }

  int dec(int id) {
    if (q <= 0) {
      CartProductDelete(id);
    } else {
      --q;
    }
    return q;
    notifyListeners();
  }
 */
  void CartProductDelete(int id) {
    Cart.removeWhere((item) => item["id"] == id);

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

  int? productSize;
  SETproductSize(int size) {
    productSize = size;
    notifyListeners();
  }

  bool? CartCheck(int id, {bool? k}) {
    if (Cart.isEmpty) {
      return false;
    } else {
      for (int i = 0; i <= Cart.length; ++i) {
        if (id == Cart[i]["id"]) {
          return true;
        } else {
          false;
        }
      }
    }
  }
}
