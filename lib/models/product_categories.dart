
class ProductCategories {

  String categoryID;
  String categoryName;
  String description;
  bool isOpen;

  ProductCategories({
    required this.categoryID,
    required this.categoryName,
    required this.description,
    this.isOpen = false
  });
}