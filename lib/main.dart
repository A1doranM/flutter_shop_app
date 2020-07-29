import 'package:flutter/material.dart';
import 'package:flutter_shop_app/screens/products_overview_screen.dart';
import 'package:provider/provider.dart';

import './providers/auth.dart';
import './providers/cart.dart';
import './providers/orders.dart';
import './providers/products.dart';
import './screens/auth_screen.dart';
import './screens/cart_screen.dart';
import './screens/edit_product_screen.dart';
import './screens/user_products_screen.dart';
import 'screens/orders_screen.dart';
import 'screens/product_details_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Auth(),
        ),
        ChangeNotifierProxyProvider<Auth, Products>(
          update: (ctx, auth, previousProducts) {
            return Products(
                previousProducts == null ? [] : previousProducts.items,
                authToken: auth.token,
                userId: auth.userId);
          },
          create: (_) => Products([]),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          update: (ctx, auth, previousOrders) {
            return Orders(previousOrders == null ? [] : previousOrders.orders,
                authToken: auth.token);
          },
          create: (_) => Orders([]),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
      ],
      child: Consumer<Auth>(
        builder: (ctx, auth, _) {
          return MaterialApp(
              title: 'MyShop',
              theme: ThemeData(
                primarySwatch: Colors.purple,
                accentColor: Colors.deepOrange,
                fontFamily: 'Lato',
              ),
              home: !auth.isAuth ? AuthScreen() : ProductsOverviewScreen(),
              routes: {
                ProductsOverviewScreen.routeName: (ctx) =>
                    ProductsOverviewScreen(),
                ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
                CartScreen.routeName: (ctx) => CartScreen(),
                OrdersScreen.routeName: (ctx) => OrdersScreen(),
                UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
                EditProductScreen.routeName: (ctx) => EditProductScreen(),
              });
        },
      ),
    );
  }
}
