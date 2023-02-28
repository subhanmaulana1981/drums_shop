import 'package:flutter/material.dart';
import 'package:untitled/models/product_categories.dart';
import 'package:untitled/models/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DrumShop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'DrumShop'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? _categoryName;

  List<Products> listProducts = [
    Products(
        categoryName: "drumsset",
        productID: "1",
        productName: "bass drum",
        price: 100,
        status: ["new"]),
    Products(
        categoryName: "drumsset",
        productID: "2",
        productName: "snare drum",
        price: 80,
        status: ["new"]),
    Products(
        categoryName: "drumsset",
        productID: "3",
        productName: "tom",
        price: 70,
        status: ["new"]),
    Products(
        categoryName: "drumsset",
        productID: "4",
        productName: "floor tom",
        price: 60,
        status: ["new"]),
    Products(
        categoryName: "drumsset",
        productID: "5",
        productName: "bass drum",
        price: 100,
        status: ["new"]),
    Products(
        categoryName: "cymbals",
        productID: "6",
        productName: "ride cymbal",
        price: 75,
        status: ["new"]),
    Products(
        categoryName: "cymbals",
        productID: "7",
        productName: "crash cymbal",
        price: 70,
        status: ["new"]),
    Products(
        categoryName: "cymbals",
        productID: "8",
        productName: "chinese cymbal",
        price: 80,
        status: ["new"]),
    Products(
        categoryName: "cymbals",
        productID: "9",
        productName: "hi-hat cymbal",
        price: 65,
        status: ["new"]),
    Products(
        categoryName: "cymbals",
        productID: "10",
        productName: "splash cymbal",
        price: 50,
        status: ["new"]),
    Products(
        categoryName: "hardware",
        productID: "11",
        productName: "hi-hat stand",
        price: 50,
        status: ["new"]),
    Products(
        categoryName: "hardware",
        productID: "12",
        productName: "cymbal stand",
        price: 45,
        status: ["new"]),
    Products(
        categoryName: "hardware",
        productID: "13",
        productName: "rack",
        price: 125,
        status: ["new"]),
    Products(
        categoryName: "accesories",
        productID: "14",
        productName: "cow bell",
        price: 25,
        status: ["new"]),
    Products(
        categoryName: "accesories",
        productID: "15",
        productName: "tambourine",
        price: 15,
        status: ["new"]),
  ];

  List<ProductCategories> listCategories = [
    ProductCategories(
        categoryID: "1",
        categoryName: "drumsset",
        description: "bassdrum, snare, tom, floortom",
        isOpen: false),
    ProductCategories(
        categoryID: "2",
        categoryName: "cymbals",
        description: "hi-hat, ride, crash, splash",
        isOpen: false),
    ProductCategories(
        categoryID: "3",
        categoryName: "hardware",
        description: "hi-hat stand, cymbal stand, rack, mounting",
        isOpen: false),
    ProductCategories(
        categoryID: "4",
        categoryName: "accesories",
        description: "cowbell, tambourine, ratatom, triangle",
        isOpen: false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        physics: const ScrollPhysics(),
        itemCount: listCategories.length,
        itemBuilder: (context, index) {
          return ExpansionPanelList(
            children: <ExpansionPanel>[
              ExpansionPanel(
                isExpanded: listCategories[index].isOpen,
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(
                      listCategories[index]
                          .categoryName
                          .toString()
                          .toUpperCase(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle:
                        Text(listCategories[index].description.toString()),
                    onTap: () {
                      setState(() {
                        listCategories[index].isOpen = !isExpanded;
                        _categoryName =
                            listCategories[index].categoryName.toString();
                      });
                    },
                  );
                },
                body: ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemBuilder: (context, index) {
                    return (listProducts[index].categoryName.toString() ==
                            _categoryName.toString())
                        ? ListTile(
                            title: Text(
                                "${listProducts[index].productID.toString()} - "
                                "${listProducts[index].productName.toString()}"))
                        : const SizedBox(height: 0.0);
                  },
                  itemCount: listProducts.length,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
