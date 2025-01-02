import 'package:ecommerce_thanh/models/product.dart';
import 'package:ecommerce_thanh/screens/Home/Widget/image_slider.dart';
import 'package:ecommerce_thanh/screens/Home/Widget/product_card.dart';
import 'package:ecommerce_thanh/screens/Home/Widget/search_bar.dart';
import 'package:flutter/material.dart';

import '../../models/category.dart';
import 'Widget/home_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<List<Product>> selectdCategories = [
    all,
    shoes,
    beauty,
    womenFashion,
    jewelry,
    menFashion,
  ];
  int selectedIndex = 0;
  int currentSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              //for custom app bar
              const CustomAppBar(),
              const SizedBox(height: 20),
              //for search bar
              const MySearchBar(),
              const SizedBox(height: 20),
              //for slider
              ImageSlider(
                currentSlide: currentSlider,
                onChange: (value) {
                  setState(
                    () {
                      currentSlider = value;
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              //for category selection
              SizedBox(
                height: 130,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal, //truot ngang
                  itemCount: categories.length, //6
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: selectedIndex == index
                              ? Colors.blue[200]
                              : Colors.transparent,
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: AssetImage(categories[index].image),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              categories[index].title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Special For You",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: Colors.black54),
                  ),
                ],
              ),
              //for shopping items
              GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: selectdCategories[selectedIndex].length,
                itemBuilder: (context, index) {
                  return ProductCard(
                    product: selectdCategories[selectedIndex][index],
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
