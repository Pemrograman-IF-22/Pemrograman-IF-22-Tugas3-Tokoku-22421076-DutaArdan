import 'package:flutter/material.dart';
import 'package:tokoku/models/produk_model.dart';

class DetailProductScreens extends StatelessWidget{
  const DetailProductScreens({super.key, required this.produkModel});

  final ProdukModel produkModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          produkModel.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(
                produkModel.image,
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              produkModel.title,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              '\$${produkModel.price}',
              style: const TextStyle(
                fontSize: 18,
                color: Colors.green,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Description',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 4),
            Text(produkModel.description, style: const TextStyle(fontSize: 14)),
            const SizedBox(height: 16),
            Row(
              children: [
                const Icon(Icons.star, color: Colors.amber, size: 20),
                const SizedBox(width: 4),
                Text(
                  '${produkModel.rating.rate} (${produkModel.rating.count} reviews)',
                ),
              ],
            ),
            const SizedBox(height: 16),
            Chip(
              label: Text(produkModel.category),
              backgroundColor: Colors.blue.shade100),  
          ],
        ),
      ),
    );
  }
}