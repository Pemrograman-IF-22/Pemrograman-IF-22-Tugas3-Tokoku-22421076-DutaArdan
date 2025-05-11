import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:tokoku/models/produk_model.dart';
import 'package:tokoku/screens/detail_product_screens.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  List <ProdukModel> _products = []; 

  @override
  void initState() {
    super.initState();

    fetchProduct();
  }

  Future<void> fetchProduct() async {
    final Response = await http.get(
      Uri.parse('https://fakestoreapi.com/products')
    );

    debugPrint('Response: ${Response.body}');

    if(Response.statusCode == 200) {
      final List<dynamic> data = json.decode(Response.body);

      setState(() {
        _products = data.map(
          (json) => ProdukModel.fromJson(json)
        ).toList();
      });
    }else{
      throw Exception("Gagal mengambil data produk");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tokoku'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          final product = _products[index];


          return GestureDetector(
            onTap: 
                () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailProductScreens(produkModel: product),
                    ),
                  ),
            child: Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 150,
                    width: double.infinity,
                    child: Image.network(
                      product.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4
                    ),
                    child: Text(
                      product.category,
                      style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                    )),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4
                    ),
                    child: Text(
                      product.title, 
                      style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      overflow: TextOverflow.ellipsis
                    )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4
                    ),
                    child: Text('\$${product.price}', style: TextStyle(color: Colors.grey
                    )),
                  ),
                ],
              )
            ),
          );
        }
      ),
    );
  }
}