import 'package:flutter/material.dart';

import '../models/product.dart';
import '../widgets/product_item.dart';

class ProductOverviewScreen extends StatelessWidget {
  final List<Product> loadedProducts = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl: 'https://pnimg.net/w/articles/1/5c8/bbec7cb79c.png',
    ),
    Product(
        id: 'p2',
        title: 'Trousers',
        description: 'A nice pair of trousers.',
        price: 59.99,
        imageUrl: 'https://pnimg.net/w/articles/1/5b8/e347a720ec.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shop'),
      ),
      body: GridView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: loadedProducts.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10),
          itemBuilder: (ctx, i) {
            return ProductItem(
              id: loadedProducts[i].id,
              title: loadedProducts[i].title,
              imageUrl: loadedProducts[i].imageUrl,
            );
          }),
    );
  }
}
