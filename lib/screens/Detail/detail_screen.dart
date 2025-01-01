import 'package:ecommerce_thanh/constants.dart';
import 'package:ecommerce_thanh/models/product.dart';
import 'package:ecommerce_thanh/screens/Detail/Widget/add_to_cart.dart';
import 'package:ecommerce_thanh/screens/Detail/Widget/description.dart';
import 'package:ecommerce_thanh/screens/Detail/Widget/detail_app_bar.dart';
import 'package:ecommerce_thanh/screens/Detail/Widget/image_slider.dart';
import 'package:ecommerce_thanh/screens/Detail/Widget/items_detail.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Product product;
  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int currentImage = 0;
  int currentColor = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcontentColor,
      //for add to cart, icon and quantity
      floatingActionButton: AddToCart(product: widget.product),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Column(
          children: [
            //for back button share and favorite,
            DetailAppBar(
              product: widget.product,
            ),
            //for detail image ImageSlider
            MyImageSlider(
              image: widget.product.image,
              onChange: (index) {
                setState(() {
                  currentImage = index;
                });
              },
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                4,
                (index) => AnimatedContainer(
                  duration: const Duration(microseconds: 300),
                  width: currentImage == index ? 15 : 8,
                  height: 8,
                  margin: const EdgeInsets.only(right: 3),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: currentImage == index
                        ? Colors.black
                        : Colors.transparent,
                    border: Border.all(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
              ),
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //for product name, price, rating and seller
                  ItemsDetails(product: widget.product),
                  const SizedBox(height: 20),
                  const Text(
                    "Color",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: List.generate(
                      widget.product.colors.length,
                      (index) => GestureDetector(
                        onTap: () {
                          setState(() {
                            currentColor = index;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(
                            milliseconds: 300,
                          ),
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentColor == index
                                ? Colors.white
                                : widget.product.colors[index],
                            border: currentColor == index
                                ? Border.all(
                                    color: widget.product.colors[index],
                                  )
                                : null,
                          ),
                          padding: currentColor == index
                              ? const EdgeInsets.all(2)
                              : null,
                          margin: const EdgeInsets.only(right: 15),
                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: widget.product.colors[index],
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  //for description
                  Description(description: widget.product.description),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
