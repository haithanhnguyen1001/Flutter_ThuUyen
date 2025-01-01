// ignore_for_file: public_member_api_docs, sort_constructors_first
class Category {
  final String title;
  final String image;
  Category({
    required this.title,
    required this.image,
  });
}

final List<Category> categories = [
  Category(title: "All", image: "images/all.png"),
  Category(title: "Shoe", image: "images/shoes.png"),
  Category(title: "Beauty", image: "images/beauty.png"),
  Category(title: "Women's\nFashion", image: "images/image1.png"),
  Category(title: "Jewelry", image: "images/jewelry.png"),
  Category(title: "Men's\nFashion", image: "images/men.png"),
];
