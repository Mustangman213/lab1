import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  final List<Product> products = [
    Product(
        name: 'T-Shirt',
        image: 'assets/tshirt.png',
        description: 'Comfortable cotton t-shirt.',
        price: '\$20'),
    Product(
        name: 'Jeans',
        image: 'assets/jeans.png',
        description: 'Stylish blue jeans.',
        price: '\$40'),
    Product(
        name: 'Sneakers',
        image: 'assets/sneakers.png',
        description: 'Durable running shoes.',
        price: '\$60'),
  ];

 ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('213218')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Image.asset(products[index].image),
              title: Text(products[index].name),
              subtitle: Text(products[index].price),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ProductDetailScreen(product: products[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(product.image),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              product.description,
              style: const TextStyle(fontSize: 16),
            ),
          ),
          Text(
            product.price,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final String image;
  final String description;
  final String price;

  Product(
      {required this.name,
      required this.image,
      required this.description,
      required this.price});
}
