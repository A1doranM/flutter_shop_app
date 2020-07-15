import 'package:flutter/material.dart';
import 'package:flutter_shop_app/providers/product.dart';
import 'package:provider/provider.dart';

import '../screens/products_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loadedProduct = Provider.of<Product>(context);

    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: loadedProduct.id,
            );
          },
          child: Image.network(
            loadedProduct.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: Icon(loadedProduct.isFavourite
                ? Icons.favorite
                : Icons.favorite_border),
            color: Theme.of(context).accentColor,
            onPressed: () {
              loadedProduct.toggleFavouriteStatus();
            },
          ),
          title: Text(
            loadedProduct.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Theme.of(context).accentColor,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }
}
