import 'package:flutter/material.dart';
import 'package:nikesneakersshopapp/Core/Widgets/Theme.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Models/provider.dart';
import 'package:provider/provider.dart';

class OfferPageBody extends StatelessWidget {
  const OfferPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final p = Provider.of<FeatureProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset(
                "lib/Core/Assets/Offer.jpg",
                fit: BoxFit.fill,
                width: 355,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                width: 355,
                height: p.GetOfferReadMore ? 360 : 255,
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: ContainersColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                          "Unlock an Incredible 15% Discount Only for a Limited Time Step up your footwear game with the latest Nike designs that combine style, comfort and performance. now is the perfect time to get your hands on exclusive Nike sneakers at a reduced price.This limited time offer allows you to save 15% on a wide selection of Nike shoes, making it easier than ever to upgrade your collection with high-quality, trendy footwear. Dont miss out on this special deal!Offer valid until [insert date], so hurry and grab your favorite pair before they are gone. Shop now and experience the unbeatable comfort and style of Nike sneakers Limited stock available. Terms and conditions apply.",
                          style: TextStyle(color: GreyText),
                          overflow: TextOverflow.ellipsis,
                          maxLines: p.GetOfferReadMore ? 17 : 10),
                      TextButton(
                          onPressed: () {
                            p.SetOfferReadMore = !p.GetOfferReadMore;
                            print(p.GetOfferReadMore);
                          },
                          child: Text(
                            p.GetOfferReadMore ? "read less" : "read more",
                            style: TextStyle(color: Colors.blue),
                          )),
                    ])),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                p.SetApplyDiscount = !p.Getapplydiscount;
                p.dispersentage = 15;
                print(p.Getapplydiscount);
                print(p.dispersentage);
              },
              child: Container(
                width: 190,
                height: 50,
                decoration: BoxDecoration(
                  color: p.Getapplydiscount ? ContainersColor : Bluetheme,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      p.Getapplydiscount
                          ? Icons.remove_circle_outline_outlined
                          : Icons.shopping_bag_outlined,
                      color: p.Getapplydiscount ? Bluetheme : MainColor,
                      size: 23,
                    ),
                    SizedBox(width: 5),
                    Text(
                      p.Getapplydiscount ? "UnApply Offer" : "Apply Offer",
                      style: TextStyle(
                          color:
                              p.Getapplydiscount ? Bluetheme : ContainersColor,
                          fontSize: 17),
                    )
                  ],
                ),
              ),
            )
          ]),
    );
  }
}
