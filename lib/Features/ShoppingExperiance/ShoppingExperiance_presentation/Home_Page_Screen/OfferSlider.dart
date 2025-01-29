import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:nikesneakersshopapp/Features/ShoppingExperiance/ShoppingExperiance_presentation/Offer_Page/OfferPage_Screen.dart';

class OfferSlider extends StatelessWidget {
  OfferSlider({super.key});
  @override
  PageController _Controler = PageController();

  Widget build(BuildContext context) {
    OfferPic() {
      return MaterialButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => OfferPageScreen(),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1), // Shadow color
                  spreadRadius: 2, // Spread the shadow
                  blurRadius: 10, // Blur effect
                  offset: Offset(0, 5), // Vertical shadow position
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.asset("lib/Core/Assets/Offer.jpg", fit: BoxFit.fill),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        SmoothPageIndicator(
            controller: _Controler, // PageController
            count: 3,
            effect: ScaleEffect(
                dotWidth: 8,
                dotHeight: 8,
                activeDotColor: Colors.blue), // your preferred effect
            onDotClicked: (index) {}),
        SizedBox(
          height: 16,
        ),
        Container(
          height: 100,
          width: 335,
          child: PageView(
            controller: _Controler,
            children: [OfferPic(), OfferPic(), OfferPic()],
          ),
        ),
      ],
    );
  }
}
