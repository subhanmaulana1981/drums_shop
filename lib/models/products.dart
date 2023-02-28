
class Products {

  String categoryName;
  String productID;
  String productName;
  int price;
  List<String> status;

  Products({
    required this.categoryName,
    required this.productID,
    required this.productName,
    this.price = 0,
    this.status = const ["new", "second"]
  });
}