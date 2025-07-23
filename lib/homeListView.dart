import 'package:flutter/material.dart';
import 'package:flutter_application_10/app_colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: CartPage());
  }
}

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {
      'name': 'Apple Juice',
      'price': 18.65,
      'image':
          'https://th.bing.com/th/id/OIP.mj3aF3Vwdr6C37qCQ570CwHaHa?w=179&h=180&c=7&r=0&o=7&pid=1.7&rm=3',
    },
    {
      'name': 'Orange Juice',
      'price': 19.40,
      'image':
          'https://th.bing.com/th/id/OIP.VLtZx16lwn_j8tQsN_2UkgHaF1?w=229&h=180&c=7&r=0&o=7&pid=1.7&rm=3',
    },
    {
      'name': 'Grapes Juice',
      'price': 10.50,
      'image':
          'https://th.bing.com/th/id/OIP.dE4vbTilEbFVOUAf0AaFJgHaHa?w=194&h=194&c=7&r=0&o=7&pid=1.7&rm=3',
    },

    {
      'name': 'lemon Juice',
      'price': 8.0,
      'image':
          'https://www.google.com/imgres?q=lemon%20juice%20w%2Cv%20%D9%85%D8%AB%D8%A9%D8%AE%D9%89%20%D8%AA%D8%B9%D8%A4%D8%AB&imgurl=https%3A%2F%2Fimg.freepik.com%2Fpremium-photo%2Frefreshing-lemon-juice-with-fresh-lemons-side-white-clear-surface-png-transparent-background_94628-55811.jpg&imgrefurl=https%3A%2F%2Fwww.freepik.com%2Fpremium-ai-image%2Frefreshing-lemon-juice-with-fresh-lemons-side-white-clear-surface-png-transparent-background_169300037.htm&docid=QOT3D0rOg-9_yM&tbnid=khCaY3mpzzm_4M&vet=12ahUKEwjVt_eygNSOAxU6nf0HHQztMy4QM3oECBIQAA..i&w=626&h=417&hcb=2&ved=2ahUKEwjVt_eygNSOAxU6nf0HHQztMy4QM3oECBIQAA',
    },
  ];

  CartPage({super.key});

  double getTotalPrice() {
    double total = 0;
    for (var item in cartItems) {
      total += item['price'];
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredItems = cartItems
        .where((item) => item['price'] > 8)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('MY CART'),
        centerTitle: true,
        leading: Navigator.canPop(context)
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Filtered Items',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteBloc,
              ),
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                final item = filteredItems[index];
                return Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade200,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.network(
                        item['image'],
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item['name'],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '\$${(item['price'] * 100).round() / 100}',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.green.shade700,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          Divider(height: 1),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  '\$${(getTotalPrice() * 100).round() / 100}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text('PAY'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
