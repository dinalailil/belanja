import 'package:flutter/material.dart';
import 'package:belanja/models/item.dart';
import 'package:belanja/widgets/item_card.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final List<Item> items = [
    Item(
        name: 'Sugar',
        price: 5000,
        image: 'images/gula.jpg',
        stock: 20,
        rating: 4.5),
    Item(
        name: 'Salt',
        price: 2000,
        image: 'images/salt.jpg',
        stock: 35,
        rating: 4.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shopping List')),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ItemCard(
                  item: item,
                  onTap: () {
                    context.go('/item', extra: item);
                  },
                );
              },
            ),
          ),
          Container(
            color: Colors.blueGrey.shade50,
            padding: const EdgeInsets.all(12),
            child: const Text(
              "Dinarul Lailil M - 123456789", // Ganti NIM kamu
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
