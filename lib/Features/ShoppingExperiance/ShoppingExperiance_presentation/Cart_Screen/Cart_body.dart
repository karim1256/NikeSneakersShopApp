import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Widgets.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'package:nikesneakersshopapp/data.dart';
import 'Cart_PaymentSummary.dart';
import 'package:provider/provider.dart';

class CartBody extends StatefulWidget {
  CartBody({super.key});

  @override
  State<CartBody> createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    final p = Provider.of<FeatureProvider>(context);

    double SubTotal(double k, int i) {
      double sub = 0;
      List<double> subtotal = [];
      subtotal.length = p.Cart.length;
      subtotal[i] = k;
      for (var i in subtotal) {
        sub += i;
      }

      return sub;
    }

    Map? CartProduct(int id) {
      for (var product in Products) {
        if (product['id'] == id) {
          return product;
        }
      }
      return null; // Return null if product is not found
    }

    Widget Quantity(bool isIncrement) {
      return Text(
        isIncrement ? "+" : "-",
        style: TextStyle(fontSize: 25, color: MainColor),
      );
    }

    return p.Cart.isEmpty
        ? NoProductsFound()
        : Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 15),
              Expanded(
                child: ListView.separated(
                  itemCount: p.Cart.length,
                  separatorBuilder: (BuildContext context, int i) =>
                      SizedBox(height: 20),
                  itemBuilder: (BuildContext context, int i) {
                    double k = p.Cart[i]["quantity"] * p.Cart[i]["price"];
                    p.AddSubTotal(k, i);
                    return Row(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            p.CartProductDelete(
                                p.Cart[i]["id"], p.Cart[i]["size"]);
                          },
                          child: Container(
                            height: 140,
                            width: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Colors.red,
                            ),
                            alignment: Alignment.center,
                            child: Icon(Icons.delete_outline_outlined,
                                color: MainColor),
                          ),
                        ),
                        Container(
                          height: 140,
                          width: 210,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: ContainersColor,
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                spreadRadius: 2,
                                blurRadius: 10,
                                offset: Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Image.asset('lib/Core/Assets/nike1.png',
                                    width: 80),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(height: 10),
                                    SizedBox(
                                      width: 110,
                                      child: Text(
                                        CartProduct(p.Cart[i]["id"])!["name"],
                                        style: TextStyle(
                                            color: Bluetheme,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: <Widget>[
                                        Text("Size :",
                                            style: TextStyle(
                                                color: Bluetheme,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(width: 2),
                                        Text(p.Cart[i]["size"].toString()),
                                      ],
                                    ),
                                    Row(
                                      children: <Widget>[
                                        Text("Price :",
                                            style: TextStyle(
                                                color: Bluetheme,
                                                fontWeight: FontWeight.bold)),
                                        SizedBox(width: 5),
                                        Text(
                                            '${CartProduct(p.Cart[i]["id"])!["price"]}\$'),
                                      ],
                                    ),
                                  ],
                                ),
                              ]),
                              Column(
                                children: [
                                  Divider(
                                      color: Colors.black,
                                      thickness: 1,
                                      indent: 50),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Text("Total",
                                          style: TextStyle(
                                              color: Bluetheme,
                                              fontWeight: FontWeight.bold)),
                                      SizedBox(width: 70),
                                      Text(
                                        k.toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          height: 140,
                          width: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Bluetheme,
                          ),
                          alignment: Alignment.center,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              MaterialButton(
                                onPressed: () {
                                  p.IncOrDecQuantity("Inc", i);
                                },
                                child: Quantity(true),
                              ),
                              Text(
                                p.Cart[i]["quantity"].toString(),
                                style: TextStyle(color: ContainersColor),
                              ),
                              MaterialButton(
                                onPressed: () {
                                  p.Cart[i]["quantity"] == 1
                                      ? p.CartProductDelete(
                                          p.Cart[i]['id'], p.Cart[i]["size"])
                                      : p.IncOrDecQuantity("Dec", i);
                                },
                                child: Quantity(false),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
              CartPaymentSummary('Checkout'),
            ],
          );
  }
}
